Docker build scripts
========

Prerequisites
-----

- Working docker installation

How to use
-----

1. Clone the repo
2. Run `dockerbuild.sh {perl-version-to-build}`. {perl-version-to-build} can be anything from http://www.cpan.org/src/5.0/ that starts with perl-
3. Your resultant image will be built and tagged as andyg42/perl:{perl-version}. A simple edit to `dockerbuild.sh` will change the repo name
4. Use this image as a base to run your script from
