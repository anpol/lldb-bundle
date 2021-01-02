# lldb-bundle

A bundle of LLDB commands and formatters, from various sources.

This repository serves as a simple plugin manager for LLDB scripts.  You can
fork this repository if you wish to maintain your own set of plugins.

## Installation

Clone this repository, with submodules, into `~/.lldb/bundle`:
```sh
git clone --recurse-submodules https://github.com/anpol/lldb-bundle.git ~/.lldb/bundle
```

Initialize the plugins, build the required libraries:
```sh
cd ~/.lldb/bundle
make init
```

Then add the following line to your `~/.lldbinit` file.
```sh
command source ~/.lldb/bundle/lldb-init-bundle.lldb
```

## Developing Custom LLDB Scripts

### Development Environment

When developing custom LLDB scripts in Python, you need to establish a proper
development environment.  To make things simple, you can use the provided
[.envrc](.envrc) shell script.  Simply load it into your interactive shell:
```sh
source ./.envrc
```

This script creates and activates a Python virtual environment for the Python
interpreter used by LLDB on your system.

Once you activated the virtual environment, run:
```
make init
```
to install the required development tools.

### Development Worflow

You can use the following commands in your development workflow:

* `make init` -- initialize, install dependencies.
* `make format` -- reformat source code.
* `make lint` -- check code for bugs and style issues.
* `make test` -- run tests.

For a full list of commands, consult the provided [Makefile](Makefile).
