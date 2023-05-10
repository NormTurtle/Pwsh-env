-- Sfm file mananger
local sfm_explorer = require("sfm").setup({
 view = {
    side = "left", -- side of the tree, can be `left`, `right`. this setting will be ignored if view.float.enable is set to true,
    width = 31, -- this setting will be ignored if view.float.enable is set to true,
    float = {
      enable = false,
      config = {
        relative = "cursor",
        border = "rounded",
        width = 35, -- int or function
        height = 20, -- int or function
        row = 5, -- int or function
        col = 5 -- int or function
      } } },
  mappings = {
    custom_only = true,
    list = {
     -- Edit
      { key = "h",     action = "change_root_to_parent",},--Change root dir, parent dir of the current entry
      { key = "o",     action = "change_root_to_entry",},	--Change root dir, current folder entry or to the parent dir of current file entry
      { key = "<tab>", action = "change_root_to_entry",},	--Change root dir, current folder entry or to the parent dir of current file entry
      { key = "u",     action = "parent_entry",},	-- Move cursor to the parent directory
      { key = "l",     action = "edit", },
      { key = "<cr>",  action = "edit", },
     { key ="<s-tab>", action = "close_entry", },	-- Close current opened directory or parent
     -- Quit
      { key =     "q", action = "close", },
      { key = "<esc>", action = "close", },
      { key = "<C-r>", action = "reload", }, -- Reload the explorer
     -- Splits
      { key = "<C-h>", action = "vsplit" },
      { key = "<C-v>", action = "split" },
      { key = "<C-t>", action = "tabnew" },
     -- Movement
      { key = "p",     action = "parent_entry",},	-- Move cursor to the parent directory
      { key = "J",     action = "first_sibling" }, --	Navigate to the first sibling of current file or directory
      { key = "K",     action = "last_sibling" },  -- Navigate to the last sibling of current file or directory
    } },
})

sfm_explorer:load_extension("sfm-fs", {
  view = {
    -- this option allows you to specify where to render the selection icon in the file explorer.
    -- the default value is `false`, which means the selection icon will be rendered before the entry name.
    -- if you set this option to `true`, the selection icon will be rendered in the Vim sign column.
    render_selection_in_sign = false, },
  icons = { selection = "", },
   mappings = {
    custom_only = true,
    list = {
      -- Manipulation
      { key = "a", action = "create", },	              --  Create a new file/directory in the current folder
      { key = "y", action = "copy", },	                -- 	Copy the current file or directory to a destination path specified by the user
      { key = "c", action = "copy", },	                -- 	Copy the current file or directory to a destination path specified by the user
      { key = "p", action = "copy_selections", },	      --  Copy all selected files or directories to the current folder
      { key = "r", action = "move", },	                -- 	Move/rename the current file or directory
      { key = "x", action = "move_selections", },	      -- 	Move all selected files or directories to the current folder
      -- Delete
      { key = "dd", action = "delete", },               --  Delete the current file or directory
      { key = "ds", action = "delete_selections", },    --  Delete all selected files or directories
      -- Selection
      -- { key = "space", action = "toggle_selection", },   --  Toggle the selection of the current file or directory
      { key = "<leader>", action = "toggle_selection", },   --  Toggle the selection of the current file or directory
      { key = "v", action = "toggle_selection", },      --  Toggle the selection of the current file or directory
      { key = "c-space", action = "clear_selections", }, -- Clear all selections
      { key = "C", action = "clear_selections", }, -- Clear all selections
  }
}
})

sfm_explorer:load_extension("sfm-filter", {
  show_hidden = false,
  -- ignore_names = {
  --   "node_modules"
  -- },
  mappings = {
    toggle_filter = { ".", "H", },
  },
})

sfm_explorer:load_extension("sfm-git", {
  debounce_interval_ms = 1000,
  icons = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "",
    untracked = "U",
    deleted = "",
    ignored = "◌"
  },
})
