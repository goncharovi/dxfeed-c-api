FROM centos:6.10

RUN                                                                                                                \
     yum install -y wget                                                                                        && \
     wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo           && \
     yum install -y devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-binutils-devel                          && \
     yum install -y devtoolset-2-gcc-c++                                                                        && \
     wget https://github.com/Kitware/CMake/releases/download/v3.15.3/cmake-3.15.3-Linux-x86_64.sh               && \
     bash cmake-3.15.3-Linux-x86_64.sh --skip-license                                                           && \
     rm cmake-3.15.3-Linux-x86_64.sh                                                                            && \
     yum -y update && yum -y install epel-release && yum install -y p7zip p7zip-plugins                         && \
     yum install -y http://opensource.wandisco.com/centos/6/git/x86_64/wandisco-git-release-6-1.noarch.rpm      && \
     yum install -y git                                                                                         && \
     echo "DONE!!!"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
