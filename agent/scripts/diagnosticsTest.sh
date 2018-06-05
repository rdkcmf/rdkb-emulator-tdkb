##########################################################################
# If not stated otherwise in this file or this component's Licenses.txt
# file the following copyright and licenses apply:
#
# Copyright 2018 RDK Management
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

#! /bin/bash

source /etc/tdk_platform.properties

echo "UPTIME:" >> /nvram/device_diagnostics.log
echo "--------" >> /nvram/device_diagnostics.log
uptime >> /nvram/device_diagnostics.log

echo -e "\nCCSP PROCESSESS RUNNING:" >> /nvram/device_diagnostics.log
echo "----------------------" >> /nvram/device_diagnostics.log

for process in $(echo $CCSP_PROCESS | sed "s/,/ /g")
do
    OUTPUT=$(top -b -n1 | grep $process | grep -v "grep")
    if [ $? -eq 0 ]; then
        echo $OUTPUT >> /nvram/device_diagnostics.log
    else
        echo "$process is not running" >> /nvram/device_diagnostics.log
    fi
done
