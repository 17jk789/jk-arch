-- lsp/yaml.lua

local M = {}

M.setup = function(capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.yamlls.setup({
        capabilities = capabilities,

        filetypes = { "yaml", "yml" },

        settings = {
            yaml = {
                schemas = {
                    ["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.y*ml",
                },
            },
        },

        on_attach = function(client, bufnr)
            local buf_map = function(mode, lhs, rhs, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, lhs, rhs, opts)
            end
        end,
    })
end

return M
