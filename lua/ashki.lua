local M = {}

local defaults = {
    soft = false,
    terminal = false,
    colors = {
        void = "#000000",
        bg1 = "#0D0D0D",
        bg2 = "#1F1D1A",
        bg3 = "#302D28",
        visual = "#201E1A",
        cursor = "#F0F7FA",
        fg01 = "#DCE9FB",
        fg = "#d2d1d0",
        fg1 = "#A6A4A2",
        fg2 = "#7A7775",
        fg3 = "#494949",
        sline = "#4C4B49",
        string = "#66A0A7",
        keyword = "#A94646",
        func = "#8E8EB4",
        ttype = "#c7c1a9",
        const = "#86A1CF",
        red = "#9E4941",
        green = "#336C62",
        yellow = "#CFAB59",
        blue = "#748cab",
        violet = "#61587A",
        pink = "#BA86A4",
        redbg = "#391A17",
        greenbg = "#102320",
        yellowbg = "#5E4712",
        bluebg = "#273240",
        violetbg = "#23202C",
        pinkbg = "#492A3C",
    },
    alt = {
        void = "#080705",
        bg1 = "#0F0E0C",
        bg2 = "#1F1D1B",
        bg3 = "#33302B",
        visual = "#23211D",
    }
}

M.setup = function(user_opts)
    M.opts = vim.tbl_deep_extend("force", defaults, user_opts or {})
end

M.set_highlights = function()
    local c = M.opts.colors

    if M.opts.soft then
        c = vim.tbl_deep_extend("force", c, M.opts.alt)
    end

    if M.opts.terminal then
        vim.g.terminal_color_0 = c.void
        vim.g.terminal_color_1 = c.red
        vim.g.terminal_color_2 = c.green
        vim.g.terminal_color_3 = c.yellow
        vim.g.terminal_color_4 = c.blue
        vim.g.terminal_color_5 = c.violet
        vim.g.terminal_color_6 = c.pink
        vim.g.terminal_color_7 = c.fg
        vim.g.terminal_color_8 = c.comment
        vim.g.terminal_color_9 = c.redbg
        vim.g.terminal_color_10 = c.greenbg
        vim.g.terminal_color_11 = c.yellowbg
        vim.g.terminal_color_12 = c.bluebg
        vim.g.terminal_color_13 = c.violetbg
        vim.g.terminal_color_14 = c.pinkbg
        vim.g.terminal_color_15 = c.bg3
    end

    local hi = function(name, val)
        vim.api.nvim_set_hl(0, name, val)
    end

    hi("Normal", { fg = c.fg, bg = c.void })
    hi("StatusLine", { fg = c.fg, bg = c.sline })
    hi("StatusLineNC", { fg = c.fg2, bg = c.bg2 })
    hi("MatchParen", { fg = c.fg01, bg = c.bg3, bold = true })
    hi("Visual", { bg = c.visual })
    hi("Cursor", { fg = c.void, bg = c.cursor })
    hi("LineNr", { fg = c.fg3 })
    hi("CursorLine", { bg = c.bg2 })
    hi("CursorLineNr", { fg = c.fg1, bg = c.bg1, bold = true })
    hi("TermCursor", { fg = c.cursor })
    hi("Search", { bg = c.bg2, fg = c.fg, bold = true })
    hi("CurSearch", { bg = c.bg2, fg = c.fg01, bold = true })
    hi("IncSearch", { bg = c.bg3, fg = c.fg01, bold = true })
    hi("Directory", { fg = c.fg1 })
    hi("Title", { fg = c.string })

    hi("VertSplit", { fg = c.bg2 })
    hi("WinSeparator", { link = "VertSplit" })

    hi("lCursor", { fg = c.bg1, bg = c.bg3 })
    hi("CursorColumn", { bg = c.bg2 })
    hi("CursorLineSign", { link = "CursorLine" })
    hi("VisualNOS", { fg = c.fg, bg = c.bg1 })
    hi("VisualNonText", { fg = c.fg3, bg = c.bg1 })

    hi("ColorColumn", { bg = c.bg1 })
    hi("Folded", { fg = c.fg1, bg = c.bg1 })
    hi("FoldColumn", { fg = c.fg3, bg = c.void })
    hi("SignColumn", { fg = c.fg3, bg = c.void })

    hi("ModeMsg", { fg = c.green })
    hi("OkMsg", { fg = c.green })
    hi("MoreMsg", { fg = c.yellow })
    hi("Question", { fg = c.pink })
    hi("Debug", { fg = c.blue })
    hi("debugPc", { fg = c.void, bg = c.fg })
    hi("MsgArea", { fg = c.fg1 })
    hi("MsgSeparator", { fg = c.string, bg = c.bg2, bold = true })

    hi("Boolean", { fg = c.const })
    hi("Comment", { fg = c.fg2, italic = true })
    hi("Constant", { fg = c.const, bold = true })
    hi("Number", { link = "Constant" })
    hi("String", { fg = c.string })
    hi("Delimiter", { fg = c.fg1 })
    hi("Identifier", { fg = c.fg1 })
    hi("Function", { fg = c.func })
    hi("StorageClass", { fg = c.keyword, bold = true })
    hi("Label", { fg = c.fg })
    hi("NonText", { fg = c.fg })
    hi("Repeat", { fg = c.keyword, bold = true })
    hi("Macro", { fg = c.const })
    hi("PreProc", { fg = c.const })
    hi("PreCondit", { fg = c.fg1 })
    hi("Define", { fg = c.fg1 })
    hi("Type", { fg = c.ttype })
    hi("Special", { fg = c.fg1, italic = true })
    hi("Operator", { fg = c.fg })
    hi("Structure", { fg = c.keyword, bold = true })
    hi("Statement", { fg = c.keyword })
    hi("Whitespace", { fg = c.bg3 })
    hi("Typedef", { fg = c.const })

    hi("Error", { fg = c.red, bg = c.void })
    hi("ErrorMsg", { fg = c.red, bg = c.void, bold = true })
    hi("WarningMsg", { fg = c.yellow, bg = c.void })

    hi("NormalFloat", { fg = c.fg, bg = c.bg1 })
    hi("FloatBorder", { fg = c.fg2, bg = c.bg1 })
    hi("FloatTitle", { fg = c.fg, bold = true })
    hi("ComplHint", { fg = c.fg3 })
    hi("ComplHintMore", { fg = c.fg1 })
    hi("ComplMatchIns", { fg = c.fg01 })
    hi("Pmenu", { fg = c.fg, bg = c.bg1 })
    hi("PmenuBorder", { fg = c.fg2, bg = c.bg1 })
    hi("PmenuSel", { fg = c.fg, bg = c.bg2, bold = true })
    hi("PmenuSbar", { bg = c.bg1 })
    hi("PmenuThumb", { bg = c.fg3 })
    hi("WildMenu", { fg = c.fg, bg = c.bg1 })

    hi("SpellBad", { sp = c.ttype, underline = true })
    hi("SpellCap", { sp = c.ttype, underline = true })
    hi("SpellRare", { sp = c.ttype, underline = true })
    hi("SpellLocal", { sp = c.ttype, underline = true })

    hi("Todo", { fg = c.blue })
    hi("Ignore", { fg = c.fg2 })
    hi("QuickFixLine", { link = "CursorLine" })
    hi("qfFileName", { fg = c.blue })
    hi("Conceal", { fg = c.fg3 })

    hi("Added", { fg = c.green })
    hi("Changed", { fg = c.yellow })
    hi("Removed", { fg = c.red })
    hi("DiffAdd", { bg = c.greenbg })
    hi("DiffChange", { bg = c.yellowbg })
    hi("DiffDelete", { bg = c.redbg })
    hi("DiffText", { bg = c.violetbg })
    hi("DiffFile", { fg = c.keyword })
    hi("DiffIndexLine", { bg = c.fg3 })

    hi("GitSignsAdd", { fg = c.green })
    hi("GitSignsChange", { fg = c.yellow })
    hi("GitSignsDelete", { fg = c.red })

    hi("DiagnosticError", { fg = c.red })
    hi("DiagnosticWarn", { fg = c.yellow })
    hi("DiagnosticInfo", { fg = c.blue })
    hi("DiagnosticHint", { fg = c.violet })

    hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
    hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
    hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
    hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.violet })
    hi("DiagnosticOk", { fg = c.green })

    hi("WinBar", { fg = c.fg2, bg = c.bg2 })
    hi("WinBarNC", { fg = c.fg3, bg = c.bg1 })
    hi("TabLine", { fg = c.fg2, bg = c.bg1 })
    hi("TabLineSel", { fg = c.fg, bg = c.sline })

    hi("EndOfBuffer", { fg = c.fg3 })

    hi("healthSuccess", { link = "DiffAdd" })
    hi("healthHeadingChar", { fg = c.fg })
    hi("helpHeader", { fg = c.fg })

    hi("@comment.error", { fg = c.red })
    hi("@comment.note", { fg = c.violet })
    hi("@comment.ok", { fg = c.green })
    hi("@comment.todo", { fg = c.blue })
    hi("@comment.warning", { fg = c.yellow })

    hi("@attribute", { fg = c.const })
    hi("@variable", { fg = c.fg })
    hi("@function", { link = "Function" })
    hi("@method", { link = "Function" })
    hi("@function.macro", { link = "Function" })
    hi("@keyword", { fg = c.keyword, bold = true })
    hi("@keyword.import", { fg = c.keyword, bold = true })
    hi("@keyword.storage", { fg = c.keyword })
    hi("@string", { link = "String" })
    hi("@comment", { link = "Comment" })

    hi("@field", { fg = c.fg })
    hi("@property", { fg = c.fg1 })
    hi("@parameter", { fg = c.fg1 })
    hi("@type.builtin", { fg = c.ttype })
    hi("@constant", { fg = c.const })
    hi("@number", { fg = c.const, bold = true })
    hi("@boolean", { link = "Boolean" })
    hi("@operator", { fg = c.fg })

    hi("@text.diff.delete", { link = "DiffDelete" })
    hi("@diff.plus", { link = "DiffAdd" })
    hi("@diff.delta", { link = "DiffChange" })
    hi("@diff.minus", { link = "DiffDelete" })

    hi("@constructor.lua", { fg = c.fg })
    hi("@markup", { fg = c.fg })
    hi("@markup.heading", { fg = c.keyword })
    hi("@markup.italic", { fg = c.fg, italic = true })
    hi("@markup.link", { fg = c.string })
    hi("@markup.link.uri", { fg = c.string, underline = true })
    hi("@markup.list", { fg = c.func })
    hi("@markup.math", { fg = c.string })
    hi("@markup.quote.markdown", { fg = c.fg3 })
    hi("@markup.raw", { fg = c.fg3 })
    hi("@markup.strikethrough", { fg = c.fg3, strikethrough = true })
    hi("@markup.strong", { fg = c.fg, bold = true })
    hi("@markup.underline", { fg = c.fg, underline = true })
end

M._colorscheme = function()
    vim.cmd("highlight clear")
    if vim.fn.has("syntax_on") then vim.cmd("syntax reset") end
    vim.g.colors_name = "ashki"

    M.set_highlights()
end

M.load = M._colorscheme

return M
