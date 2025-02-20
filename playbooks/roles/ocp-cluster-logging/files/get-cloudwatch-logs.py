import sys
import time
import boto3

def var_check(variable):
    if not variable:
        return "-1"
    else:
        return variable

# Variables
AWS_ACCESS_KEY_ID     = sys.argv[1] if var_check(sys.argv[1]) != "-1" else sys.exit("AWS access key ID is incorrect")
AWS_SECRET_ACCESS_KEY = sys.argv[2] if var_check(sys.argv[2]) != "-1" else sys.exit("AWS secret key is incorrect")
LOG_GP_PREFIX         = sys.argv[3] if var_check(sys.argv[3]) != "-1" else sys.exit("AWS CloudWatch log group prefix is incorrect")
AWS_REGION            = sys.argv[4] if var_check(sys.argv[4]) != "-1" else sys.exit("AWS CloudWatch region is incorrect")
OUTPUT_PAH            = sys.argv[5] if var_check(sys.argv[4]) != "-1" else sys.exit("Output Log path is not defined")
MAX_MINUTES           = 1
CLIENT = boto3.client('logs', aws_access_key_id = AWS_ACCESS_KEY_ID, aws_secret_access_key = AWS_SECRET_ACCESS_KEY, region_name = AWS_REGION)

# Get log groups from CloudWatch with the log group prefix
def get_log_group_names():
    log_group_names = []
    wait_count      = MAX_MINUTES * 6
    log_group_count = 3
    count           = 0

    try:
        response = CLIENT.describe_log_groups(logGroupNamePrefix = LOG_GP_PREFIX, limit=3)
        for log_gp in response['logGroups']:
            log_group_names.append(log_gp["logGroupName"])
        
        while len(log_group_names) < log_group_count and count < wait_count:
            time.sleep(10)
            response = CLIENT.describe_log_groups(logGroupNamePrefix = LOG_GP_PREFIX, limit=3)
            for log_gp in response['logGroups']:
                log_group_names.append(log_gp["logGroupName"])
            count = count + 1

        if len(log_group_names) == 0:
            raise Exception('No log groups found with log group prefix: '+ LOG_GP_PREFIX )
    except Exception as e: 
        print(e)
    return log_group_names

# Get log streams of all log groups
def get_log_streams():
    log_groups  = get_log_group_names()
    log_streams = dict()
    try:
        for log_group in log_groups:
            log_streams[log_group] = []
            stream_batch           = CLIENT.describe_log_streams(logGroupName = log_group, limit = 4)

            for stream in stream_batch['logStreams']:
                log_streams[log_group].append(str(stream["logStreamName"]))
            if len(log_streams[log_group]) == 0:
                raise Exception('No log streams found at log group: '+ log_group )
    except Exception as e: 
        print(e)
    return log_streams

# Get logs from CloudWatch and save it to the files
def get_logs():
    log_streams = get_log_streams()
    try:
        for gp_name in log_streams:
            filename = OUTPUT_PAH + "/cloudwatch/" + gp_name.split(LOG_GP_PREFIX)[-1][1:] + ".txt"

            with open(filename, 'w') as fp:
                for log_stream in log_streams[gp_name]:
                    response = CLIENT.get_log_events(
                        logGroupName  = gp_name,
                        logStreamName = str(log_stream),
                        limit=1,
                        startFromHead = False
                    )

                    for each_event in response['events']:
                        fp.write(str(each_event) + "\n")
    except Exception as e: 
        print(e)

# Delete the CloudWatch log groups
def delete_log_groups():
    log_groups = get_log_group_names()
    try:
        for log_group in log_groups:
            response = CLIENT.delete_log_group(logGroupName = log_group)

    except Exception as e: 
        print(e)
                    
if __name__ == "__main__":
    get_logs()
    delete_log_groups()
