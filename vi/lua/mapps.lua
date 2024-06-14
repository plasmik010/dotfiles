-- init mapping like they do it in NvChad

local M = {}

M.dap = {
  plugin = true,
  n = {
    [",,s"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "EXPE",
    },
  }
}

-- require'core.utils'.load_mappings()

return M

