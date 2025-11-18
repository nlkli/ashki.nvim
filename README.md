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

| Color   | Hex      | Preview |
|---------|----------|---------|
| void       | #000000 | <img src="https://via.placeholder.com/18/000000/000000?text=+" /> |
| bg1        | #0A0908 | <img src="https://via.placeholder.com/18/0A0908/0A0908?text=+" /> |
| bg2        | #1D1B18 | <img src="https://via.placeholder.com/18/1D1B18/1D1B18?text=+" /> |
| bg3        | #302D28 | <img src="https://via.placeholder.com/18/302D28/302D28?text=+" /> |
| visual     | #201E1A | <img src="https://via.placeholder.com/18/201E1A/201E1A?text=+" /> |
| cursor     | #F0F7FA | <img src="https://via.placeholder.com/18/F0F7FA/F0F7FA?text=+" /> |
| fg01       | #DCE9FB | <img src="https://via.placeholder.com/18/DCE9FB/DCE9FB?text=+" /> |
| fg         | #d2d1d0 | <img src="https://via.placeholder.com/18/d2d1d0/d2d1d0?text=+" /> |
| fg1        | #A6A4A2 | <img src="https://via.placeholder.com/18/A6A4A2/A6A4A2?text=+" /> |
| fg2        | #7A7775 | <img src="https://via.placeholder.com/18/7A7775/7A7775?text=+" /> |
| fg3        | #494949 | <img src="https://via.placeholder.com/18/494949/494949?text=+" /> |
| sline      | #4C4B49 | <img src="https://via.placeholder.com/18/4C4B49/4C4B49?text=+" /> |
| string     | #66A0A7 | <img src="https://via.placeholder.com/18/66A0A7/66A0A7?text=+" /> |
| keyword    | #A94646 | <img src="https://via.placeholder.com/18/A94646/A94646?text=+" /> |
| func       | #8E8EB4 | <img src="https://via.placeholder.com/18/8E8EB4/8E8EB4?text=+" /> |
| ttype      | #c7c1a9 | <img src="https://via.placeholder.com/18/c7c1a9/c7c1a9?text=+" /> |
| const      | #86A1CF | <img src="https://via.placeholder.com/18/86A1CF/86A1CF?text=+" /> |
| red        | #9E4941 | <img src="https://via.placeholder.com/18/9E4941/9E4941?text=+" /> |
| green      | #336C62 | <img src="https://via.placeholder.com/18/336C62/336C62?text=+" /> |
| yellow     | #DEB65B | <img src="https://via.placeholder.com/18/DEB65B/DEB65B?text=+" /> |
| blue       | #748cab | <img src="https://via.placeholder.com/18/748cab/748cab?text=+" /> |
| violet     | #61587A | <img src="https://via.placeholder.com/18/61587A/61587A?text=+" /> |
| pink       | #BA86A4 | <img src="https://via.placeholder.com/18/BA86A4/BA86A4?text=+" /> |
