FROM alpine

LABEL builder="Andy's Automated Builds"
LABEL product="perl"
LABEL description="Testing perl build"
ARG PERLVER

COPY perlbuild.sh /tmp/perlbuild.sh
RUN /bin/sh /tmp/perlbuild.sh $PERLVER

WORKDIR /
