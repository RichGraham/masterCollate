# simple make file
# September 2004

SOURCES=masterCollate.c 
PRODUCT=$(HOME)/bin/masterCollate

#Get the hostname
HN:=$(hostname)

#default compiler settings
CC=gcc
CFLAGS=-lm -O2 -I$(NR)/include

#use icc on certain servers
ifeq ($(HN),lagavulin)
	CC=icc
endif

#login nodes for minerva
ifeq ($(HN),login01)
	CC=icc
endif

all: $(PRODUCT)

$(PRODUCT) : $(SOURCES)
	$(CC) $(CFLAGS) -o $(PRODUCT) $(SOURCES)
