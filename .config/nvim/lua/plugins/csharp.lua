-- plugins/csharp.lua

return {
  -- Roslyn LSP
  {
    "seblj/roslyn.nvim",
    ft = { "cs", "razor", "cshtml" },

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      require("roslyn").setup({
        args = {
          "--logLevel=Error",
        },

        config = {
          capabilities = capabilities,

          settings = {
            ["csharp|inlay_hints"] = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              csharp_enable_inlay_hints_for_lambda_parameter_types = true,
              csharp_enable_inlay_hints_for_types = true,
            },
          },
        },
      })

      -- LSP Extras
      local group = vim.api.nvim_create_augroup("RoslynExtras", {
        clear = true,
      })

      vim.api.nvim_create_autocmd({
        "BufEnter",
        "CursorHold",
        "InsertLeave",
      }, {
        group = group,
        pattern = "*.cs",
        callback = function()
          pcall(vim.lsp.codelens.refresh)
        end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client and client.name == "roslyn" then
            pcall(function()
              vim.lsp.inlay_hint.enable(true, {
                bufnr = args.buf,
              })
            end)
          end
        end,
      })
    end,
  },

  -- easy-dotnet
  {
    "GustavEikaas/easy-dotnet.nvim",

    ft = {
      "cs",
      "csproj",
      "sln",
      "razor",
      "cshtml",
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      local dotnet = require("easy-dotnet")

      dotnet.setup()

      local opts = {
        noremap = true,
        silent = true,
      }

      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", opts, {
          desc = desc,
        }))
      end

      map("<leader>.r", dotnet.run, ".NET Run")
      map("<leader>.b", dotnet.build, ".NET Build")
      map("<leader>.s", dotnet.build_solution, ".NET Build Solution")
      map("<leader>.t", dotnet.test, ".NET Test")
      map("<leader>.n", dotnet.nuget, "NuGet")

      map("<leader>.R", dotnet.restore, ".NET Restore")
      map("<leader>.c", dotnet.clean, ".NET Clean")
      map("<leader>.p", dotnet.publish, ".NET Publish")
    end,
  },
}
