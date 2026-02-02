savedcmd_/home/h00k/r00tk1t/mymodule.mod := printf '%s\n'   src/main.o src/net.o | awk '!x[$$0]++ { print("/home/h00k/r00tk1t/"$$0) }' > /home/h00k/r00tk1t/mymodule.mod
