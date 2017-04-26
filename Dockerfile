FROM alpine:edge
MAINTAINER "Marcel Jepma" <mjepma@xebia.com>

############################################################################
#
# 	AWS CLI Image
#
############################################################################

#### ---- Labels ---- ####
ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF \
     org.label-schema.vcs-url="https://github.com/jepma/docker-aws" \
     org.label-schema.name="AWS-CLI" \
     org.label-schema.version=0.1.0 \
     org.label-schema.description="AWS-CLI Image"


#### ---- Install and clean-up dependencies ---- ####
RUN	true && \
	apk add --no-cache --update \
  py-pip && \
  pip install virtualenv && \
  (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)


#### ---- CREATE USERS ---- ####
# -D = Don't use password, -h is homedir, -g is GECOS Field
RUN adduser -D aws -h /home/aws -g ''


#### ---- CONFIG ---- ####
# AWS CLI needs the PYTHONIOENCODING environment varialbe to handle UTF-8 correctly:
ENV PYTHONIOENCODING=UTF-8


#### ---- Install AWS ---- ####
USER aws
RUN \
    mkdir -p /home/aws/aws && \
    virtualenv /home/aws/aws/env && \
    ./home/aws/aws/env/bin/pip install awscli --no-cache-dir && \
    (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

USER root
RUN \
    ln -s /home/aws/aws/env/bin/aws /usr/local/bin/aws

USER aws

#### ---- Workdir ---- ####
WORKDIR /data


#### ---- Entrypoint ---- ####
ENTRYPOINT ["/home/aws/aws/env/bin/aws"]
CMD ["aws"]
