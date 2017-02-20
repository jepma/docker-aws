# Alpine AWS

[![](https://images.microbadger.com/badges/image/jepmam/aws-cli.svg)](https://microbadger.com/images/jepmam/aws-cli "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/jepmam/aws-cli.svg)](https://microbadger.com/images/jepmam/aws-cli "Get your own version badge on microbadger.com")

## Description

This image is a wrapper for the Amazon command-line interface. The source of the `aws-cli` can be found [here](https://github.com/aws/aws-cli).

## Latest

The latest version is `0.0.7` and has a total size of 98MB.

## Installation

```bash
$ docker pull jepmam/aws-cli:latest
```

## Build

```bash
$ make docker-build
```

## Test

If you want to test whether everything is working fine and/or you want to use the current working version of your build, use the following command:

```bash
$ docker run -it --rm --name buildtest $(make get-buildname --quiet) --version
```

If you need access to the shell of the image, you can access it by using the following sequence:

```bash
$ docker run -it --rm --name buildtest --entrypoint=sh $(make get-buildname --quiet) -l
```

# Usage

Create alias in your `~/.bash_profile` to attach the `aws-cli` CLI onto the container.

```text
alias aws-cli='docker run --rm -ti -v $(pwd):/data:rw -w /data jepmam/aws-cli:latest $@'
```
