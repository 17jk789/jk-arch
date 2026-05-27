-- plugins/lualine.lua

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- local function battery()
    --   local handle = io.popen("acpi -b 2>/dev/null | grep -o '[0-9]\\+%' | head -n1 | tr -d '%'")
    --   if handle then
    --     local result = handle:read("*a")
    --     handle:close()
    --     result = string.gsub(result, "%D", "") -- Nur Zahlen extrahieren
    --     if tonumber(result) then
    --       local charge = tonumber(result)
    --       local icon = " "
    --       if charge < 20 then
    --         icon = " "
    --       elseif charge < 40 then
    --         icon = " "
    --       elseif charge < 60 then
    --         icon = " "
    --       elseif charge < 80 then
    --         icon = " "
    --       end
    --       return icon .. charge .. "%%"
    --     end
    --   end
    --   return " N/A"
    -- end

    -- LSP
    local function lsp_server()
      local clients = vim.lsp.get_clients({ bufnr = 0 })

      if not clients or vim.tbl_isempty(clients) then
        return "  None"
        -- return "  None"
      end

      local names = {}

      for _, client in ipairs(clients) do
        if client.name and client.name ~= "null-ls" then
          local name = client.name

          -- kürzen auf max 8 Zeichen
          if #name > 8 then
            name = name:sub(1, 9) .. "…"
          end

          names[#names + 1] = name
        end
      end

      if #names == 0 then
        return "  None"
        -- return "  None"
      end

      return "  " .. table.concat(names, ", ")
      -- return "  " .. table.concat(names, ", ")
    end

    -- Anzahl geladener Plugins (LazyVim / lazy.nvim)
    local plugin_cache = nil

    -- wird genau einmal nach Lazy-Load gesetzt
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyDone",
      callback = function()
        local ok, lazy = pcall(require, "lazy")
        if not ok then
          return
        end

        local stats = lazy.stats()
        plugin_cache = (stats and stats.loaded) or 0
      end,
    })

    local function plugins_loaded()
      -- Fallback, falls Lazy noch nicht fertig ist
      if plugin_cache == nil then
        local ok, lazy = pcall(require, "lazy")
        if not ok then
          -- return "  0"
          return " 󰗼 0"
        end

        local stats = lazy.stats()
        -- return "  " .. ((stats and stats.loaded) or 0)
        return " 󰗼 " .. ((stats and stats.loaded) or 0)
      end

      -- return "  " .. plugin_cache
      return " 󰗼 " .. plugin_cache
    end

    -- Kodierung (UTF-8 etc.)
    local function encoding()
      local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
      -- return " " .. enc:upper()
      return " " .. enc:upper()
      -- return enc:upper()
    end

    local function file_format()
      local fmt = vim.bo.fileformat:upper()
      local icon = fmt == "UNIX" and "LF" or "CRLF"
      return " " .. icon .. " "
    end

    -- Füge Komponenten mit Trennern hinzu
    -- local x = opts.sections.lualine_x
    -- table.insert(x, 1, { battery, separator = { right = "" } })
    -- table.insert(x, 2, { lsp_server, separator = { right = "" } })
    -- table.insert(x, 3, { encoding, separator = { right = "" } })
    -- table.insert(x, 1, { battery })
    -- table.insert(x, 2, { lsp_server })
    -- table.insert(x, 3, { encoding })

    -- Stelle sicher, dass theme auf catppuccin steht
    opts.options = vim.tbl_extend("keep", opts.options or {}, {
      theme = "catppuccin",
    })

    -- Prüfen, ob ein Akku-Verzeichnis existiert (funktioniert unter Linux/macOS)
    local has_battery = vim.fn.isdirectory("/sys/class/power_supply/BAT0") == 1 
                    or vim.fn.isdirectory("/sys/class/power_supply/BAT1") == 1

    -- Füge Komponenten OHNE feste Farben hinzu
    -- if has_battery then
    --   table.insert(opts.sections.lualine_z, 1, {
    --     battery,
    --     separator = { left = "", right = "" },
    --   })
    -- end

    table.insert(opts.sections.lualine_y, 1, {
      lsp_server,
      separator = { left = "", right = "" },
    })

    table.insert(opts.sections.lualine_y, 2, {
      plugins_loaded,
      separator = { left = "", right = "" },
    })

    table.insert(opts.sections.lualine_y, 3, {
      encoding,
      separator = { left = "", right = "" },
    })

    table.insert(opts.sections.lualine_y, 4, {
      file_format,
      separator = { left = "", right = "" },
    })
  end,
}

