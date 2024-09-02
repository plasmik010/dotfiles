return {
    'lukas-reineke/indent-blankline.nvim', -- broken
    main = "ibl",
    enabled = true,
    config = function()
        -- local lochl = { "CursorColumn", "Whitespace", "WildMenu" }
        local lochl = { "CursorColumn", "CursorColumn", "WildMenu" }
        H.nmap(',vi', ":IBLToggle<CR>", "Indent Blank Line")
        require'ibl'.setup {
            exclude = { filetypes = {'dashboard'}},
            -- {'lspinfo', 'checkhealth', 'help', 'man', '', 'startify'}
            -- {'terminal', 'nofile', 'quickfix', 'prompt', 'help', 'startify'}
            indent = {
                -- highlight = { "WildMenu", "WildMenu" },
                highlight = { "SpecialKey", "SpecialKey" },
                -- show_start = true,
                -- show_end = false,
                -- highlight = lochl,
                -- char = "┊",
                char = "▏",
                -- ┊ │ ⋮ ⋅ ░ ∷ ║
            },
            scope = {
                -- highlight = lochl,
                -- enabled = false,
                highlight = { "SpecialKey", "SpecialKey" },
                char = "∷",
            },
            -- whitespace = { highlight = highlightL, remove_blankline_trail = false },
        }
    end,
}

