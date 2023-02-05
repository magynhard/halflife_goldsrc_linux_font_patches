# Half-Life (GoldSrc) Linux Font Patches
Patch unreadable fonts on Half-Life 1 (GoldSrc) based games on Linux.

![image](https://user-images.githubusercontent.com/14541962/215915153-32132781-630f-4c4f-a0d1-e7f4fa533378.png)

![image](doc/ingame_dust.gif)

![image](doc/ingame_main_menu.gif)



### There are patches available for
* Counter-Strike 1.6
* Day of Defeat 1.2


### How the patch works

At first it will install a free, readable font similar to the original one. Then it will add a additional scheme file to the game without touching any existing original file. The scheme refers to the installed font as well as using fonts from the *Liberation* font family.

# Installation
## Automatic installer
### Install
Run
```bash
\curl -sSL https://raw.githubusercontent.com/magynhard/halflife_goldsrc_linux_font_patches/master/setup.sh | ACTION=install bash
```
in your terminal to run the automatic installer script.

### Uninstall
To uninstall you can run the following command:

```bash
\curl -sSL https://raw.githubusercontent.com/magynhard/halflife_goldsrc_linux_font_patches/master/setup.sh | ACTION=uninstall bash
```

## Additional improvements
To get symbol icons working well (when using spectator mode and its dropdowns), you need to install the MS fonts package of your linux distribution.

The symbol fonts name is `Marlett`. It is included in the following packages:

| Distribution | Package             | Info                |
|--------------|---------------------|---------------------|
| Ubuntu | `ttf-mscorefonts-installer`                    | `sudo apt install ttf-mscorefonts-installer` |
| Arch / Manjaro | `ttf-ms-win11-auto` | AUR repository      |