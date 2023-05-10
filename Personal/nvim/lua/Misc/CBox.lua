
 -- Beautiful comments box
local keymap = vim.keymap.set
local cb = require("comment-box")

-- left aligned fixed size box with left aligned text
keymap({ "n", "v"}, "<Leader>bb", cb.llbox, {})
-- centered adapted box with centered text
keymap({ "n", "v"}, "<Leader>bc", cb.acbox, {})

-- centered line
keymap("n", "<Leader>bl", cb.line, {})
keymap("i", "<M-l>", cb.cline, {})

