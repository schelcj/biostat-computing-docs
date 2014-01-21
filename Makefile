MARKDOWN=/home/schelcj/bin
MAKEFILE ?= Makefile
.SUFFIXES : .txt .html

TXTFILES=$(wildcard *.txt)
HTMLFILES=$(TXTFILES:txt=html)

%.html: %.txt
	$(MARKDOWN)/multimarkdown $*.txt > $*.html
	chmod 755 $*.html

# find and recurse into each subdirectory (but not current directory)
SUBDIRS := ${shell find -maxdepth 1 ${ROOT_DIRECTORY} -type d -print | grep -v '.git' | tail -n +2}

# define our set of default targets to build:
all: $(HTMLFILES) $(SUBDIRS)

.PHONY: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ -f ../$(MAKEFILE) MAKEFILE=../$(MAKEFILE)

#clean:
#	find ./ -name '*.html' -exec rm {} \;
#
cluster_modules_desc:
	ssh bajor /home/software/lucid/biostat/bin/get_module_desc.sh > cluster/modules.txt

compute_modules_desc:
	ssh jerido /usr/local/biostat/bin/get_module_desc.sh > compute_servers/modules.txt
