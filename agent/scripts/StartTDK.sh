#!/bin/bash

#
# ============================================================================
# COMCAST C O N F I D E N T I A L AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of Comcast.  It may
# not be used, copied, distributed or otherwise  disclosed in whole or in part
# without the express written permission of Comcast.
# ============================================================================
# Copyright (c) 2016 Comcast. All rights reserved.
# ============================================================================
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
./rdk_tdk_agent_process
