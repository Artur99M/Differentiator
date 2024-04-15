CC = g++
D = -DDEBUG
ALLOBJFILES = obj/readfile.o obj/tree.o obj/main.o obj/Diff.o obj/SimpleTreeExp.o obj/graphviz.o obj/Get.o obj/TeX.o obj/read.o obj/readtext.o obj/txtdtor.o
ALLCPPFILES = Tree1/src/tree.cpp src/main.cpp src/Diff.cpp src/SimpleTreeExp.cpp src/TeX.cpp Onegin/txtdtor.cpp Onegin/readtext.cpp src/read.cpp src/Get.cpp src/graphviz.cpp

all: $(ALLOBJFILES)

app :
	./Diff.out
obj/readfile.o : DEBUG/def.h Tree1/src/readfile.cpp Tree1/header/readfile.h Tree1/header/tree.h header/TREE_EXP.h
	$(CC) -c Tree1/src/readfile.cpp -o obj/readfile.o

obj/tree.o : DEBUG/def.h Tree1/src/tree.cpp Tree1/header/tree.h header/TREE_EXP.h
	$(CC) -c Tree1/src/tree.cpp -o obj/tree.o

obj/main.o : src/main.cpp Tree1/header/tree.h Tree1/header/readfile.h header/SimpleTreeExp.h
	$(CC) -c src/main.cpp -o obj/main.o

obj/Diff.o : DEBUG/def.h src/Diff.cpp header/Diff.h Tree1/src/tree.cpp Tree1/header/tree.h header/TREE_EXP.h
	$(CC) -c src/Diff.cpp -o obj/Diff.o

obj/SimpleTreeExp.o: DEBUG/def.h src/SimpleTreeExp.cpp header/SimpleTreeExp.h Tree1/header/tree.h
	$(CC) -c src/SimpleTreeExp.cpp -o obj/SimpleTreeExp.o

obj/TeX.o: src/TeX.cpp header/TeX.h header/TREE_EXP.h DEBUG/def.h Tree1/header/tree.h
	$(CC) -c src/TeX.cpp -o obj/TeX.o

obj/graphviz.o: src/graphviz.cpp header/TREE_EXP.h header/graphviz.h Tree1/header/tree.h
	$(CC) -c src/graphviz.cpp -o obj/graphviz.o

obj/Get.o: src/Get.cpp header/Get.h header/TREE_EXP.h Tree1/header/tree.h header/Diff.h header/SimpleTreeExp.h DEBUG/def.h
	$(CC) -c src/Get.cpp -o obj/Get.o

obj/read.o: src/read.cpp header/read.h Onegin/header/readtext.h DEBUG/def.h Onegin/header/text.h
	$(CC) -c src/read.cpp -o obj/read.o

obj/readtext.o: Onegin/readtext.cpp
	$(CC) -c Onegin/readtext.cpp -o obj/readtext.o

obj/txtdtor.o: Onegin/txtdtor.cpp
	$(CC) -c Onegin/txtdtor.cpp -o obj/txtdtor.o

run : $(ALLOBJFILES)
	$(CC) $(ALLOBJFILES) -o Diff.out

dot:
	dot graphviz/Tree -O
	dot graphviz/Tree3 -O

deb:
	$(CC) $(D) $(ALLCPPFILES)

clean :
	rm *.out obj/*.o
