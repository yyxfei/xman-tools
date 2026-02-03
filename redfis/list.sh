LLLL=`cat $1`
#echo $LLLL
## $1 is BMC ip list file
## pip3 install redfishtool
for hhost in $LLLL
do
  echo " -------------------------------------------------"
  echo " ##    $hhost   ##"

  #redfishtool  -u root -p calvin -r $hhost Systems get |grep -i "BootSourceOverrideMode"|grep -i uefi
  #if [ $? != 0 ]
  #then 
  #  echo "$hhost error" >> error.uefi
  #fi
 
  #mac=`redfishtool  -u root -p calvin -r $hhost raw GET "/redfish/v1/Systems/System.Embedded.1/EthernetInterfaces/NIC.Integrated.1-1-1" |grep PermanentMACAddress |awk '{print $2}' |awk -F\" '{print $2}'`
  #mac=`redfishtool  -u root -p calvin -r $hhost raw GET "/redfish/v1/Systems/System.Embedded.1/EthernetInterfaces/NIC.Slot.4-1-1" |grep PermanentMACAddress |awk '{print $2}' |awk -F\" '{print $2}'`
  #mac=`redfishtool  -u root -p calvin -r $hhost raw GET "/redfish/v1/Systems/System.Embedded.1/EthernetInterfaces//NIC.Mezzanine.3-1-1" |grep PermanentMACAddress |awk '{print $2}' |awk -F\" '{print $2}'`
  #redfishtool  -u root -p calvin -r $hhost raw GET "/redfish/v1/Systems/System.Embedded.1/EthernetInterfaces/"
  # For shuguang machine
  #mac=`redfishtool  -u admin -p admin -r $hhost raw GET "/redfish/v1/Systems/1/EthernetInterfaces/OutboardNIC0Port0" |grep PermanentMACAddress |awk '{print $2}' |awk -F\" '{print $2}'`


  ### LENOVO:

  #mac=`redfishtool  -u USERID -p Passw0rd! -r $hhost raw GET  "/redfish/v1/Chassis/1/NetworkAdapters/slot-1/Ports/2" |grep -A 1 Associ |grep -v Associ |awk -F\" '{print $2}'`
  #mac=`redfishtool  -u Administrator -p Admin@9000 -r $hhost raw GET  "/redfish/v1/Chassis/1/NetworkAdapters/RiserCard1PCIeCard1(MCX4121A-ACAT)/NetworkPorts/1" |grep -A 1 Associ |grep -v Associ |awk -F\" '{print $2}'`
 #mac=`redfishtool  -u Administrator -p Admin@9000 -r $hhost raw GET "/redfish/v1/Systems/1/EthernetInterfaces/MainboardOCPCard1(E810XXVDA2OCP3G)Port1"|grep PermanentMACAddress |awk -F\" '{print $4}'`
  #mac=`redfishtool -u admin -p admin -r $hhost raw GET "/redfish/v1/Chassis/1/NetworkAdapters/outboardPCIeCard0/NetworkPorts/1" |python3 -c "import sys, json; print(json.load(sys.stdin)['AssociatedNetworkAddresses'])"`
  #mac=`redfishtool -u user -p pass -r $hhost raw GET "/redfish/v1/Chassis/1/NetworkAdapters/NIC_Slot1_CPU0/NetworkPorts/1" |python3 -c "import sys, json; print(json.load(sys.stdin)['AssociatedNetworkAddresses'])"`
 # mac=`redfishtool -u user -p pass -r $hhost raw GET "/redfish/v1/Chassis/1/NetworkAdapters/NIC_RiserB_Slot2/NetworkPorts/1" |python3 -c "import sys, json; print(json.load(sys.stdin)['AssociatedNetworkAddresses'])"`
  #echo "$hhost $mac" >> mac.list
done
