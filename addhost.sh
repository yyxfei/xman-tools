function PrintUsage() {

cat << EOT

Usage: $0 -c NodeConfFile -n NodeListFile

Parameters:

        -n | --nodes=NodeListFile

        -c | --conf=NodeConfFile

EOT
}


function MissingPar () {
   echo "Parameter is missing !" ;
   PrintUsage ;
   exit -1 ;
}


TEMP=`getopt -o n:c: --long NodeConfFile:,NodeListFile: -n YAIM -- "$@"`

if [ $? = 1 ] ; then PrintUsage; exit -1; fi
#echo $#
if [ $# -ne  4 ] ; then MissingPar; exit -1; fi

eval set -- "$TEMP"

while true ; do
  case "$1" in
    -h|--help) PrintUsage; exit 0 ;;
    -n|--nodes) mynode="$2"; shift 2;;
    -c|--conf) myconf="$2"; shift 2;;
    --) shift;break;;
   # *) echo "Internal error!" ; exit 1 ;;
  esac
done


if [ -f "${mynode}" ]; then
  if [ -f "${myconf}" ]; then
     . ${myconf}
     while read -r line
         do
           # skip null line
           nospace=`echo ${line}|tr -d ' '`
           if [ -z $nospace ]; then
             continue
           fi
           # skip line start with #
           HC=`echo ${line:0:1}`
           if [ $HC = "#" ]; then
             continue
           fi
           HOST_NAME=`echo ${line}|awk '{print $1}'`
           IP_ADD=`echo ${line}|awk '{print $2}'`
           MAC_ADD=`echo ${line}|awk '{print $3}'`
           echo "Create host ${HOST_NAME}"
           if [ -z "${PXE_LOAD}" ]; then
           #echo "hammer host create --name $HOST_NAME  --puppet-environment-id $ENV_ID --architecture-id $ARCH_ID --domain-id $DOMAIN_ID --puppet-proxy-id $PROXY_ID --operatingsystem-id $OS_ID --ip $IP_ADD --mac $MAC_ADD --hostgroup-id $HOSTGROUP_ID --subnet-id $SUBNET_ID --location-id 1 --organization-id 2 --partition-table-id $PTABLE_ID  --interface identifier=eth0,primary=true,provision=true --build true"
	  echo " hammer host create --name $HOST_NAME  --puppet-environment-id $ENV_ID --architecture-id $ARCH_ID --domain-id $DOMAIN_ID --puppet-proxy-id $PROXY_ID --operatingsystem-id $OS_ID --ip $IP_ADD --mac $MAC_ADD --hostgroup-id $HOSTGROUP_ID --subnet-id $SUBNET_ID --location-id 1 --organization-id 2 --partition-table-id $PTABLE_ID  --interface identifier=eth0,primary=true,provision=true --build true"
	  hammer host create --name $HOST_NAME  --puppet-environment-id $ENV_ID --architecture-id $ARCH_ID --domain-id $DOMAIN_ID --puppet-proxy-id $PROXY_ID --operatingsystem-id $OS_ID --ip $IP_ADD --mac $MAC_ADD --hostgroup-id $HOSTGROUP_ID --subnet-id $SUBNET_ID --location-id 1 --organization-id 2 --partition-table-id $PTABLE_ID  --interface identifier=eth0,primary=true,provision=true --build true

           else
	   #echo "hammer host create --name $HOST_NAME  --puppet-environment-id $ENV_ID --architecture-id $ARCH_ID --domain-id $DOMAIN_ID --puppet-proxy-id $PROXY_ID --operatingsystem-id $OS_ID --ip $IP_ADD --mac $MAC_ADD --hostgroup-id $HOSTGROUP_ID --subnet-id $SUBNET_ID --pxe-loader ${PXE_LOAD} --location-id 1 --organization-id 2 --partition-table-id $PTABLE_ID --interface identifier=eth0,primary=true,provision=true --build true"
           echo "hammer host create --name $HOST_NAME  --puppet-environment-id $ENV_ID --architecture-id $ARCH_ID --domain-id $DOMAIN_ID --puppet-proxy-id $PROXY_ID --operatingsystem-id $OS_ID --ip $IP_ADD --mac $MAC_ADD --hostgroup-id $HOSTGROUP_ID --subnet-id $SUBNET_ID --pxe-loader "${PXE_LOAD}" --location-id 1 --organization-id 2 --partition-table-id $PTABLE_ID --medium-id $MEDIUM_ID --interface identifier=eth0,primary=true,provision=true --build true"
           hammer host create --name $HOST_NAME  --puppet-environment-id $ENV_ID --architecture-id $ARCH_ID --domain-id $DOMAIN_ID --puppet-proxy-id $PROXY_ID --operatingsystem-id $OS_ID --ip $IP_ADD --mac $MAC_ADD --hostgroup-id $HOSTGROUP_ID --subnet-id $SUBNET_ID --pxe-loader "${PXE_LOAD}" --location-id 1 --organization-id 2 --partition-table-id $PTABLE_ID --medium-id $MEDIUM_ID --interface identifier=eth0,primary=true,provision=true --build true
           fi
#--medium-id 6 --ptable-id 10
         done < ${mynode}

  
  else
    echo "File ${myconf} does not exist"
  fi
else
  echo "File ${mynode} does not exist"
fi



#hammer host create \
#--name $HOST_NAME  \
#--environment-id $ENV_ID \
#--architecture-id $ARCH_ID \
#--domain-id $DOMAIN_ID \
#--puppet-proxy-id $PROXY_ID \
#--operatingsystem-id $OS_ID \
#--ip $IP_ADD \
#--mac $MAC_ADD \
#--hostgroup-id $HOSTGROUP_ID \
#--subnet-id $SUBNET_ID
