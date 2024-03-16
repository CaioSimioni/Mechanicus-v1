
# Meus Dotfiles

Eu possuo um notebook Dual Boot: Windows + ArchLinux


## Preparando o sistema

Entrar nas configurações de disco do Win10 e deixar separado a parte de disco que usaremos para o Arch Linux.
No meu caso, tenho 1T de memória, usaria 256G para o Arch.
Deixa as partições mais ou menos assim:

<p>NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS<br>
sda      8:0    0 931,5G  0 disk <br>
├─sda1   8:1    0   100M  0 part <br>
├─sda2   8:2    0    16M  0 part <br>
├─sda3   8:3    0 674,9G  0 part <br>
├─sda4   8:4    0   532M  0 part <br>
└─sda5   8:6    0 256,0G  0 part </p>

sendo as divições (sda1, sda2, sda3, sda4) -> win10; e (sda6) -> Arch Linux

Depois disso, precisamos criar um pendrive botável. E inicar o sistema por ele.

Já no Fakeroot do Pendrive com a imagem da Iso do Arch Linux vamos para os coamndos.

## Intalação do sistema

Primeiro de tudo, vamos nos certificar de estarmos usando o layout de teclas do teclado correto, no meu caso eu digito o comando: `loadkeys br-abnt2`

Segundo passo, precisamos acessar a internet, para isso usaremos o "iwctl"
seguindo o comando `iwctl` para entrar na cli do iwctl e depois digitar `station <seu device wifi> connect "<nome da rede>"` e digitarmos a senha.  Para saber se tudo deu certo usamos `ping www.archlinux.org`

Próximo passo, atualizar o instalador. `pacman -Syu`

Agora que estamos com o básico configurado, vamos separar o espaço em disco para o Arch.

Vamos usar o comando `cfdisk`, e deixar as partições do disco assim:

<p>NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS <br>
sda      8:0    0 931,5G  0 disk <br>
├─sda1   8:1    0   100M  0 part <br>
├─sda2   8:2    0    16M  0 part <br>
├─sda3   8:3    0 674,9G  0 part <br>
├─sda4   8:4    0   532M  0 part <br>
├─sda5   8:5    0   500M  0 part /boot <br>
└─sda6   8:6    0 255,5G  0 part / </p>

Agora, vamos atualizar o comando archinstall com `sudo pacman -S archinstall` e depois atualizar as KeyRings do Arch com `sudo pacman -S archlinux-keyring`

Agora finalmente vamos usar o comando `archinstall`.

O importante aqui é particionar corretamente o disco com sistemas de aquirvos "fat32" para o /boot e "ext4" para / .

Para o boot vamos selecionar o "Grub"

Perfil é o Desktop Hyprland, drives de vídeo certo, e sddm para gerenciamento de Login

Para o Audio vamos usar o Pulseaudio

Internet o NetworkManager

Pacotes adicionais: vim nano sudo git curl wget os-prober neofetch

Agora só clicar em instalar.  (Ufa!)



