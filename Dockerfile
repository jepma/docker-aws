FROM alpine:edge
MAINTAINER "Marcel Jepma" <m.jepma@jispro.nl>

############################################################################
#
# 	Jispro AWS CLI Image
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
  py-pip \
  && pip install awscli --no-cache-dir && \
  (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

#### ---- Workdir ---- ####

WORKDIR /data

#### ---- Entrypoint ---- ####

ENTRYPOINT ["aws"]
