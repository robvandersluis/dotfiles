local utils = require("utils")
if utils.is_mac() then
	print("Running on macOS")
else
	print("Neus")
end
return {
	{ dir = "~/plugins/gitcommit-ai.nvim" },
}
