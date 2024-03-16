
# Meus Dotfiles

Eu possuo um notebook Dual Boot: Windows + ArchLinux


## Preparando o sistema

Entrar nas configurações de disco do Win10 e deixar separado a parte de disco que usaremos para o Arch Linux.
No meu caso, tenho 1T de memória, usaria 256G para o Arch.
Deixa as partições mais ou menos assim:

NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda      8:0    0 931,5G  0 disk 
├─sda1   8:1    0   100M  0 part 
├─sda2   8:2    0    16M  0 part 
├─sda3   8:3    0 674,9G  0 part 
├─sda4   8:4    0   532M  0 part 
└─sda5   8:6    0 256,0G  0 part

sendo as divições (sda1, sda2, sda3, sda4) -> win10; e (sda6) -> Arch Linux

Depois disso, precisamos criar um pendrive botável. E inicar o sistema por ele.

Já no Fakeroot do Pendrive com a imagem da Iso do Arch Linux vamos para os coamndos.

## Intalação do sistema

Primeiro de tudo, vamos nos certificar de estarmos usando o layout de teclas do teclado correto, no meu caso eu digito o comando: `loadkeys br-abnt2`

Segundo passo, precisamos acessar a internet, para isso usaremos o "iwctl"
seguindo o comando `iwctl` para entrar na cli do iwctl e depois digitar `station <seu device wifi> connect "<nome da rede>"` e digitarmos a senha.  Para saber se tudo deu certo usamos `ping www.archlinux.org`

Próximo passo, atualizar o instalador. `pacman -Syu`

Agora que estamos com o básico configurado, vamos separar o espaço em disco para o Arch.


