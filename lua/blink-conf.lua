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
        fallbacks = {},
      },
      snippets = {
        name = 'Snippets',
        module = 'blink.cmp.sources.snippets',
        opts = {
          -- カスタムスニペットのみ読み込む（friendly-snippetsを無効化）
          search_paths = { vim.fn.stdpath('config') .. '/snippets' },
          global_snippets = {}, -- グローバルスニペットを空に
        },
      },
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        fallbacks = { 'lsp' },
      },
    },
  },

  -- Keymap configuration to enable hover and definition
  keymap = {
    preset = 'none', -- 'none'にしてカスタムキーマップのみ使用
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'cancel', 'fallback' }, -- hideからcancelに変更
    ['<Esc>'] = {
      function(cmp)
        if cmp.is_visible() then
          cmp.cancel()
        end
        vim.cmd('stopinsert') -- normal modeに戻る
      end,
    },
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
    list = {
      selection = {
        preselect = true,
        auto_insert = false, -- 選択移動時に自動挿入しない（確定で初めて反映）
      },
    },
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

  -- Signature help configuration (Neovim標準のLSP hoverを使用するため無効化)
  signature = {
    enabled = false,
  },
})

-- ハイライト設定
local function setup_blink_highlights()
  -- 補完メニュー
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#808080", bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#2a2a2a" })
  -- ドキュメント
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#ffffff", bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#808080", bg = "NONE" })
  -- Kind icons
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
  -- Pmenu
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2a2a2a" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#808080" })
end

setup_blink_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = setup_blink_highlights })

return {
  capabilities = blink.get_lsp_capabilities(),
}
