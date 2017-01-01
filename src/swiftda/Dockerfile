FROM awswift/swift-deps:0.1
ARG AWS_REGION=ap-southeast-2

WORKDIR /
RUN curl -L https://awswift-${AWS_REGION}.s3.amazonaws.com/swift-linux-x86_64-amzn.tar.gz | tar -zxv --skip-old-files
ENV LD_LIBRARY_PATH /usr/lib
