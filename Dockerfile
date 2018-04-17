FROM alpine

LABEL builder="Andy's Automated Builds"
LABEL product="perl"
LABEL version="5.27.8"
LABEL description="Testing perl build"

RUN apk update
RUN apk add alpine-sdk curl wget
RUN mkdir /usr/src; mkdir -p /opt/perl; curl http://www.cpan.org/src/5.0/perl-5.27.8.tar.gz > /usr/src/perl.tar.gz

WORKDIR /usr/src
RUN tar xzf /usr/src/perl.tar.gz
WORKDIR /usr/src/perl-5.27.8
RUN /usr/src/perl-5.27.8/Configure -des -Dprefix=/opt/perl -Dusedevel
RUN cd /usr/src/perl-5.27.8; make -j4 && make install
RUN curl -L https://cpanmin.us | /opt/perl/bin/perl5.27.8 - App::cpanminus
RUN apk del alpine-sdk curl wget
RUN rm -rf /usr/src/perl-5.27.8
RUN rm -rf /var/cache/apk/*
RUN for x in `ls /opt/perl/bin`; do ln -s /opt/perl/bin/$x /usr/bin/`echo $x | sed s/5.27.8//`; done

WORKDIR /
