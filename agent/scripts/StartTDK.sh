#!/bin/bash

#
# ============================================================================
# COMCAST C O N F I D E N T I A L AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of Comcast.  It may
# not be used, copied, distributed or otherwise  disclosed in whole or in part
# without the express written permission of Comcast.
# ============================================================================
# Copyright (c) 2014 Comcast. All rights reserved.
# ============================================================================
#

#Setting up environment to run TDK
export TDK_PATH=/opt/TDK/
export RDK_LOG_PATH=/opt/logs
export PATH=$PATH:/usr/local/bin:$TDK_PATH
export TDK_LIB_PATH=$TDK_PATH/libs/
export OPENSOURCETEST_PATH=$TDK_PATH/opensourcecomptest/
chmod 777 -R $TDK_PATH/opensourcecomptest/
export LD_LIBRARY_PATH=$TDK_PATH/libs/:/usr/local/lib/:/usr/local/Qt/lib/:/mnt/nfs/lib:/mnt/nfs/bin/target-snmp/lib/:/mnt/nfs/bin:/usr/local/lib/sa:$LD_LIBRARY_PATH
export GST_PLUGIN_PATH=$GST_PLUGIN_PATH:/lib/gstreamer-0.10:/usr/local/lib/gstreamer-0.10:/mnt/nfs/gstreamer-plugins
export GST_REGISTRY=$:/home/.gst-registry.dat
export XDISCOVERY_PATH=/etc/

#Setting up environment to run rmfApp
export PFC_ROOT=/
export VL_ECM_RPC_IF_NAME="wan"
export VL_DOCSIS_DHCP_IF_NAME="wan"
export VL_DOCSIS_WAN_IF_NAME="wan:1"

#Setting up environment for log4c configuration
#export LOG4C_RCPATH=/mnt/nfs/env
export LOG4C_RCPATH=/etc

GST_PLUGIN_PATH=/lib/gstreamer-0.10:/usr/local/lib/gstreamer-0.10:/mnt/nfs/gstreamer-plugins
export GST_PLUGIN_PATH GST_PLUGIN_SCANNER GST_REGISTRY
export PATH HOME LD_LIBRARY_PATH
ulimit -c unlimited
echo "Going to system data details script "
sh sysDataDetails.sh > trDetails.log
echo "Going to start Agent"
cd $TDK_PATH/
#copying sidb.xml from /usr/bin to TDK_PATH
cp /usr/bin/sidb.xml $TDK_PATH
sh TDKagentMonitor.sh &
./rdk_tdk_agent_process
