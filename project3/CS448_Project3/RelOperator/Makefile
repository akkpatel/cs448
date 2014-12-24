JDKPATH = /usr
LIBPATH = lib/heap.jar:lib/bufmgr.jar:lib/index.jar:lib/diskmgr.jar

CLASSPATH = .:..:$(LIBPATH)
SRCPATH = $(JDKPATH)/src
BINPATH = $(JDKPATH)/bin
JAVAC = $(JDKPATH)/bin/javac 
JAVA  = $(JDKPATH)/bin/java 

PROGS = xx

all: $(PROGS)

compile:src/*/*.java
	$(JAVAC) -cp $(CLASSPATH) -d bin src/*/*.java

xx : compile
	$(JAVA) -cp $(CLASSPATH):bin tests.RelOperatorTest

clean:
	$(RM) *.class *~