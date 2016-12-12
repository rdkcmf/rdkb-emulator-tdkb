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
#

#Setting up environment to run TDK
export TDK_PATH=/opt/TDK/
export PATH=$PATH:/usr/local/bin:$TDK_PATH
export TDK_LIB_PATH=$TDK_PATH/libs/
export LD_LIBRARY_PATH=$TDK_PATH/libs/:/usr/local/lib/:/usr/local/Qt/lib/:/mnt/nfs/lib:/mnt/nfs/bin/target-snmp/lib/:/mnt/nfs/bin:/usr/local/lib/sa:$LD_LIBRARY_PATH

export PATH HOME LD_LIBRARY_PATH
ulimit -c unlimited
echo "Going to start Agent"
cd $TDK_PATH/
sh TDKagentMonitor.sh &
./rdk_tdk_agent_process &
