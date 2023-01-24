all: gurobi

MAJOR = 10
MINOR = 0
PATCH = 0
VERSION = $(MAJOR).$(MINOR).$(PATCH)
gurobi = gurobi$(VERSION)_linux64.tar.gz
TARBALL = build/$(gurobi)
TARBALL_URL = https://packages.gurobi.com/$(MAJOR).$(MINOR)/$(gurobi)
SOURCE_DIR = build/gurobi$(MAJOR)$(MINOR)$(PATCH)
MD5SUM = b9bde94fdc5037e51a36a7f5dd56a199
MD5SUM_ACTUAL = md5sum $(TARBALL) | cut -d ' ' -f 1
UNPACK_CMD = tar xzf
include $(shell rospack find mk)/download_unpack_build.mk

gurobi: $(SOURCE_DIR)/unpacked
	echo "$(MD5SUM) build/$(gurobi)" | md5sum --check

clean:
	-rm -rf $(SOURCE_DIR)

wipe: clean
	-rm -rf build