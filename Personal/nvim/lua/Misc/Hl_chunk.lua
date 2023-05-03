require('hlchunk').setup({
  chunk = { enable = true, }, -- the ──► like Joint idk
indent = { chars = { "│", }, -- the staright line showing a code block
    -- style = { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") .. "bold", },
    style = { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui")  },
},

line_num =  -- hightl code blcok nums
    { style = "#806d9c", },

    blank =  -- those dots on blank spaces
    {
        enable = true,
        chars = { "․", },
    exclude_filetype = {
        dashboard = true,
        help = true,
        lspinfo = true,
        packer = false,
        checkhealth = true,
        man = true,
        mason = true,
        NvimTree = false,
        plugin = false,
    },
    },



})
