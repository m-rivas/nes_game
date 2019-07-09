NAME = hello
SOURCE = crt0
EMULATOR = fceux

build:
	cc65 -Oirs $(NAME).c --add-source
	ca65 $(SOURCE).s
	ca65 $(NAME).s -g
	ld65 -C nrom_32k_vert.cfg -o $(NAME).nes $(SOURCE).o $(NAME).o nes.lib -Ln labels.txt
#	ca65 reset.s
#	ld65 -C $(NAME).cfg -o $(NAME).nes reset.o $(NAME).o nes.lib

clean:
	rm -f ./$(NAME).s
	rm -f ./*.o
	rm -f ./$(NAME).nes

play: $(NAME).nes
	$(EMULATOR) $(NAME).nes
