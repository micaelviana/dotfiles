local keyset = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set mapleader
vim.g.mapleader = " "

-- New lines
keyset("n", "<return>", "o<esc>", { noremap = true })

--Select all
vim.keymap.set("n", "sa", "ggVG", { noremap = true, silent = true })

--Set filetype
vim.keymap.set("n", "<leader>sf", ":set filetype=", { noremap = true, silent = false })

-- Save and close
keyset("n", "<leader>w", ":w<cr>", opts)
keyset("n", "<leader>q", ":xa<cr>", opts)
keyset("n", "\\w", ":w<cr>", opts)
keyset("n", "\\q", ":xa<cr>", opts)
keyset("n", "\\z", ":xa<cr>", opts)

-- Splits
keyset("n", "sh", ":split<cr>", opts)
keyset("n", "sv", ":vsplit<cr>", opts)

--Move line up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move Line Up in Visual Mode" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move Line Down in Visual Mode" })

-- Persistent indentation on visual mode
keyset("v", "<", "<gv", opts)
keyset("v", ">", ">gv", opts)

-- Close without save
keyset("n", "Q", ":qa!<cr>", { silent = true, noremap = true })

-- Make executable
keyset("n", "<space>x", ":!chmod +x %<cr>", { silent = true, noremap = true })

--Close Split
vim.keymap.set("n", "<space>2", ":close<cr>", { noremap = true, silent = true })

-- Paste in insert mode using Ctrl+V
keyset("i", "<c-v>", "<esc>pa", { noremap = true })

-- Go to normal mode
keyset({ "n", "v" }, "r", ":", { noremap = true })

--Search Text
keyset("n", "ss", "/", { noremap = true })

-- Select all
keyset("n", "\\a", "ggVG", { noremap = true })

-- Increment/decrement
keyset("n", "+", "<c-a>", { noremap = true })
keyset("n", "-", "<c-x>", { noremap = true })

-- Replace selected content faster
keyset("n", "(", ":%s///g<left><left>", { noremap = true })

-- Map Ctrl-Backspace to delete the previous word in insert mode
keyset("i", "<c-bs>", "<c-w>", { noremap = true })
keyset("i", "<c-h>", "<c-w>", { noremap = true })

-- Prevent x from overriding what's in the clipboard
keyset({ "n", "v" }, "x", '"_x', { noremap = true })
keyset({ "n", "v" }, "X", '"_x', { noremap = true })
keyset({ "n", "v" }, "<del>", '"_x', { noremap = true })

-- Keymap to change the working directory to the directory of the current file
vim.keymap.set("n", "<space>z", function()
	vim.cmd("lcd %:p:h")
	vim.cmd("pwd")
end, { noremap = true })

-- Keymap to create a GitHub repository
-- It uses the github CLI, which in macOS is installed with:
-- brew install gh
vim.keymap.set("n", "<leader>gc", function()
	-- Check if GitHub CLI is installed
	local gh_installed = vim.fn.system("command -v gh")
	if gh_installed == "" then
		print("GitHub CLI is not installed. Please install it using 'brew install gh'.")
		return
	end
	-- Get the current working directory and extract the repository name
	local cwd = vim.fn.getcwd()
	local repo_name = vim.fn.fnamemodify(cwd, ":t")
	if repo_name == "" then
		print("Failed to extract repository name from the current directory.")
		return
	end
	-- Display the message and ask for confirmation
	vim.ui.select({ "yes", "no" }, {
		prompt = 'The name of the repo will be: "' .. repo_name .. '". Continue?',
		default = "no",
	}, function(choice)
		if choice ~= "yes" then
			print("Operation canceled.")
			return
		end
		-- Check if the repository already exists on GitHub
		local check_repo_command =
			string.format("gh repo view %s/%s", vim.fn.system("gh api user --jq '.login'"):gsub("%s+", ""), repo_name)
		local check_repo_result = vim.fn.systemlist(check_repo_command)
		if not string.find(table.concat(check_repo_result), "Could not resolve to a Repository") then
			print("Repository '" .. repo_name .. "' already exists on GitHub.")
			return
		end
		-- Prompt for repository type
		vim.ui.select({ "private", "public" }, {
			prompt = "Select the repository type:",
			default = "private",
		}, function(repo_type)
			if not repo_type then
				print("Operation canceled.")
				return
			end
			-- Set the repository type flag
			local repo_type_flag = repo_type == "private" and "--private" or "--public"
			-- Initialize the git repository and create the GitHub repository
			local init_command = string.format("cd %s && git init", vim.fn.shellescape(cwd))
			vim.fn.system(init_command)
			local create_command = string.format(
				"cd %s && gh repo create %s %s --source=.",
				vim.fn.shellescape(cwd),
				repo_name,
				repo_type_flag
			)
			local create_result = vim.fn.system(create_command)
			-- Print the result of the repository creation command and set the main branch
			if string.find(create_result, "https://github.com") then
				print("Repository '" .. repo_name .. "' created successfully.")
				vim.fn.system("git branch -M main")
			else
				print("Failed to create the repository: " .. create_result)
			end
		end)
	end)
end, { desc = "[P]Create GitHub repository" })
