#!/bin/sh

echo "============================="
echo " install CDH4+HBase"
echo "============================="

wget http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm
yum -y --nogpgcheck localinstall cloudera-cdh-4-0.x86_64.rpm
rpm --import http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera 
sed -i -e 's#baseurl=http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/4/#baseurl=http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/4.3.0/#g' /etc/yum.repos.d/cloudera-cdh4.repo

yum install -y \
	hadoop-0.20-conf-pseudo \
	hbase hbase-master \
	hbase-regionserver \
	zookeeper zookeeper-server


