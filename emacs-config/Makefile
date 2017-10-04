# If (the right) Emacs isn't in your path, define the variable EMACS
# in localvars.mk.  e.g.
# EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
-include localvars.mk

ifndef EMACS
EMACS=`which emacs`
endif

ifndef PANDOC
PANDOC=`which pandoc`
endif


EMACS_HOME=$(shell $(EMACS) --batch --eval "(princ user-emacs-directory)")


all: tangle

tangle:
	rm -rf build && \
	mkdir -p build && \
	$(EMACS) --batch \
	--visit=emacs-config.org \
	--eval "(progn (require 'ob) (cd \"build\") (org-babel-tangle nil \"init.el\"))"

install: tangle
	mkdir -p $(EMACS_HOME)/config
	cp build/*.el $(EMACS_HOME)/config
