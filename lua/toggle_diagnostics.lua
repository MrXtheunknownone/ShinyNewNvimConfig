M = {}
M.showDiagnostics = true

M.toggle_inline_diagnostics = function()
  local show = not M.showDiagnostics
  vim.diagnostic.config({
    virtual_lines = show
  })
  M.showDiagnostics = show
  print("showDiagnostics: " .. tostring(show))
end

return M
