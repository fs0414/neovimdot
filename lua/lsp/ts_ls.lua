---@type vim.lsp.Config
return {
  root_markers = {
    'package.json',
  },
  workspace_required = true,
  on_new_config = function(config, root_dir)
    -- Disable ts_ls if deno.json exists in the project
    -- local deno_json = vim.fn.findfile('deno.json', root_dir .. ';')
    -- if deno_json ~= '' then
    --   config.enabled = false
    -- end
  end,
}
