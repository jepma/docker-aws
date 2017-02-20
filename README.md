# Alpine AWS

## Installation

```bash
$ docker pull jispro/aws-cli:latest
```

## build

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
alias aws-cli='docker run --rm -ti -v $(pwd):/data:rw -w /data jepmam/aws-cli:0.0.5 $@'
```
