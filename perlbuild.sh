#!/bin/sh -e

#This script downloads and builds perl from source, it's run from inside the container
PERLVER=$1
apk update
apk add alpine-sdk curl wget

mkdir /usr/src
mkdir -p /opt/perl
echo "Building version ${PERLVER}"

curl http://www.cpan.org/src/5.0/perl-${PERLVER}.tar.gz > /usr/src/perl.tar.gz

cd /usr/src
tar xzf perl.tar.gz
if [ "$?" != "0" ]; then
	curl http://www.cpan.org/src/5.0/perl${PERLVER}.tar.gz > /usr/src/perl.tar.gz
        cd /usr/src
        tar xzf perl.tar.gz
        cd perl${PERLVER}
fi

cd perl-${PERLVER}
./Configure -des -Dprefix=/opt/perl -Dusedevel
make -j4 && make install

curl -L https://cpanmin.us | /opt/perl/bin/perl${PERLVER} - App::cpanminus
apk del alpine-sdk curl wget
rm -rf /usr/src/perl-${PERLVER}
for x in `ls /opt/perl/bin`; do ln -s /opt/perl/bin/$x /usr/bin/`echo $x | sed s/${PERLVER}//`; done
