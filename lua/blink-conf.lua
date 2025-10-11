local vim = vim
local blink = require('blink.cmp')
blink.setup({
  -- LSP capabilities for textDocument/definition and textDocument/hover
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lsp = {
        name = 'LSP',
        enabled = true,
        module = 'blink.cmp.sources.lsp',
        -- Use fallbacks instead of fallback_for (new API)
        fallbacks = {},
      },
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        -- lazydev falls back to lsp if it doesn't have results
        fallbacks = { 'lsp' },
      },
    },
  },

  -- Keymap configuration to enable hover and definition
  keymap = {
    preset = 'none', -- 'none'にしてカスタムキーマップのみ使用
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'cancel', 'fallback' }, -- hideからcancelに変更
    ['<Esc>'] = { 'cancel', 'fallback' }, -- Escで補完をキャンセル
    ['<CR>'] = { 'accept', 'fallback' }, -- Enterで確定
    ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'select_prev', 'fallback' },
    ['<C-n>'] = { 'select_next', 'fallback' },
    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
  },

  appearance = {
    -- Use default Neovim colors
    use_nvim_cmp_as_default = false,
    -- Show documentation window
    nerd_font_variant = 'mono',
  },

  completion = {
    accept = {
      -- Automatically insert brackets for functions
      auto_brackets = {
        enabled = true,
      },
    },
    ghost_text = {
      enabled = false, -- ゴーストテキストを無効化（誤入力を防ぐ）
    },
    menu = {
      -- Menu appearance
      border = 'single',
      winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
      -- Draw options
      draw = {
        columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = 'single',
        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder',
      },
    },
  },

  -- Signature help configuration
  signature = {
    enabled = true,
    window = {
      border = 'single',
      winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
    },
  },
})

-- Set highlight groups to match background
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- 補完メニューの背景を透明に（ターミナルの背景と同じになる）
    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#808080", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#ffffff", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#808080", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#808080", bg = "NONE" })

    -- 選択項目のハイライト（少し暗めのグレー）
    vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#2a2a2a" })

    -- Kind icons colors
    vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = "#00ffff" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { fg = "#00ffff" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = "#00ffff" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { fg = "#ffaa00" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = "#00ff00" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = "#ff00ff" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = "#ffaa00" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = "#ffaa00" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { fg = "#ffaa00" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { fg = "#00ff00" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { fg = "#ff00ff" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { fg = "#ffaa00" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = "#ff00ff" })
    vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = "#00ffff" })
  end,
})

-- Apply highlight settings immediately
-- 補完メニューの背景を透明に（ターミナルの背景と同じになる）
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#808080", bg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#808080", bg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#808080", bg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#2a2a2a" })

-- Pmenu関連のハイライトも透明に設定
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#808080" })

-- FloatBorderとNormalFloatも透明に
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#808080", bg = "NONE" })

-- Enable LSP capabilities for definition and hover
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      -- Ensure capabilities are set
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Add specific mappings for definition and hover
      local opts = { buffer = args.buf, noremap = true, silent = true }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    end
  end
})

-- Keymap configuration for blink.cmp
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Insert mode mappings for completion
map('i', '<C-Space>', '<cmd>lua require("blink.cmp").show()<CR>', opts)
map('i', '<C-e>', '<cmd>lua require("blink.cmp").cancel()<CR>', opts)
map('i', '<C-y>', '<cmd>lua require("blink.cmp").accept()<CR>', opts)
map('i', '<C-n>', '<cmd>lua require("blink.cmp").select_next()<CR>', opts)
map('i', '<C-p>', '<cmd>lua require("blink.cmp").select_prev()<CR>', opts)
map('i', '<C-u>', '<cmd>lua require("blink.cmp").scroll_documentation_up()<CR>', opts)
map('i', '<C-d>', '<cmd>lua require("blink.cmp").scroll_documentation_down()<CR>', opts)

-- Command-line mode mappings
map('c', '<C-Space>', '<cmd>lua require("blink.cmp").show()<CR>', opts)
map('c', '<Tab>', '<cmd>lua require("blink.cmp").select_next()<CR>', opts)
map('c', '<S-Tab>', '<cmd>lua require("blink.cmp").select_prev()<CR>', opts)

-- Snippet navigation
map('i', '<Tab>', '<cmd>lua require("blink.cmp").snippet_forward()<CR>', opts)
map('i', '<S-Tab>', '<cmd>lua require("blink.cmp").snippet_backward()<CR>', opts)

return {
  capabilities = blink.get_lsp_capabilities(),
}
