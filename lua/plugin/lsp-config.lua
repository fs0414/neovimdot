local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')
require('nvim-autopairs').setup{}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

local custom_on_publish_diagnostics = function(_, result, ctx, config)
  local filtered_diagnostics = {}
  for _, diagnostic in ipairs(result.diagnostics) do
    if diagnostic.severity ~= vim.diagnostic.severity.INFO and diagnostic.severity ~= vim.diagnostic.severity.WARN then
       table.insert(filtered_diagnostics, diagnostic)
    end
  end
  result.diagnostics = filtered_diagnostics
  vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end

require('mason').setup {
 ui = {
   check_outdated_packages_on_open = false,
   border = 'single',
 },
}

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  focusable = true,
  float = {
    show_header = true,
    source = 'cursor',
    border = 'rounded',
    focusable = true,
  },
})

function ShowDiagnostics()
  local opts = {
    close_events = {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"},
    border = 'single',
    source = 'current',
    prefix = ' ',
    focusable = true,
  }
  vim.diagnostic.open_float(nil, opts)
end

function PrintDiagnosticConfig()
    local config = vim.diagnostic.config()
    print(vim.inspect(config))
end

vim.api.nvim_set_keymap('n', '<c-m>', '<cmd>lua ShowDiagnostics()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua PrintDiagnosticConfig()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = vim.api.nvim_get_hl_by_name('Normal', true).background })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = vim.api.nvim_get_hl_by_name('Normal', true).background })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single",
    width = 70,
    height = 10,
    row = 10,
    col = 5,
    style = "minimal",
    focusable = false,
  }
)

vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})

function open_doc_url()
    --local hover_data = vim.lsp.util.hover_contents()
    --local url = string.match(hover_data, "http[s]?://[%w%.%-%/%?%=]+")
    local url = "typescipt"
    if url then
        os.execute("open " .. url)  -- macOSの場合は 'open'、Linuxの場合は 'xdg-open'
    else
        print("No URL found in hover information")
    end
end

-- キーマッピングを設定
vim.api.nvim_set_keymap('n', '<Leader>o', ':lua open_doc_url()<CR>', { noremap = true, silent = true })

require("hover").setup {
  init = function()
      require("hover.providers.lsp")
  end,
  preview_opts = {
      border = 'single'
  },
  preview_window = true,
  title = true,
  mouse_providers = {
      'LSP'
  },
  mouse_delay = 1000
}

vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})

-- Mouse support
vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true

-- lspconfig
lspconfig.graphql.setup{
  root_dir = function(fname)
    return lspconfig.util.root_pattern('package.json', '.git', '.graphqlrc', '.graphqlrc.json')(fname) or vim.fn.getcwd()
  end,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_lspconfig = require("mason-lspconfig")
local servers = {
  graphql = {
    filetypes = { "graphql" },
    root_dir = function(fname)
      return lspconfig.util.root_pattern('package.json', '.git', '.graphqlrc', '.graphqlrc.json')(fname) or vim.fn.getcwd()
    end,
  },
  prismals = {},
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
      handlers = {
        ["textDocument/publishDiagnostics"] = custom_on_publish_diagnostics,
      },
    }
  end
}

require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

-- cmp
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered({
        order = 'single'
      }),
      documentation = cmp.config.window.bordered({
        border = 'single'
      }),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
    },
})
