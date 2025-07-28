My current personal Neovim Config, feel free to use it. 

Uses lazyinstall to install the package <br>
Use :checkhealth inside neovim to check error / missing package.

mapleader = " "

- Default Keybind 
    - J, K; In **VISUAL MODE** Moves selected lines up and down respectively
    - <, >; In **VIUSAL MODE** Moves selected lines left and right respectively
    - ctrl+c ; Clear search hightlight
    - space+s ; Replace current highlighted word globally
    - space+x ; Make current file executable (chmod +x)
    - space+t+o ; Open new tab
    - space+t+x ; Close current tab
    - space+t+f ; Duplicate current tab to a new tab
    - space+l+l ; Moves to the next tab
    - space+p+p ; Moves to the previous tab
    - space+s+v ; Split windows vertically
    - space+s+h ; Split windows horizontally
    - space+s+x ; Close split windows
    - space+f+p ; Copy file to clipboard
    - ctrl+j, ctrl+k, ctrl+h, ctrl+l ; Navigate split windows

- Snacks Keybind
    - space+l+g ; Open lazygit
    - space+g+l ; Open lazygit logs
    - space+r+N ; Rename current file
    - space+d+B ; Delete search buffer
    - space+f+f ; Find files in current directory
    - space+p+c ; Open neovim config directory
    - space+p+s ; Grep word
    - space+p+w+s ; Grep current highlighted word
    - space+g+s ; Pick and switch git branches
    - space+p+t ; Search Todo Comments
    - space+p+T ; Search specifically for TODO, FIX, and FIXME, comments

- Harpoon keybind
    - space+a ; Add current file to harpoon list
    - ctrl+e ; Open harpoon list
    - ctrl+y ; Jump to the first index in the harpoon list
    - ctrl+i ; Jump to the second index in the harpoon list
    - ctrl+n ; Jump to the third index in the harpoon list
    - ctrl+s ; Jump to the fourth index in the harpoon list
    - ctrl+S+P ; Jump to the previous file in harpoon list
    - ctrl+S+N ; Jump to the next file in harpoon list

- Mini
    - space+m+f ; Open MiniFiles explorer
    - space+e+f ; Open MiniFiles explorer in curent file path
    - s+a ; In **VISUAL MODE** add surrounding word with entered character
    - d+s ; In **VISUAL MODE** delete character that's surrounding word
    - s+r ; In **VISUAL MODE** replace character that's surrounding word
    - s+j ; Join already open brackets
    - s+k ; Opens enclosed brackets

- Oil
    - -; Open current directory
    - space+- ; Toggle float oil (open current directory)
