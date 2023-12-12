FROM ibm-semeru-runtimes:open-8u382-b05-jdk-jammy
# Others tried but did not work:
# FROM ibmjava:8-sdk
# FROM arm64v8/openjdk:8u121-jdk-alpine
# FROM vespaengine/vespa-pipeline:latest

COPY opencyc-4.0-linux.tgz /
RUN tar -zxf /opencyc-4.0-linux.tgz 
RUN rm /opencyc-4.0-linux.tgz
EXPOSE 3602
WORKDIR /opencyc-4.0/scripts
ENTRYPOINT /opencyc-4.0/scripts/run-cyc.sh

# Run like this:
# docker run -p3602:3602 -it --name=opencyc `pwd`

# This didn't work for me: 
# open http://localhost:3602/cgi-bin/cg?cb-start
# So try this instead:
# open http://localhost:3602/cgi-bin/cyccgi/cg?cb-start
