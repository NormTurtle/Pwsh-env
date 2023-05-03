local o = vim.opt
-- disable netrw , For NerdTree but can't
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Troubleshoot
o.keywordprg = ':help' -- Replace :man with :help, fix `K` freeze

-- File
-- o.fileencoding = "utf-8" -- the encoding written to a file

-- Spell
--o.spell = true
--o.spelllang = { 'en_us' }

-- line number
o.relativenumber = true        -- make use relative num
o.number = true                -- get numbers on left side

-- tabs & indent
o.tabstop = 2 -- X mean how many SPACES instead of TAB,i used 4
o.shiftwidth = 2 -- tell << & >> to shift how many SPACES
o.expandtab = true -- tabs are SPACES
o.softtabstop = 2 -- DEL how many SPACES with <BS>
o.smartindent = true -- automatic indent on new line
o.autoindent = false -- maybe auto?
o.wildmenu = true -- fancy/visual auto-cmp for cmdline

-- file
-- Allow undo-ing even after save file
o.undodir = vim.fn.stdpath("config") .. "/.tmp/undo"
o.undofile = true
-- Hide 'No write since last change' error on switching buffers Keeps buffer open in the background.
o.hidden = true
-- line wrapping
o.scrolloff = 6 -- only show X line below & above while scrolling
o.sidescrolloff = 14 -- scroll limit for lines
o.wrap = true -- default unable already no need
o.linebreak = true -- no more word break in wrapping
o.wrapmargin= 0 -- wrap only when window can't handle text correctly

-- Search settings
o.ignorecase = true  -- do not mind CASE in /searching
o.smartcase = true -- idk?

-- UI & plugin needs
-- Cursor line
-- o.cursorline = true -- highlight currunt line | having a plugin now

-- appearance
--o.background = "dark" -- also used for thmes support | idk realy
o.termguicolors = true -- most of theme need it
o.showmatch = true -- highlight matching [{()}]
o.guifont = "Delugia:h13" -- Font and size
--o.signcolumn = "yes" --- when i said do not use what u dont know
--o.showcmd = true -- show commands in bottom bar

-- Statusline
o.laststatus = 3
-- <BS>
--o.backspace = "indent,eol,start" -- i Don't know about it

-- clipboard  force sys to combine  i dont want it
--o.clipboard:append("unnamedplus")

-- split windows
o.splitright = true
o.splitbelow = true
