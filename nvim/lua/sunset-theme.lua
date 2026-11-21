-- Expanded Sunset Palette with high contrast
local colors = {
  bg               = "#0e0f19",
  fg               = "#f4d3d6",
  bg_dark          = "#1a1827",
  bg_highlight     = "#252131",
  selection        = "#3d354b",
  comment          = "#706488",
  
  -- Distinct High-Contrast Accents
  bright_yellow    = "#ffe58f", -- Structs / Interfaces
  sun_gold         = "#fadb6b", -- Constants / Enums
  glowing_orange   = "#ff8c42", -- Functions / Methods
  sunset_crimson   = "#e63956", -- Keywords / Control Flow
  orchid_purple    = "#c084fc", -- Classes / Constructors
  sky_cyan         = "#38bdf8", -- Namespaces / Modules
  lavender_blue    = "#818cf8", -- Types / Primitives
  warm_amber       = "#ffb86c", -- Strings / Literals
}

local hl = vim.api.nvim_set_hl

-- Reset editor UI
hl(0, "Normal",       { fg = colors.fg, bg = colors.bg })
hl(0, "NormalFloat",  { fg = colors.fg, bg = colors.bg_dark })
hl(0, "FloatBorder",  { fg = colors.glowing_orange, bg = colors.bg_dark })
hl(0, "CursorLine",   { bg = colors.bg_highlight })
hl(0, "LineNr",       { fg = colors.comment })
hl(0, "CursorLineNr", { fg = colors.sun_gold, bold = true })
hl(0, "Visual",       { bg = colors.selection })
hl(0, "WinSeparator", { fg = colors.sunset_crimson })

-- Legacy Vim Highlighting
hl(0, "Comment",      { fg = colors.comment, italic = true })
hl(0, "Constant",     { fg = colors.sun_gold })
hl(0, "String",       { fg = colors.warm_amber })
hl(0, "Number",       { fg = colors.warm_amber })
hl(0, "Function",     { fg = colors.glowing_orange, bold = true })
hl(0, "Keyword",      { fg = colors.sunset_crimson, bold = true, italic = true })
hl(0, "Statement",    { fg = colors.sunset_crimson, bold = true })
hl(0, "Type",         { fg = colors.lavender_blue })
hl(0, "Identifier",   { fg = colors.fg })

-- Treesitter Syntax Overrides (Forces complete separation)
hl(0, "@comment",           { fg = colors.comment, italic = true })
hl(0, "@keyword",           { fg = colors.sunset_crimson, bold = true, italic = true })
hl(0, "@string",            { fg = colors.warm_amber })
hl(0, "@number",            { fg = colors.warm_amber })
hl(0, "@constant",          { fg = colors.sun_gold })
hl(0, "@variable",          { fg = colors.fg })

-- Functions & Methods (Glowing Orange)
hl(0, "@function",          { fg = colors.glowing_orange, bold = true })
hl(0, "@function.call",     { fg = colors.glowing_orange })
hl(0, "@function.builtin",  { fg = colors.glowing_orange, italic = true })
hl(0, "@method",            { fg = colors.glowing_orange })
hl(0, "@method.call",       { fg = colors.glowing_orange })

-- Namespaces & Modules (Sky Cyan)
hl(0, "@module",            { fg = colors.sky_cyan, bold = true })
hl(0, "@module.public",     { fg = colors.sky_cyan, bold = true })
hl(0, "@namespace",         { fg = colors.sky_cyan, bold = true })

-- Structs & Interfaces (Bright Yellow)
hl(0, "@structure",         { fg = colors.bright_yellow, bold = true })
hl(0, "@type.definition",   { fg = colors.bright_yellow, bold = true })

-- Classes & Constructors (Orchid Purple)
hl(0, "@constructor",       { fg = colors.orchid_purple, bold = true })
hl(0, "@type.class",        { fg = colors.orchid_purple, bold = true })

-- Types & Primitives (Lavender Blue)
hl(0, "@type",              { fg = colors.lavender_blue })
hl(0, "@type.builtin",      { fg = colors.lavender_blue, italic = true })

-- LSP Semantic Tokens 
hl(0, "@lsp.type.namespace",     { fg = colors.sky_cyan, bold = true })
hl(0, "@lsp.type.class",         { fg = colors.orchid_purple, bold = true })
hl(0, "@lsp.type.struct",        { fg = colors.bright_yellow, bold = true })
hl(0, "@lsp.type.interface",     { fg = colors.bright_yellow, italic = true })
hl(0, "@lsp.type.enum",          { fg = colors.sun_gold, bold = true })
hl(0, "@lsp.type.enumMember",    { fg = colors.sun_gold })
hl(0, "@lsp.type.function",      { fg = colors.glowing_orange, bold = true })
hl(0, "@lsp.type.method",        { fg = colors.glowing_orange })
hl(0, "@lsp.type.type",          { fg = colors.lavender_blue })
hl(0, "@lsp.type.typeParameter", { fg = colors.lavender_blue, italic = true })
hl(0, "@lsp.type.variable",      { fg = colors.fg })
hl(0, "@lsp.type.parameter",     { fg = colors.fg, italic = true })
hl(0, "@lsp.type.property",      { fg = colors.fg })
