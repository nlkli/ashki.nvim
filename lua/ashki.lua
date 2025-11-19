local M = {}

-- Default configuration
local defaults = {
    soft = 0,        -- Soft background variant (1 or 2)
    terminal = false, -- Enable terminal colors
    ak = "",         -- Alternate keyword color (r/g/b/y/o/p/v)
    colors = {
        -- Backgrounds
        void   = "#000000", -- Normal background
        bg1    = "#0D0D0D", -- Main text background
        bg2    = "#1F1D1A", -- CursorLine / floating windows
        bg3    = "#302D28", -- Fold / popup / diff background
        visual = "#201E1A", -- Visual selection
        cursor = "#F0F7FA", -- Cursor color
        sline  = "#4C4B49", -- StatusLine background

        -- Foreground shades
        fg01   = "#DCE9FB", -- Light highlight text
        fg     = "#CFCFCC", -- Normal text
        fg1    = "#ABA9A8", -- LineNr / CursorLineNr
        fg2    = "#7A7775", -- Fold / StatusLineNC
        fg3    = "#494949", -- Comments / NonText / EndOfBuffer

        -- Syntax colors
        string   = "#679CA2",
        keyword  = "#A94646",
        func     = "#8E8EB4",
        ttype    = "#C8C3AB",
        const    = "#86A1CF",

        -- Semantic / special
        red      = "#9E4941",
        green    = "#336C62",
        yellow   = "#D9B35B",
        blue     = "#748cab",
        violet   = "#61587A",
        pink     = "#BA86A4",

        -- Terminal / diff backgrounds
        redbg    = "#391A17",
        greenbg  = "#102320",
        yellowbg = "#574314",
        bluebg   = "#273240",
        violetbg = "#23202C",
        pinkbg   = "#492A3C",
    },

    soft_bg = {
        {
            void = "#080705",
            bg1 = "#141414",
            bg2 = "#292722",
            bg3 = "#37342E",
            visual = "#2A2622"
        },
        {
            void = "#0F0E0A",
            bg1 = "#191919",
            bg2 = "#2E2C27",
            bg3 = "#3C3932",
            visual = "#2F2B26"
        },
    },

    alt_keyword_colors = {
        r = "#A94646", g = "#45A886", b = "#457DA8",
        y = "#A8A045", o = "#A86B45", p = "#A8455F", v = "#8645A8",
    }
}

-- Merge user options
M.setup = function(user_opts)
    M.opts = vim.tbl_deep_extend("force", defaults, user_opts or {})
end

-- Terminal color setup
local function set_terminal_colors(c)
    vim.g.terminal_color_0  = c.void
    vim.g.terminal_color_1  = c.red
    vim.g.terminal_color_2  = c.green
    vim.g.terminal_color_3  = c.yellow
    vim.g.terminal_color_4  = c.blue
    vim.g.terminal_color_5  = c.violet
    vim.g.terminal_color_6  = c.pink
    vim.g.terminal_color_7  = c.fg
    vim.g.terminal_color_8  = c.fg3
    vim.g.terminal_color_9  = c.redbg
    vim.g.terminal_color_10 = c.greenbg
    vim.g.terminal_color_11 = c.yellowbg
    vim.g.terminal_color_12 = c.bluebg
    vim.g.terminal_color_13 = c.violetbg
    vim.g.terminal_color_14 = c.pinkbg
    vim.g.terminal_color_15 = c.bg3
end

-- Apply highlights
M.set_highlights = function()
    local c = M.opts.colors

    -- Apply soft background variant
    if M.opts.soft > 0 then
        if M.opts.soft <= 2 then
            c = vim.tbl_deep_extend("force", c, M.opts.soft_bg[M.opts.soft])
        else
            c = vim.tbl_deep_extend("force", c, M.opts.soft_bg[2])
        end
    end

    -- Apply alternate keyword color if set
    if M.opts.ak ~= "" and M.opts.alt_keyword_colors[M.opts.ak] then
        c.keyword = M.opts.alt_keyword_colors[M.opts.ak]
    end

    if M.opts.terminal then
        set_terminal_colors(c)
    end

    local hi = function(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- =========================
    -- UI Elements
    -- =========================
    hi("Normal", { fg = c.fg, bg = c.void }) -- Main text, default background
    hi("Cursor", { fg = c.void, bg = c.cursor }) -- Cursor block
    hi("lCursor", { fg = c.void, bg = c.cursor }) -- Alternate cursor
    hi("CursorLine", { bg = c.bg2 }) -- Highlight current line
    hi("CursorLineNr", { fg = c.fg1, bg = c.bg1, bold = true }) -- Line number of current line
    hi("LineNr", { fg = c.fg3 }) -- Non-current line numbers
    hi("Visual", { bg = c.visual }) -- Visual selection
    hi("VisualNOS", { fg = c.fg, bg = c.bg1 }) -- Visual selection without text
    hi("VisualNonText", { fg = c.fg3, bg = c.bg1 }) -- Non-text selected
    hi("StatusLine", { fg = c.fg, bg = c.sline }) -- Active status line
    hi("StatusLineNC", { fg = c.fg2, bg = c.bg2 }) -- Inactive status line
    hi("VertSplit", { fg = c.bg2 }) -- Vertical split separator
    hi("WinSeparator", { link = "VertSplit" }) -- Same as VertSplit
    hi("ColorColumn", { link = "VertSplit" }) -- Column highlight
    hi("FoldColumn", { fg = c.fg3, bg = c.void }) -- Fold column
    hi("SignColumn", { fg = c.fg3, bg = c.void }) -- Gutter for signs
    hi("Folded", { fg = c.fg2, bg = c.bg1 }) -- Folded text
    hi("CursorColumn", { bg = c.bg2 }) -- Highlight cursor column
    hi("CursorLineSign", { link = "CursorLine" }) -- Sign highlight on current line
    hi("EndOfBuffer", { fg = c.fg3 }) -- ~ symbols at end of buffer
    hi("MsgArea", { fg = c.fg1 }) -- Messages
    hi("MsgSeparator", { fg = c.string, bg = c.bg2, bold = true }) -- Separator for messages
    hi("ModeMsg", { fg = c.green }) -- Mode messages (INSERT, NORMAL)
    hi("OkMsg", { fg = c.green }) -- Confirmation messages
    hi("MoreMsg", { fg = c.yellow }) -- More messages
    hi("Question", { fg = c.pink }) -- Prompt question messages
    hi("Debug", { fg = c.blue }) -- Debug messages
    hi("debugPc", { fg = c.void, bg = c.fg }) -- Debug PC pointer
    hi("Search", { bg = c.bg2, fg = c.fg, bold = true })
    hi("CurSearch", { bg = c.bg2, fg = c.fg01, bold = true })
    hi("IncSearch", { bg = c.bg3, fg = c.fg01, bold = true })
    hi("Directory", { fg = c.fg1 })
    hi("Title", { fg = c.string })

    -- =========================
    -- Syntax Elements
    -- =========================
    hi("Comment", { fg = c.fg2, italic = true }) -- Comments
    hi("Constant", { fg = c.const, bold = true }) -- Constants, numbers
    hi("Number", { link = "Constant" }) -- Numbers
    hi("Boolean", { fg = c.const }) -- Boolean values
    hi("String", { fg = c.string }) -- Strings
    hi("Delimiter", { fg = c.fg }) -- Punctuation
    hi("Identifier", { fg = c.fg1 }) -- Variable names
    hi("Function", { fg = c.func }) -- Function names
    hi("StorageClass", { fg = c.keyword, bold = true }) -- Class / struct keywords
    hi("Label", { fg = c.fg }) -- Labels for goto
    hi("Repeat", { fg = c.keyword }) -- Loops
    hi("Macro", { fg = c.func }) -- Macro names
    hi("PreProc", { fg = c.const }) -- Preprocessor
    hi("PreCondit", { fg = c.fg1 }) -- Conditional preprocessor
    hi("Define", { fg = c.fg1 }) -- #define
    hi("Type", { fg = c.ttype }) -- Type names
    hi("Special", { fg = c.const, italic = true }) -- Special syntax
    hi("Operator", { fg = c.fg }) -- Operators (+, -, etc.)
    hi("Structure", { fg = c.keyword, bold = true }) -- Struct / enum / class
    hi("Statement", { fg = c.keyword }) -- Statements (if, for)
    hi("Whitespace", { fg = c.bg3 }) -- Whitespace chars
    hi("Typedef", { fg = c.ttype }) -- Type definitions
    hi("Error", { fg = c.red, bg = c.void }) -- Error text
    hi("ErrorMsg", { fg = c.red, bg = c.void, bold = true }) -- Error messages
    hi("WarningMsg", { fg = c.yellow, bg = c.void }) -- Warning messages

    -- =========================
    -- Floating windows
    -- =========================
    hi("NormalFloat", { fg = c.fg, bg = c.bg1 }) -- Floating window text
    hi("FloatBorder", { fg = c.fg2, bg = c.bg1 }) -- Floating window border
    hi("FloatTitle", { fg = c.fg, bold = true }) -- Floating window title

    -- =========================
    -- Completion menu
    -- =========================
    hi("Pmenu", { fg = c.fg, bg = c.bg1 }) -- Completion menu text
    hi("PmenuBorder", { fg = c.fg2, bg = c.bg1 }) -- Completion menu border
    hi("PmenuSel", { fg = c.fg, bg = c.bg2, bold = true }) -- Selected item
    hi("PmenuSbar", { bg = c.bg1 }) -- Scrollbar
    hi("PmenuThumb", { bg = c.fg3 }) -- Scroll thumb
    hi("WildMenu", { fg = c.fg, bg = c.bg1 }) -- Wild menu
    hi("CmpGhostText", { fg = c.fg3, underline = true }) -- Ghost text
    hi("CmpItemAbbr", { fg = c.fg }) -- Completion abbreviation
    hi("CmpItemAbbrDeprecated", { fg = c.red, strikethrough = true }) -- Deprecated item
    hi("CmpItemAbbrMatch", { fg = c.fg01 }) -- Match highlight
    hi("CmpItemAbbrMatchFuzzy", { fg = c.fg01 }) -- Fuzzy match
    hi("CmpItemMenu", { link = "Pmenu" }) -- Menu item
    hi("CmpItemKind", { fg = c.fg3 }) -- Item kind

    -- =========================
    -- Diff and Git
    -- =========================
    hi("Added", { fg = c.green }) -- Added text
    hi("Changed", { fg = c.yellow }) -- Changed text
    hi("Removed", { fg = c.red }) -- Removed text
    hi("DiffAdd", { bg = c.greenbg }) -- Diff background add
    hi("DiffChange", { bg = c.yellowbg }) -- Diff background change
    hi("DiffDelete", { bg = c.redbg }) -- Diff background delete
    hi("DiffText", { bg = c.violetbg }) -- Diff text highlight
    hi("DiffFile", { fg = c.keyword }) -- Diff file names
    hi("DiffIndexLine", { bg = c.fg3 }) -- Diff index lines
    hi("GitSignsAdd", { fg = c.green }) -- Git signs add
    hi("GitSignsChange", { fg = c.yellow }) -- Git signs change
    hi("GitSignsDelete", { fg = c.red }) -- Git signs delete

    -- =========================
    -- Diagnostics
    -- =========================
    hi("DiagnosticError", { fg = c.red }) -- Error text
    hi("DiagnosticWarn", { fg = c.yellow }) -- Warning text
    hi("DiagnosticInfo", { fg = c.blue }) -- Info text
    hi("DiagnosticHint", { fg = c.violet }) -- Hint text
    hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red }) -- Error underline
    hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow }) -- Warning underline
    hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue }) -- Info underline
    hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.violet }) -- Hint underline
    hi("DiagnosticOk", { fg = c.green }) -- OK status

    -- =========================
    -- LSP / Treesitter
    -- =========================
    hi("@lsp.type.function", { fg = c.func }) -- Function type
    hi("@lsp.type.struct", { fg = c.ttype }) -- Struct type
    hi("@lsp.type.variable", { fg = c.fg }) -- Variable type
    hi("@lsp.type.namespace", { fg = c.fg1, bold = true }) -- Namespace type
    hi("@lsp.type.enumMember", { fg = c.fg }) -- Enum member
    hi("@lsp.type.selfParameter", { link = "Special" }) -- Self parameter
    hi("@lsp.type.typeParameter", { link = "Typedef" }) -- Type parameter
    hi("@comment", { link = "Comment" }) -- Comments
    hi("@comment.error", { fg = c.red }) -- Comment with error
    hi("@comment.note", { fg = c.violet }) -- Comment note
    hi("@comment.ok", { fg = c.green }) -- Comment ok
    hi("@comment.todo", { fg = c.blue }) -- TODO comments
    hi("@comment.warning", { fg = c.yellow }) -- Warning comments
    hi("@namespace", { fg = c.fg }) -- Namespace
    hi("@attribute", { fg = c.func }) -- Attribute
    hi("@variable", { fg = c.fg }) -- Variables
    hi("@function", { link = "Function" }) -- Functions
    hi("@method", { link = "Function" }) -- Methods
    hi("@function.macro", { link = "Function" }) -- Macros
    hi("@keyword", { fg = c.keyword }) -- Keywords
    hi("@keyword.import", { fg = c.keyword, bold = true }) -- Import keyword
    hi("@keyword.storage", { fg = c.keyword }) -- Storage keyword
    hi("@keyword.return", { fg = c.keyword, bold = true }) -- Return keyword
    hi("@keyword.function", { fg = c.keyword, bold = true }) -- Function keyword
    hi("@string", { link = "String" }) -- Strings
    hi("@field", { fg = c.fg }) -- Field name
    hi("@lifetime", { fg = c.const, italic = true }) -- Lifetime
    hi("@property", { fg = c.fg1 }) -- Property
    hi("@parameter", { fg = c.fg }) -- Function parameter
    hi("@type.builtin", { fg = c.fg1, bold = true }) -- Builtin types
    hi("@constant", { fg = c.const }) -- Constant
    hi("@number", { fg = c.const, bold = true }) -- Number
    hi("@boolean", { link = "Boolean" }) -- Boolean
    hi("@operator", { fg = c.fg }) -- Operator
    hi("@punctuation.special", { fg = c.fg }) -- Special punctuation
    hi("@tag.delimiter", { fg = c.fg }) -- Tag delimiter <>
    hi("@tag.delimiter.html", { fg = c.fg }) -- Tag <>
    hi("htmlTag", { fg = c.fg }) -- Tag <>
    hi("@string.regexp", { fg = c.fg }) -- Regex string
    hi("@string.escape", { fg = c.fg }) -- Escaped string
    hi("@text.diff.delete", { link = "DiffDelete" }) -- Text delete diff
    hi("@diff.plus", { link = "DiffAdd" }) -- Diff addition
    hi("@diff.delta", { link = "DiffChange" }) -- Diff change
    hi("@diff.minus", { link = "DiffDelete" }) -- Diff minus
    hi("@constructor.lua", { fg = c.fg }) -- Constructor in Lua
    hi("@markup", { fg = c.fg }) -- Markup text
    hi("@markup.heading", { fg = c.keyword }) -- Heading
    hi("@markup.italic", { fg = c.fg, italic = true }) -- Italic
    hi("@markup.link", { fg = c.string }) -- Link
    hi("@markup.link.uri", { fg = c.string, underline = true }) -- URI
    hi("@markup.list", { fg = c.func }) -- List
    hi("@markup.math", { fg = c.string }) -- Math
    hi("@markup.quote.markdown", { fg = c.fg3 }) -- Quote
    hi("@markup.raw", { fg = c.fg3 }) -- Raw text
    hi("@markup.strikethrough", { fg = c.fg3, strikethrough = true }) -- Strike-through
    hi("@markup.strong", { fg = c.fg, bold = true }) -- Bold
    hi("@markup.underline", { fg = c.fg, underline = true }) -- Underline

    -- =========================
    -- Window bars and tabs
    -- =========================
    hi("WinBar", { fg = c.fg2, bg = c.bg2 }) -- Window bar for active window
    hi("WinBarNC", { fg = c.fg3, bg = c.bg1 }) -- Window bar for inactive window
    hi("TabLine", { fg = c.fg2, bg = c.bg1 }) -- Tab line for inactive tabs
    hi("TabLineSel", { fg = c.fg, bg = c.sline }) -- Tab line for selected tab
end

-- Load colorscheme
M._colorscheme = function()
    vim.cmd("highlight clear")
    if vim.fn.has("syntax_on") then vim.cmd("syntax reset") end
    vim.g.colors_name = "ashki"
    M.set_highlights()
end

M.load = M._colorscheme

return M
