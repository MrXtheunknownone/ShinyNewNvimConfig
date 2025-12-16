local java_dir = vim.fn.expand("~/.config/nvim/lua/java/")

vim.lsp.config("jdtls", {

	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	-- cmd = { "jdtls", "-jar", "-javaagent:" .. java_dir .. "lombok.jar" },
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
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
		"/home/tim/.cache/jdtls",
	},

	root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }),

	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	settings = {
		java = {
			format = {
				enabled = true,
				settings = {
					url = java_dir .. "eclipse-java-google-style.xml",
				},
			},
		},
	},

	init_options = {
		bundles = {},
	},
})
vim.lsp.enable("jdtls")
-- require("jdtls").start_or_attach(config)
