# If (the right) Emacs isn't in your path, define the variable EMACS
# in localvars.mk.  e.g.
# EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
-include localvars.mk

ifndef EMACS_EXE
EMACS_EXE=`which emacs`
endif

EMACS_HOME=$(shell $(EMACS_EXE) --batch --eval "(princ user-emacs-directory)")


all: tangle

tangle:
	rm -rf build && \
	mkdir -p build && \
	$(EMACS_EXE) --batch \
	--visit=emacs-config.org \
	--eval "(progn (require 'ob) (cd \"build\") (org-babel-tangle))"

install: tangle
	mkdir -p $(EMACS_HOME)/config
	cp build/*.el $(EMACS_HOME)/config


test: tangle
	mkdir -p $(EMACS_HOME)/config-test
	cp build/*.el $(EMACS_HOME)/config-test

test-run: test
	EMACS_CONFIG_DIR=$(EMACS_HOME)/config-test EMACS_CONFIG_PROFILE=1 $(EMACS_EXE) --debug-init
	touch $(EMACS_HOME)/config-test/scratch.el
