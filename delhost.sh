function PrintUsage() {

cat << EOT

Usage: $0  -n NodeListFile

Parameters:

        -n | --nodes=NodeListFile


EOT
}


function MissingPar () {
   echo "Parameter is missing !" ;
   PrintUsage ;
   exit -1 ;
}


TEMP=`getopt -o n: --long NodeListFile: -n YAIM -- "$@"`

if [ $? = 1 ] ; then PrintUsage; exit -1; fi
#echo $#
if [ $# -ne  2 ] ; then MissingPar; exit -1; fi

eval set -- "$TEMP"

while true ; do
  case "$1" in
    -h|--help) PrintUsage; exit 0 ;;
    -n|--nodes) mynode="$2"; shift 2;;
    --) shift;break;;
   # *) echo "Internal error!" ; exit 1 ;;
  esac
done


if [ -f "${mynode}" ]; then
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
           echo "Delete host ${HOST_NAME}"
           hammer host delete --name $HOST_NAME  
         done < ${mynode}

  
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

