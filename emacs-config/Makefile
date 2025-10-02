# If (the right) Emacs isn't in your path, define the variable EMACS
# in localvars.mk.  e.g.
# EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
-include localvars.mk

ifndef EMACS_EXE
EMACS_EXE=`which emacs`
endif

EMACS_HOME=$(shell $(EMACS_EXE) --batch --eval "(princ user-emacs-directory)")
# The current Org file containing the emacs config
EMACS_CONFIG_ORG=emacs-config-reboot-2025.org
# The "production" directory to install into
CONFIG_DIR=$(EMACS_HOME)/config_reboot
# The directory to install into for testing
TEST_DIR=$(EMACS_HOME)/config_test

# Previous emacs configs. I may build these for documentation purposes
# at some point; right now I'm not doing anything with them.
OLD_ECOS=emacs-config-old.org

all: tangle

tangle:
	rm -rf build && \
	mkdir -p build && \
	mkdir -p build/pg-modules && \
	$(EMACS_EXE) --batch \
	--visit=$(EMACS_CONFIG_ORG) \
	--eval "(progn (require 'ob) (cd \"build\") (org-babel-tangle))"

install: tangle
	mkdir -p $(CONFIG_DIR)
	cp -r build/* $(CONFIG_DIR)/


test: tangle
	mkdir -p $(TEST_DIR)
	cp -r build/* $(TEST_DIR)/

test-run: test
	touch $(TEST_DIR)/scratch.el
	EMACS_CONFIG_DIR=$(TEST_DIR) EMACS_CONFIG_PROFILE=1 $(EMACS_EXE) --debug-init
