# Ashki Theme for Neovim

![Ashki Preview](https://github.com/nlkli/ashki.nvim/blob/main/preview.png)  

A minimal dark Neovim color scheme.

## Installation

```lua
vim.pack.add({ "https://github.com/nlkli/ashki.nvim" })
require("ashki").setup(opt)
require("ashki").load()
-- vim.cmd("colorscheme ashki")
```

### Using `lazy.nvim`

```lua
{
  "nlkli/ashki.nvim",
  config = function()
    require("ashki").load()
    -- vim.cmd("colorscheme ashki")
  end
}
```

### Setup Params

```lua
require("ashki").setup({ 
    soft = true, -- reduce contrast
    terminal = true, -- dont set terminal colors
    colors = { -- set custom colors
        void = "#080705",
        cursor = "#E8E8DF",
        -- ...
    } 
})
```

### Color Palette

| Name    | Hex     |                RGB |
| ------- | ------- | -----------------: |
| void    | #000000 |       rgb(0, 0, 0) |
| bg1     | #0A0908 |      rgb(10, 9, 8) |
| bg2     | #1D1B18 |    rgb(29, 27, 24) |
| bg3     | #302D28 |    rgb(48, 45, 40) |
| visual  | #201E1A |    rgb(32, 30, 26) |
| cursor  | #F0F7FA | rgb(240, 247, 250) |
| fg01    | #DCE9FB | rgb(220, 233, 251) |
| fg      | #D2D1D0 | rgb(210, 209, 208) |
| fg1     | #A6A4A2 | rgb(166, 164, 162) |
| fg2     | #7A7775 | rgb(122, 119, 117) |
| fg3     | #494949 |    rgb(73, 73, 73) |
| sline   | #4C4B49 |    rgb(76, 75, 73) |
| string  | #66A0A7 | rgb(102, 160, 167) |
| keyword | #A94646 |   rgb(169, 70, 70) |
| func    | #8E8EB4 | rgb(142, 142, 180) |
| ttype   | #C7C1A9 | rgb(199, 193, 169) |
| const   | #86A1CF | rgb(134, 161, 207) |
| red     | #9E4941 |   rgb(158, 73, 65) |
| green   | #336C62 |   rgb(51, 108, 98) |
| yellow  | #DEB65B |  rgb(222, 182, 91) |
| blue    | #748CAB | rgb(116, 140, 171) |
| violet  | #61587A |   rgb(97, 88, 122) |
| pink    | #BA86A4 | rgb(186, 134, 164) |

