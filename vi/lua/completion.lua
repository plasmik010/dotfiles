---------- Completion --------------------------{{{}}}------

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local nc_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.opt.completeopt={"menu", "noselect"}
-- vim.opt.completeopt={"menu", "menuone", "noselect"}

local cmp = require("cmp")
-- local luasnip = require("luasnip")

local cmp_select = { behavior = cmp.SelectBehavior.Select }

--[[ local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-t>"] = cmp.mapping.complete(),
  ["<C-c>"] = cmp.mapping.abort(),
}) ]]

cmp.setup {
  -- snippet = {
  --   expand = function(args)
  --     luasnip.lsp_expand(args.body)
  --   end,
  -- },
  --[[ mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  } ]]
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-e>'] = cmp.mapping.complete(),
    ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    --[[ ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }), ]]
    --[[ ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }), ]]
  },
  sources = {
    { name = 'nvim_lsp' },
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  },
  -- sources = cmp.config.sources({ }, { { name = 'buffer' } )
}

