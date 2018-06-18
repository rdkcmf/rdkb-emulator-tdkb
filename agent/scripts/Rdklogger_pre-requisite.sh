#!/bin/bash
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

export LOG4C_RCPATH=/nvram/
export LOG_PATH=/rdklogs/logs/

cp /etc/log4crc $LOG4C_RCPATH

CONTENT='<rollingpolicy name="TEST_rollingpolicy" type="sizewin" maxsize="2097152" maxnum="2"/>\n<appender name="RI_TESTrollingfileappender" type="rollingfile" logdir="/rdklogs/logs/" prefix="TESTLog.txt" layout="comcast_dated" rollingpolicy="TEST_rollingpolicy"/>\n<category name="RI.TEST" priority="debug" appender="RI_TESTrollingfileappender"/>\n<category name="RI.Stack.TEST" priority="debug" appender="RI_TESTrollingfileappender"/>\n<category name="RI.Stack.LOG.RDK.TEST" priority="debug" appender="RI_TESTrollingfileappender"/>'

C=$(echo $CONTENT | sed 's/\//\\\//g' | sed 's/\"/\\\"/g')
sed -i "/<\/log4c>/ s/.*/${C}\n&/" $LOG4C_RCPATH/log4crc
