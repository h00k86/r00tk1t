savedcmd_/home/h00k/r00tk1t/mymodule.o := x86_64-linux-gnu-ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments   -r -o /home/h00k/r00tk1t/mymodule.o @/home/h00k/r00tk1t/mymodule.mod  ; ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --sls --static-call --uaccess --prefix=16  --link  --module /home/h00k/r00tk1t/mymodule.o

/home/h00k/r00tk1t/mymodule.o: $(wildcard ./tools/objtool/objtool)
