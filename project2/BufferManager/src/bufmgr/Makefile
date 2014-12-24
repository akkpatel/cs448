JDKPATH = /p/java
LIBPATH = ../../lib/bufmgrAssign.jar

CLASSPATH = $(JDKPATH)/lib/classes.zip:.:..:$(LIBPATH)
BINPATH = $(JDKPATH)/bin
JAVAC = $(JDKPATH)/bin/javac -classpath $(CLASSPATH)
JAVA  = $(JDKPATH)/bin/java  -classpath $(CLASSPATH)

PROGS = xx

all: $(PROGS)

bm:BufMgr.java
	$(JAVAC) BufMgr.java

xx : *.java
	$(JAVAC) *.java

yy:
	jar tf $(LIBPATH)
clean:
	\rm -f *.class *~ \#* core

