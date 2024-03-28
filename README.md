
# Meus Dotfiles Arch Linux em Dual Boot

1. [Preview](#preview)
2. [Arch Linux - Configs](#configs)
3. [Jogos](#games)
4. [Preparando o sistema Dual Boot](#prepare)
5. [Intalação do Arch Linux - archinstall](#install)
6. [Primeiro contato com o Arch Linux e o Hyprland](#first-boot)

<div id="preview" />

## Preview

![Preview da tela principal.](https://github.com/CaioSimioni/dotfiles/blob/main/diversos/preview.png)

<div id="configs" />

## Arch Linux configs

<p>
OS: Arch Linux<br>
Kernel: 6.8.1-arch1-1<br>
AUR mng: yay & pacseek<br>
Audio: Pipewire<br>
Firewall: ufw<br>
Desktop: Hyprland<br>
Wallpaper: Hyprpaper<br>
Terminal: Kitty<br>
Shell: zsh - oh-my-zsh<br>
Launcher: Rofi - @lbonn<br>
Notifications: dunst<br>
Bar: Waybar<br>
Editor: NeoVim - NvChad<br>
Browser: Firefox & Tor<br>
File: Thunar<br>
Theme: Tokyonight<br>
Icons: Papirus-Darki<br>
Grub-theme: Vimix<br>
SDDM-theme: archlinux<br>
</p>

<div id="games" />

## Jogos

Minecraft: [aur PrismLauncher](https://aur.archlinux.org/packages/prismlauncher)<br> 
Steam: [multilib Steam](https://wiki.archlinux.org/title/Steam_(Portugu%C3%AAs))<br>
Osu!: [osu-wine](https://osu.ppy.sh/community/forums/topics/1248084?n=1)

<div id="prepare" />

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

<div id="install">

## Intalação do Arch Linux - archinstall

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

<div id="first-boot" />

## Primeiro contato com o Arch Linux e o Hyprland

Quando entrar no sistema pela primeira vez, vamos nos conectar na Internet usando "nmcli" com `sudo nmcli dev wifi connect network-ssid password "network-password"`

Atualizar o sistema: `sudo pacman -Syu`

Vamos garantir que o Windows também está podendo ser utilizado. Para isso vamos usar o "os-prober" + "grub"

`sudo os-prober`

`sudo mkdir /mnt/win10`

`sudo mount /dev/sda1 /mnt/win10` Lembrando que "/dev/sda1" é o boot do windows

`sudo os-prober`

`sudo grub-mkconfig -o /boot/grub/grub.cfg`

`sudo vim /etc/default/grub` Vamos descomentar a seguinte linha:

GRUB_DISABLE_OS_PROBER = false

`grub-mkconfig -o /boot/grub/grub.cfg`

`reboot`

No boot agora é para aparecer a opção de iniciar com o Arch ou com o Windows

