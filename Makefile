MARKDOWN=/home/schelcj/perl5/bin
MAKEFILE ?= Makefile
.SUFFIXES : .txt .html

TXTFILES=$(wildcard *.txt)
HTMLFILES=$(TXTFILES:txt=html)

%.html: %.txt
	$(MARKDOWN)/MultiMarkdown.pl $*.txt > $*.html

# find and recurse into each subdirectory (but not current directory)
SUBDIRS := ${shell find -maxdepth 1 ${ROOT_DIRECTORY} -type d -print | tail -n +2}

# define our set of default targets to build:
all: $(HTMLFILES) $(SUBDIRS)
	@chmod 755 $(HTMLFILES)

.PHONY: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ -f ../$(MAKEFILE) MAKEFILE=../$(MAKEFILE)

clean:
	find ./ -name '*.html' -exec rm {} \;
