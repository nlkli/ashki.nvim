# Ashki Theme for Neovim

Ashki is a dark, minimal color scheme for Neovim with soft contrast and vibrant syntax highlighting.

## Preview

![Ashki Preview](https://github.com/nlkli/ashki.nvim/blob/main/preview.png)  

## Installation

```lua
vim.pack.add({ "https://github.com/nlkli/ashki.nvim" })
require("ashki").setup(opt)
vim.cmd("colorscheme ashki")
```

### Using `lazy.nvim`

```lua
{
  "nlkli/ashki.nvim",
  config = function()
    vim.cmd("colorscheme ashki")
  end
}
```

# Ashki Theme Color Palette

| Color | Hex | Preview |
|-------|------|---------|
| void       | #000000 | <span style="display:inline-block;width:16px;height:16px;background:#000000;"></span> |
| bg1        | #0A0908 | <span style="display:inline-block;width:16px;height:16px;background:#0A0908;"></span> |
| bg2        | #1D1B18 | <span style="display:inline-block;width:16px;height:16px;background:#1D1B18;"></span> |
| bg3        | #302D28 | <span style="display:inline-block;width:16px;height:16px;background:#302D28;"></span> |
| visual     | #201E1A | <span style="display:inline-block;width:16px;height:16px;background:#201E1A;"></span> |
| cursor     | #F0F7FA | <span style="display:inline-block;width:16px;height:16px;background:#F0F7FA;"></span> |
| fg01       | #DCE9FB | <span style="display:inline-block;width:16px;height:16px;background:#DCE9FB;"></span> |
| fg         | #d2d1d0 | <span style="display:inline-block;width:16px;height:16px;background:#d2d1d0;"></span> |
| fg1        | #A6A4A2 | <span style="display:inline-block;width:16px;height:16px;background:#A6A4A2;"></span> |
| fg2        | #7A7775 | <span style="display:inline-block;width:16px;height:16px;background:#7A7775;"></span> |
| fg3        | #494949 | <span style="display:inline-block;width:16px;height:16px;background:#494949;"></span> |
| sline      | #4C4B49 | <span style="display:inline-block;width:16px;height:16px;background:#4C4B49;"></span> |
| string     | #66A0A7 | <span style="display:inline-block;width:16px;height:16px;background:#66A0A7;"></span> |
| keyword    | #A94646 | <span style="display:inline-block;width:16px;height:16px;background:#A94646;"></span> |
| func       | #8E8EB4 | <span style="display:inline-block;width:16px;height:16px;background:#8E8EB4;"></span> |
| ttype      | #c7c1a9 | <span style="display:inline-block;width:16px;height:16px;background:#c7c1a9;"></span> |
| const      | #86A1CF | <span style="display:inline-block;width:16px;height:16px;background:#86A1CF;"></span> |
| red        | #9E4941 | <span style="display:inline-block;width:16px;height:16px;background:#9E4941;"></span> |
| green      | #336C62 | <span style="display:inline-block;width:16px;height:16px;background:#336C62;"></span> |
| yellow     | #DEB65B | <span style="display:inline-block;width:16px;height:16px;background:#DEB65B;"></span> |
| blue       | #748cab | <span style="display:inline-block;width:16px;height:16px;background:#748cab;"></span> |
| violet     | #61587A | <span style="display:inline-block;width:16px;height:16px;background:#61587A;"></span> |
| pink       | #BA86A4 | <span style="display:inline-block;width:16px;height:16px;background:#BA86A4;"></span> |
