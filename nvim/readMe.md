# NvimSetup

Much the smame as ond

**TODO:**

- Star integrating better luasnips
- Better documentation of keymaps

**Requirements:**

- a nerd font
- ripgrep
- xclip
- git
- make 
- fzf
- npm install global prettierd and prettier

Move config to ~/config/nvim and run ":Lazy install" to install all the dependencies.

run :Mason for installation of LSP servers

A step by step NVIM setup I'm working on.

Forked from [this repo](https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim)

## Keymaps

Mapleader set to space

### Keymaps normal mode

- leader sf = safe file
- leader sa = safe all files
- leader qf = quit file
- leader qa = quit all files
- leader + = increment number
- leader - = decrement number

** vim tree **

- leader e = toggle vimtree
- leader ec = collapse all vimtree
- leader eb = collapse all vimtree except for buffered files
- leader eo = jump to vimtree
- leader ef = jump to file im vimtree
- leader et = jump to file in vimtree and toggle

**Window management**

Moving in between windows

- Ctrl H J K L

- leader sn = split window vertically and open vim tree
- leader sv = split window vertically
- leader sh = split window horizontally
- leader se = split window equally
- leader sx = close current split window
- leader sm = toggle magimize window

- leader to = open new tab
- leader tx = close current tab
- leader tn = go to next tab
- leader tp = go to previous tab

### Keymaps insert mode

- jk = esc

### Keymaps visual mode

- shift j/k = Move code up and down
- leader y = copy to clipboard
