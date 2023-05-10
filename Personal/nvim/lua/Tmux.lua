-- Window Manager
local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end
require("windows").setup({
   autowidth = {			--		       |windows.autowidth|
      enable = true,
      winwidth = 5,			--		        |windows.winwidth|
      filetype = {			--	      |windows.autowidth.filetype|
         help = 2,
      },
   },
   ignore = {				--			  |windows.ignore|
      buftype = { "quickfix" },
      filetype = { "NvimTree", "neo-tree", "undotree", "oil","sfm" }
   },
   animation = {
      enable = true,
      duration = 100,
      fps = 30,
      easing = "in_out_sine"
   }
})

-- Windows keymaps
vim.keymap.set('n', '<Leader>z', cmd 'WindowsMaximize')
vim.keymap.set('n', '<Leader>sm', cmd 'WindowsMaximize')
vim.keymap.set('n', '<Leader>_', cmd 'WindowsMaximizeVertically')
vim.keymap.set('n', '<Leader>|', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', '<Leader>=', cmd 'WindowsEqualize')

-- smart-splits
require('smart-splits').setup({
  resize_mode = {
    silent = true,
    hooks = {
      on_enter = function()
        vim.notify('Entering resize mode')
      end,
      on_leave = function()
        vim.notify('Exiting resize mode, bye')
      end,
    },
  },
})
-- resizing splits
-- note : if `wezterm` use this
-- https://github.com/mrjones2014/smart-splits.nvim#wezterm-
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<C-S-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-S-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-S-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-S-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
