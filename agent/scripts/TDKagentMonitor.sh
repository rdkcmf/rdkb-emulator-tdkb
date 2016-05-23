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

loop=1
sleep 60

# To monitor TDK Agent process and reboot box on its crash
while [ $loop -eq 1 ]
do
   status=`ps -ef | grep tdk_agent_monitor | grep -v grep`
   if [ ! "$status" ];
   then
       echo "TDK agent monitor crashed.. Box going for Reboot.."
       echo $(date) >> $TDK_PATH/monitorcrash.log
       sleep 10 && reboot
   fi
   sleep 5

done
