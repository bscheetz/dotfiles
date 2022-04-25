local options = {
    compatible = false,
    nu = true,
    ruler = true,
    encoding = "utf-8",
    wrap = false,
    -- set tab width to 4 spaces
    tabstop = 4,
    shiftwidth = 4,
    -- replace tab with spaces
    expandtab = true,
    cursorcolumn = true,
    cursorline = true,
    autoindent = true,
    backspace = "indent,eol,start",
    -- turn on incremental search
    incsearch = true,
    errorbells = false,
    number = true,
    -- highlight search matches
    hlsearch = true,
    -- set relative line numbers instead of absolute
    relativenumber = true,
    background = "dark",
    termguicolors = true,
    laststatus=2,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
