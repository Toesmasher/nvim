local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local status_ok2, luasnip = pcall(require, "luasnip")
if not status_ok2 then
  return
end

local status_ok3, lspkind = pcall(require, "lspkind")
if not status_ok3 then
  return
end

cmp.setup({
  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None"
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None"
    },
  },

  snippet = {
    expand = function(args)
      if luasnip then
        luasnip.lsp_expand(args.body)
      end
    end,
  },

  preselect = cmp.PreselectMode.None,

  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        else
          cmp.select_next_item()
        end
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        else
          cmp.select_prev_item()
        end
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "path" },
    -- { name = "buffer" },
    { name = "luasnip" },
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      before = function(entry, vim_item)
        -- Modify here
        return vim_item
      end
    })
  },
})
