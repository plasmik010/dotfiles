return {
    'nvim-neo-tree/neo-tree.nvim', -- almost great
    dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    opts = {
        filesystem = {
          filetered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
          },
            -- hijack_netrw_behavior = "open_default",
            hijack_netrw_behavior = "open_current",
            -- hijack_netrw_behavior = "disabled",
        }
    }
}

