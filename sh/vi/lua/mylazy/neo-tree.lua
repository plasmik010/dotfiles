return {
    'nvim-neo-tree/neo-tree.nvim', -- almost great
    dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    opts = {
        filesystem = {
            -- hijack_netrw_behavior = "open_default",
            hijack_netrw_behavior = "open_current",
            -- hijack_netrw_behavior = "disabled",
        }
    }
}

