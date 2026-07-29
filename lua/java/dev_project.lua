local repo_root = vim.fn.expand("~/private/java_lsp")

local M = {}

-- The dev project root that should own `bufname`, or nil if it isn't part
-- of the java-lsp dev/test setup at all. Covers `testbed/` (one project) and
-- `tests/fixtures/<name>/` (each immediate child of `tests/fixtures` is its
-- own independent sample project, so it needs its own root for java-lsp's
-- build-tool detection to work).
function M.root_for(bufname)
	local testbed = repo_root .. "/testbed"
	if vim.startswith(bufname, testbed .. "/") then
		return testbed
	end

	local fixtures_prefix = repo_root .. "/tests/fixtures/"
	if vim.startswith(bufname, fixtures_prefix) then
		local fixture_name = bufname:sub(#fixtures_prefix + 1):match("^([^/]+)")
		if fixture_name then
			return fixtures_prefix .. fixture_name
		end
	end

	return nil
end

return M
