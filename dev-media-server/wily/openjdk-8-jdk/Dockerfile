FROM buildpack-deps:wily-scm

# A few problems with compiling Java from source:
#  1. Oracle.  Licensing prevents us from redistributing the official JDK.
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#       really hairy.

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y openjdk-8-jdk gnupg && rm -rf /var/lib/apt/lists/*
