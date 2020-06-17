IPADDRESS=$(ip addr show $( netstat -rn | grep UG | awk -F' ' '{print $8}')\
    | grep -o 'inet [0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' \
    | grep -o [0-9].*)
docker image build \
    --rm \
    --build-arg IP=${IPADDRESS} \
    --build-arg XILINX_VER=2020.1 \
    --no-cache \
    -t xilinx${XILINX_VER} .
