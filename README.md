# About
This neovim theme is heavily inspired by (gruber-darker)[https://github.com/rexim/gruber-darker-theme] theme
but I wanted to only highlight keywords with the same color pallete.

# Sceenshot

# Installation
Lazy:
```
{
    "ring0-rootkit/ring0-dark.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
        vim.cmd.colorscheme("ring0dark")
    end,
},
```

# Note
This plugin is really simple, feel free to fork it and change colors however you want, or maybe even send your pull request to make this theme better.
P.S.: if you want to know what color type specific word has just put your cursor on the word you wanna check and write `:Inspect`
