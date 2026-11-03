# OCP Resize MachineSet Automation

## Overview

This role automates validation of MachineSet resize operations on an OpenShift IPI cluster running on PowerVS.

The role creates a dedicated worker MachineSet (`worker2`) if it does not already exist, executes resize validation testcases, performs cluster health checks, and cleans up resources after execution.

---

## Features

- Automatic worker2 MachineSet creation by cloning the existing worker MachineSet.
- Reuses existing worker2 MachineSet if already present.
- Validates Machine creation.
- Validates Node Ready status.
- Validates cluster health.
- Cleanup after testcase execution.
- Supports execution of individual testcases.

---

## Positive Testcases

| Testcase | Memory (GiB) | Processor |
|-----------|-------------|------------|
| recommended_32gb | 32 | 0.5 |
| memory_0 | 0 | 0.5 |
| memory_24gb | 24 | 0.5 |
| memory_84gb | 84 | 0.5 |

---

## Negative Testcases

| Testcase | Memory (GiB) | Processor |
|-----------|-------------|------------|
| negative_memory | -32 | 0.5 |
| negative_processor | 32 | -2 |
| max_invalid_values | 150000 | 200 |

Negative testcases are validated by ensuring machines do not reach the Running state.

---

## Variables

### defaults/main.yml

```yaml
namespace: openshift-machine-api

desired_replicas: 1

run_testcase: all



---

## Running All Testcases

```bash
ansible-playbook playbooks/ocp-resize-machineset.yml
```

---

## Running a Single Testcase

### Recommended Memory

```bash
ansible-playbook playbooks/ocp-resize-machineset.yml \
-e run_testcase=recommended_32gb
```

### Memory 0

```bash
ansible-playbook playbooks/ocp-resize-machineset.yml \
-e run_testcase=memory_0
```

### Memory 24GB

```bash
ansible-playbook playbooks/ocp-resize-machineset.yml \
-e run_testcase=memory_24gb
```

### Memory 84GB

```bash
ansible-playbook playbooks/ocp-resize-machineset.yml \
-e run_testcase=memory_84gb
```

### Negative Memory

```bash
ansible-playbook playbooks/ocp-resize-machineset.yml \
-e run_testcase=negative_memory
```

### Negative Processor

```bash
ansible-playbook playbooks/ocp-resize-machineset.yml \
-e run_testcase=negative_processor
```

### Invalid Maximum Values

```bash
ansible-playbook playbooks/ocp-resize-machineset.yml \
-e run_testcase=max_invalid_values
```

---

## Workflow

```text
Cluster Health Check
        ↓
Create worker2 MachineSet (if not present)
        ↓
Patch MachineSet with testcase values
        ↓
Scale MachineSet
        ↓
Validate Machine State
        ↓
Validate Node State
        ↓
Validate Cluster Health
        ↓
Display PASS/FAIL Result
        ↓
Cleanup Resources
```

---

## Sample Output

### Positive Testcase

```text
PASS - memory_84gb (Memory=84GiB, Processor=0.5)
```

### Negative Testcase

```text
PASS - negative_memory (Machine did not reach Running state)
```

---

## Cleanup

After each testcase execution:

- MachineSet is scaled back to zero replicas
- Machines are deleted
- Cluster health is validated

This ensures each testcase starts from a clean state.
