-- Sfm file mananger
require("sfm").setup({
 view = {
    side = "right", -- side of the tree, can be `left`, `right`. this setting will be ignored if view.float.enable is set to true,
    width = 2, -- this setting will be ignored if view.float.enable is set to true,
    float = {
      enable = true,
      config = {
        relative = "editor",
        border = "rounded",                 --    ┌────────────────┐
        width = 40, -- int or function      --    │                │
        height = 10, -- int or function     --    │   dinhhuy258   ├────────►  PLEASE ADD more info to comments             ╔════════╗
        row = 1, -- int or function         --    │                │            what does "int or function" mean!?    AGAIN ║ PLEASE ║
        col = 1 -- int or function          --    └────────────────┘                                                        ╚════════╝
      } } },
  mappings = {
    custom_only = true,
    list = {
      { key =    "u",  action = "parent_entry",},	-- Move cursor to the parent directory
      { key =    "h",  action = "parent_entry",},	-- Move cursor to the parent directory
      { key =    "p",  action = "parent_entry",},	-- Move cursor to the parent directory
     -- Edit
      { key =    "l",  action = "edit", },
      { key = "<cr>",  action = "edit", },
     -- { key ="<s-tab>", action = "close_entry", },
     { key =   "c>", action = "close_entry", },	-- Close current opened directory or parent
     -- Quit
      { key =     "x", action = "close", },
      { key =     "q", action = "close", },
      { key = "<esc>", action = "close", },
      { key = "<C-r>", action = "reload", }, -- Reload the explorer
     -- Splits
      { key = "<C-h>", action = "vsplit" },
      { key = "<C-v>", action = "split" },
      { key = "<C-t>", action = "tabnew" },
     -- Movement
      { key = "J",     action = "first_sibling" }, --	Navigate to the first sibling of current file or directory
      { key = "K",     action = "last_sibling" },  -- Navigate to the last sibling of current file or directory
    } },
  load_extension = {"sfm-fs"},
})
