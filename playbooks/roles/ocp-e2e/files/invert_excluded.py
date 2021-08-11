#!/usr/libexec/platform-python
import sys
all_tests = set()
excluded_tests = set()
for l in sys.stdin.readlines():
	all_tests.add(l.strip())
with open(sys.argv[1], "r") as f:
	for l in f.readlines():
	    excluded_tests.add(l.strip())
test_suite = all_tests - excluded_tests
for t in test_suite:
	print(t)

