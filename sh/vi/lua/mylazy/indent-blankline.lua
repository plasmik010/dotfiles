return  {
    'lukas-reineke/indent-blankline.nvim', -- broken
    main = "ibl",
    enabled = true,
    config = function()
        -- local lochl = { "CursorColumn", "Whitespace", "WildMenu" }
        local lochl = { "CursorColumn", "CursorColumn", "WildMenu" }
        require'ibl'.setup {
            exclude = { filetypes = {'dashboard'}},
            -- {'lspinfo', 'checkhealth', 'help', 'man', '', 'startify'}
            -- {'terminal', 'nofile', 'quickfix', 'prompt', 'help', 'startify'}
            indent = {
                -- highlight = { "WildMenu", "WildMenu" },
                highlight = { "SpecialKey", "SpecialKey" },
                -- highlight = lochl,
                char = "┊",
                -- ┊ │ ⋮ ⋅ ░ ∷
            },
            scope = {
                -- highlight = lochl,
                highlight = { "SpecialKey", "SpecialKey" },
                char = "│",
            },
            -- whitespace = { highlight = highlightL, remove_blankline_trail = false },
        }
    end,
}

