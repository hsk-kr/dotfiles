return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- adapter comes from nvim-dap‑vscode‑js
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "js-debug-adapter",
				args = {
					"${port}",
				},
			},
		}

		dap.adapters["remote-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "js-debug-adapter",
				args = {
					"${port}",
				},
			},
		}

		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch File",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to Upscope",
				type = "pwa-node",
				request = "attach",
				address = "46.101.50.157",
				port = 9229,
				restart = true,
				sourceMaps = true,
				localRoot = vim.fn.getcwd() .. "/api",
				remoteRoot = "/upscope_api",
				protocol = "inspector",
				skipFiles = { "<node_internals>/**", "**/node_modules/**/*" },
			},
		}

		dap.configurations.typescript = dap.configurations.javascript

		vim.keymap.set("n", "<leader>das", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<leader>dao", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<leader>dai", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<leader>dao", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<leader>daq", function()
			dap.terminate()
		end)
		vim.keymap.set("n", "<leader>dat", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<leader>dac", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
	end,
}
-- return {
-- 	"mfussenegger/nvim-dap",
-- 	config = function()
-- 		local dap = require("dap")
--
-- 		-- Adapters (define host + port ONLY here)
-- 		dap.adapters.local_node = {
-- 			type = "server",
-- 			host = "127.0.0.1",
-- 			port = 9229,
-- 		}
--
-- 		dap.adapters.upscope_node = {
-- 			type = "server",
-- 			host = "46.101.50.157",
-- 			port = 9229,
-- 		}
--
-- 		-- Shared config for JS/TS
-- 		local common_config = {
-- 			request = "attach",
-- 			protocol = "inspector",
-- 			port = 9229,
-- 			skipFiles = { "<node_internals>/**" },
-- 		}
--
-- 		dap.configurations.javascript = {
-- 			vim.tbl_extend("force", common_config, {
-- 				type = "local_node",
-- 				name = "Attach to local node",
-- 			}),
-- 			vim.tbl_extend("force", common_config, {
-- 				type = "upscope_node",
-- 				name = "Attach to remote node",
-- 			}),
-- 		}
--
-- 		dap.configurations.typescript = dap.configurations.javascript
--
-- 		vim.keymap.set("n", "<leader>dac", function()
-- 			dap.continue()
-- 		end)
-- 		vim.keymap.set("n", "<leader>dao", function()
-- 			dap.step_over()
-- 		end)
-- 		vim.keymap.set("n", "<leader>dai", function()
-- 			dap.step_into()
-- 		end)
-- 		vim.keymap.set("n", "<leader>dao", function()
-- 			dap.step_out()
-- 		end)
-- 		vim.keymap.set("n", "<leader>dab", function()
-- 			dap.toggle_breakpoint()
-- 		end)
-- 		-- vim.keymap.set("n", "<leader>B", function()
-- 		--   dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
-- 		-- end)
-- 	end,
-- }
