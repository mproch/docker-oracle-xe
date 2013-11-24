FROM ubuntu

MAINTAINER mpr@touk.pl

#install all necessary packages
RUN apt-get update

RUN apt-get -y install libaio1

RUN apt-get -y install net-tools

RUN apt-get -y install bc

#resolve some stupid link conflits
RUN ln -s /usr/bin/awk /bin/awk

RUN mkdir /var/lock/subsys

ADD chkconfig /sbin/chkconfig

RUN chmod 755 /sbin/chkconfig

RUN ln -s /proc/mounts /etc/mtab

#env for oracle
ENV ORACLE_SID XE

ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe

#install packages
ADD ./oracle-xe_11.2.0-2_amd64.deb /tmp/oracle-xe_11.2.0-2_amd64.deb

RUN dpkg --install /tmp/oracle-xe_11.2.0-2_amd64.deb

#change memory_target
ADD ./init.ora /u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora

ADD ./initXETemp.ora /u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora

#final configuration
RUN /usr/bin/printf 8080\\n1521\\nsa\\nsa\\ny\\n | /etc/init.d/oracle-xe configure

EXPOSE 1521

