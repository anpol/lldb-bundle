# This file is to support the development workflow.
#
# Use `make <tool>` command to run a development tool.  Normally you should
# start with `make init` before doing everything else.
#
# Workflow commands:
#
# - `make init`: install dependencies, init submodules, build libraries.
# - `make format`: reformat source code according to style.
# - `make lint`: check source code for issues.
# - `make test`: run tests against installed packages.
# - `make dists`: create distribution packages.

SUBMODULES = \
	lldb-command-script-utils \
	lldb-fmtlog \

.PHONY: all format lint test \
	init build-fbchisel \
	dists

all: format lint test

init:
	find $(SUBMODULES) -maxdepth 1 -name Makefile -execdir $(MAKE) init \;
	$(MAKE) build-fbchisel

# fbchisel has `findinstances` command that requires a native framework,
# and we need to build it in the same way as described for Homebrew:
# https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/chisel.rb
build-fbchisel:
	$(MAKE) -C fbchisel/Chisel install PREFIX="$(CURDIR)/lib" \
		LD_DYLIB_INSTALL_NAME="$(CURDIR)/lib/Chisel.framework/Chisel"


format:
	find $(SUBMODULES) -maxdepth 1 -name Makefile -execdir $(MAKE) format \;
	! hash yapf || yapf -i .*.py

lint:
	find $(SUBMODULES) -maxdepth 1 -name Makefile -execdir $(MAKE) lint \;
	! hash shellcheck || shellcheck .envrc

test:
	find $(SUBMODULES) -maxdepth 1 -name Makefile -execdir $(MAKE) test \;

dists:
	find $(SUBMODULES) -maxdepth 1 -name Makefile -execdir $(MAKE) dists \;
