EMACS ?= emacs
CASK ?= cask

# TODO a variable for lisp file name would be good.

all: test

test: clean
	${MAKE} integration
	${MAKE} unit
	${MAKE} compile
	${MAKE} integration
	${MAKE} unit
	${MAKE} clean

integration:
	${CASK} exec ecukes --no-win

unit:
	${CASK} exec ert-runner

compile:
	${CASK} exec ${EMACS} -Q -batch -f batch-byte-compile rspec-focus.el

clean:
	rm -f rspec-focus.elc

.PHONY:	all test integration unit
