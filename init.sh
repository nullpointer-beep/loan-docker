#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
dataDir=$baseDir/database
softwares=$baseDir/softwares
registryName=dockerhub.qingcloud.com
imagename=chatopera/contact-center
TIMESTAMP=`date "+%Y%m%d.%H%M%S"`

# 打包cc.jar
tar czvf softwares/contact_center/cc.jar softwares/contact_center/cc

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
# prepare env
yum update -y & \
yum install -y git py-pip python-dev libffi-dev openssl-dev gcc libc-dev make


# installation docker env
cp $softwares/docker-19.03.9.tgz /opt
cd /opt
tar xzvf docker-19.03.9.tgz
ln -s /opt/docker/* /usr/bin
chmod +x /opt/docker/*

# run dockerd
dockerd > /opt/docker/run.log &


# run apps
docker-compose up -d