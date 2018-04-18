FROM alpine

ARG PERLVER
LABEL builder="Andy's Automated Builds"
LABEL product="perl"
LABEL version=$PERLVER
LABEL description="Testing perl build"

COPY perlbuild.sh /tmp/perlbuild.sh
RUN /bin/sh /tmp/perlbuild.sh $PERLVER

WORKDIR /
