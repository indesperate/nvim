local vscode = require("vscode-neovim")

local map = vim.keymap.set
map("n", "<c-h>", function()
	vscode.call("workbench.action.focusLeftGroup")
end, { silent = true })
map("n", "<c-l>", function()
	vscode.call("workbench.action.focusRightGroup")
end, { silent = true })
map("n", "<c-j>", function()
	vscode.call("workbench.action.focusBelowGroup")
end, { silent = true })
map("n", "<c-k>", function()
	vscode.call("workbench.action.focusAboveGroup")
end, { silent = true })

map("n", "H", function()
	vscode.call("workbench.action.previousEditor")
end, { silent = true })
map("n", "L", function()
	vscode.call("workbench.action.nextEditor")
end, { silent = true })

map("n", "<leader>fg", function()
	vscode.call("workbench.action.experimental.quickTextSearch")
end, { silent = true })
map("n", "<leader>fs", function()
	vscode.call("workbench.action.gotoSymbol")
end, { silent = true })
map("n", "<leader>ff", function()
	vscode.call("workbench.action.quickOpen")
end, { silent = true })

map("n", "<leader>a", function()
	vscode.call("editor.action.quickFix")
end, { silent = true })
map("n", "<leader>r", function()
	vscode.call("editor.action.rename")
end, { silent = true })
map("n", "gr", function()
	vscode.call("editor.action.goToReferences")
end, { silent = true })
map("n", "gi", function()
	vscode.call("editor.action.goToImplementation")
end, { silent = true })
map("n", "gD", function()
	vscode.call("editor.action.revealDeclaration")
end, { silent = true })

map("n", "[g", function()
	vscode.call("workbench.action.editor.previousChange")
	vscode.call("workbench.action.compareEditor.previousChange")
end, { silent = true })
map("n", "]g", function()
	vscode.call("workbench.action.editor.nextChange")
	vscode.call("workbench.action.compareEditor.nextChange")
end, { silent = true })

map("n", "[d", function()
	vscode.call("editor.action.marker.prev")
end, { silent = true })
map("n", "]d", function()
	vscode.call("editor.action.marker.next")
end, { silent = true })

map("v", ">", function()
	vscode.call("editor.action.indentLines")
end, { silent = true })

map("v", "<", function()
	vscode.call("editor.action.outdentLines")
end, { silent = true })

map("v", "J", function()
	vscode.call("editor.action.moveLinesDownAction")
end, { silent = true })

map("v", "K", function()
	vscode.call("editor.action.moveLinesUpAction")
end, { silent = true })

map("n", "<leader>n", function()
	vscode.call("workbench.view.explorer")
end, { silent = true })
