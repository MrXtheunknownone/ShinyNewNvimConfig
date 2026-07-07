local java_dir = vim.fn.expand("~/.config/nvim/lua/java/");

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t");

local bundles = {
	vim.fn.expand(
		"~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")
}

local function buf_in_diff(bufnr)
	for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
		if vim.api.nvim_get_option_value("diff", { win = win }) then
			return true
		end
	end
	return false
end

local function jdtls_running_for(root)
	for _, client in ipairs(vim.lsp.get_clients({ name = "jdtls" })) do
		if client.config.root_dir == root then
			return true
		end
	end
	return false
end

vim.lsp.config("jdtls", {
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	-- cmd = { "jdtls", "-jar", "-javaagent:" .. java_dir .. "lombok.jar" },
	cmd = {
		"java",
		"-Dfile.encoding=UTF-8", -- Because some people need to have ä, ö, ü in their filenames... o_O This won't work for Windows-german non UTF-8 though
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=INFO",
		"-Xms512m",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. java_dir .. "lombok.jar",
		"-jar",
		"/home/tim/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
		"-configuration",
		"/home/tim/.local/share/nvim/mason/packages/jdtls/config_linux",
		"-data",
		"/home/tim/.cache/jdtls/" .. project_name,
	},

	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, { "settings.gradle.kts", "gradlew", ".git", "mvnw" })
		if not root then
			return
		end

		local is_diff = buf_in_diff(bufnr) or vim.tbl_contains(vim.v.argv, "-d")
		if is_diff and not jdtls_running_for(root) then
			return -- diffing into a project with no jdtls running yet: don't start it
		end

		on_dir(root)
	end,

	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	settings = {
		java = {
			signatureHelp = { enabled = true },
			format = {
				enabled = false, -- Currently off. Using Google-Java-Format (See Mason)
				settings = {
					url = java_dir .. "eclipse-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
		},
	},
	init_options = {
		bundles = bundles,
	},
})
vim.lsp.enable("jdtls")
