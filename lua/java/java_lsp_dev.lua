local dev_project = require("java.dev_project")

vim.lsp.config("java-lsp-dev", {
	cmd = { vim.fn.expand("~/private/java_lsp/target/debug/java-lsp") },
	root_dir = function(bufnr, on_dir)
		local root = dev_project.root_for(vim.api.nvim_buf_get_name(bufnr))
		if root then
			on_dir(root)
		end
	end,
})
vim.lsp.enable("java-lsp-dev")
