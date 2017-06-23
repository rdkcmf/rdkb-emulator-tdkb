##########################################################################
# If not stated otherwise in this file or this component's Licenses.txt
# file the following copyright and licenses apply:
#
# Copyright 2016 RDK Management
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################
#

#!/bin/bash

# Check whether the process is running
checkProcess()
{
    ps -ef | grep $processName | grep -v grep |grep -v checkProcess | awk '{ print $2}'
}

# Get the process ID and kill the process
killProcess()
{
   kill -9 `ps -ef | grep $processName | grep -v grep |grep -v killProcess | awk '{ print $2}'`
}

# Store the arguments to a variable
event=$1
processName=$2

# Invoke the function based on the argument passed
case $event in
   "checkProcess")
        checkProcess;;
   "killProcess")
        killProcess;;
   *) echo "Invalid Argument passed";;
esac
