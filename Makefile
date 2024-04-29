main: flex main.c
	gcc main.c -c
	gcc -o etapa3 lex.yy.o parser.tab.o main.o

flex: bison scanner.l
	flex scanner.l
	gcc -c lex.yy.c

bison: parser.y
	bison -d parser.y
	gcc -c parser.tab.c

clean:
	rm -f *.o *.h etapa3 lex.yy.c parser.tab.c
