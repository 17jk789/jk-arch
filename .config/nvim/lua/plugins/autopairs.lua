-- plugin/autopairs.lua

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",

    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.setup({
        check_ts = true, -- wichtig für Treesitter Integration
      })

      npairs.add_rules({
        Rule("{", "};", "cpp"),
      })
    end,
  },
}
