# Ashki Theme for Neovim

Ashki is a dark, minimal color scheme for Neovim with soft contrast and vibrant syntax highlighting, designed for readability and comfort during long coding sessions.

## Preview

![Ashki Preview](https://github.com/nlkli/ashki.nvim/blob/main/preview.png)  

## Installation

```lua
vim.pack.add({ "https://github.com/nlkli/ashki.nvim" })
require("ashki").setup(opt)
vim.cmd("colorscheme ashki")
```

### Using `lazy.nvim` or `packer.nvim`

```lua
{
  "nlkli/ashki.nvim",
  config = function()
    vim.cmd("colorscheme ashki")
  end
}
```

# Ashki Theme Color Palette

| Color       | Hex      | Preview |
|------------|----------|---------|
| void       | #000000  | <span style="background-color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| bg1        | #0A0908  | <span style="background-color:#0A0908;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| bg2        | #1D1B18  | <span style="background-color:#1D1B18;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| bg3        | #302D28  | <span style="background-color:#302D28;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| visual     | #201E1A  | <span style="background-color:#201E1A;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| cursor     | #F0F7FA  | <span style="background-color:#F0F7FA;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| fg01       | #DCE9FB  | <span style="background-color:#DCE9FB;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| fg         | #d2d1d0  | <span style="background-color:#d2d1d0;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| fg1        | #A6A4A2  | <span style="background-color:#A6A4A2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| fg2        | #7A7775  | <span style="background-color:#7A7775;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| fg3        | #494949  | <span style="background-color:#494949;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| sline      | #4C4B49  | <span style="background-color:#4C4B49;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| string     | #66A0A7  | <span style="background-color:#66A0A7;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| keyword    | #A94646  | <span style="background-color:#A94646;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| func       | #8E8EB4  | <span style="background-color:#8E8EB4;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| ttype      | #c7c1a9  | <span style="background-color:#c7c1a9;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| const      | #86A1CF  | <span style="background-color:#86A1CF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| red        | #9E4941  | <span style="background-color:#9E4941;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| green      | #336C62  | <span style="background-color:#336C62;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| yellow     | #DEB65B  | <span style="background-color:#DEB65B;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| blue       | #748cab  | <span style="background-color:#748cab;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| violet     | #61587A  | <span style="background-color:#61587A;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| pink       | #BA86A4  | <span style="background-color:#BA86A4;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |

