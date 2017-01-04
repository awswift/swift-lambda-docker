FROM awswift/swift-deps:0.1
ARG AWS_REGION=ap-southeast-2

WORKDIR /
COPY swift-linux-x86_64-amzn.tgz .
RUN tar zxvf swift-linux-x86_64-amzn.tgz --skip-old-files
# the following line is pointless right now. see issue #1
RUN rm swift-linux-x86_64-amzn.tgz
ENV LD_LIBRARY_PATH /usr/lib
