-- Leader key before Lazy <SPACE>
-- vim.cmd([[ nnoremap <Space> <NOP>]])
vim.g.mapleader = " "
vim.g.maplocalleader = " "

 -- Lazy
 require('Lazy')
 -- Neovide
if vim.g.neovide then
require('Neovide')
end

 -- -- setting nvim
 require('Options')
 -- -- Calling external Files
 require('Misc.venn')  -- Draw Art venn using <leader>v
 -- require('Cy_Bu') -- cybu, reach
 -- require('Tmux') -- Windows, Smart splits, resize, swap -keybinds
 -- require('Mark_s') -- marks on sidebar
 -- require('Key_s') -- Which.key, legendary, keymaps
 -- --require('lua_line')  -- my statusline no use
 -- -- Calling me Lazy
-- Last space
require'nvim-lastplace'.setup {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
}


 -- Vimscript for things i dont't know lua

 vim.cmd([[
 "set nushell
 " let &shell = 'nu'
 " let &shellcmdflag = '-c'
 " let &shellquote = ""
 " let &shellxquote = ""
 "

 " save session first learn about session
 "nnoremap <leader>s :mksession<CR>

 ]])


--Colorscheme
 -- local colorscheme = "rose-pine"
 -- local colorscheme = "kyotonight"
 -- local colorscheme = "blue-moon"
 local colorscheme = "kanagawa-wave"
 -- local colorscheme = "catppuccin-frappe"
 -- local colorscheme = "catppuccin-macchiato"

local colo, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
 if not colo then
   print("Colorscheme not found! set to habamax") -- print error if colorscheme not installed
   vim.cmd "colorscheme habamax"
   return
 end

 --  Keymaps
 -- Leader is set before Lazy
 local key = vim.keymap -- for ease

 -- Line movement
 key.set("n", "j", "gj") -- move vert by visual line
 key.set("n", "k", "gk") -- move vert by visual line

 -- go to  beginning and end
 key.set("i", "<C-b>", "<ESC>I") -- "beginning of line"
 key.set("i", "<C-e>", "<End>")--"end of line" },

  -- navigate within insert mode
 key.set("i", "<C-h>","<Left>") --"move left"
 key.set("i", "<C-l>","<Right>") -- "move right"
 key.set("i", "<C-j>","<Down>") --  "move down"
 key.set("i", "<C-k>","<Up>") --  "move up"

 -- highlight last edited or inserted text
 key.set("n", "<Esc>", ":nohl<CR>")

 -- Visual mode
 key.set("v", "p", '"_dP', opts)      -- persist yanked word, not overwrite it

 -- I use neovim, btw
 -- edit load vimrc bindings
  key.set("n", "<leader>Lc", ":exe 'edit' stdpath('config').'/init.lua'<CR>")
  key.set("n", "<leader>LL", "<cmd>Lazy<cr>")
 --key.set("n", "<leader>P", ":e "$profile"<CR>")


 -- Splits  & windows
  key.set("n", "<leader>sh", "<C-w>v") -- split window vert
  key.set("n", "<leader>sv", "<C-w>s") -- split window horiz
  key.set("n", "<leader>se", "<C-w>=") -- make window equal width
  key.set("n", "<leader>sx", ":close<CR>") -- close current split

 -- Tabs
  key.set("n", "<leader>to", ":tabnew<CR>") -- open new Tab
  key.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
  key.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
  key.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab

 -- buffers
  key.set("n", "<leader>x", ":q<CR>") -- close buffer
  key.set("n", "<leader>n", ":bn<CR>") -- go to next tab
  key.set("n", "<leader>p", ":bp<CR>") -- go to prev tab

 -- Copy paste
  key.set('n', '<C-s>', ':w<CR>') -- Save
  key.set('v', '<C-c>', '"+y') -- Copy
  key.set('n', '<C-V>', '"+P') -- Paste normal mode
  key.set('v', '<C-v>', '"+P') -- Paste visual mode
  key.set('c', '<C-v>', '<C-R>+') -- Paste command mode
  key.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Plugin Binding
  local opts = { noremap = true, silent = true } -- icon, color picker uses it as (opts,)

  -- Games or Destroy
  key.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
--
  -- File Manager
  key.set("n", "<leader>e", "<cmd>SFMToggle<CR>",{desc ="SFM Tree"} ) -- toogle exp file

  -- Url
  key.set("n", "gx", "<Cmd>VisitLinkUnderCursor<CR>", { desc = "Vist Links replace netrw" })

  -- ReachOpen.lua binds
  require('reach').setup({ notifications = true})
  key.set('n', '<leader>rb', function() require('reach').buffers(buffer_options) end, {})
  key.set('n', '<leader>rm', function() require('reach').marks(buffer_options) end, {})   -- Switch marks with <space>rm
  key.set('n', '<leader>rt', function() require('reach').tabpages(buffer_options) end, {})
  key.set('n', '<leader>rc', function() require('reach').colorschemes(buffer_options) end, {})  -- Switch colorscheme with <space>rc

  -- Cy[cle]bu[ffer].
  -- key.set("n", "<s-tab>", "<Cmd>CybuPrev<CR>",)
  -- key.set("n", "<tab>", "<Cmd>CybuNext<CR>",)
  -- key.set("n", "[b", "<Cmd>CybuLastusedPrev<CR>",)
  -- key.set("n", "]b", "<Cmd>CybuLastusedNext<CR>",)


  -- icon
  -- key.set("i", "<C-1>",function() require'telescope.builtin'.symbols{ sources = {'emoji'} } end, {})
-- vim.keymap.set("i", "<C-S-i>", "<cmd>IconPickerInsert<cr>", { noremap = true, silent = true }, {desc = "pick icon" })
 key.set("i", "<C-S-i>", "<cmd>IconPickerInsert<cr>", { noremap = true, silent = true }, {desc = "pick icon" })


 -- Code manipulation
 -- align lines
local NS = { noremap = true, silent = true }
vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)        end, NS) -- Aligns to 1 character, looking left
vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)  end, NS) -- Aligns to 2 characters, looking left and with previews
vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews
