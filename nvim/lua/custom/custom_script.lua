-------------------------------------
-- Saving work files on exit
-------------------------------------

-- Auto save session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if _G.saving_mode == true then
      vim.cmd("mksession! ~/vim_saving_mode_session.vim")
      -- TODO: not working, this command should be run manually, later need to fix
      -- vim.cmd("bufdo filetype detect")
    end
  end,
})

-- Auto load session on start
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local session_file = vim.fn.expand("~/vim_saving_mode_session.vim")
    if vim.fn.filereadable(session_file) == 1 then
      _G.saving_mode = false
      vim.cmd("source " .. session_file)
      vim.fn.delete(session_file)
    end
  end,
})

vim.api.nvim_create_user_command("QuitVimWithSavingMode", function()
  _G.saving_mode = true
  vim.cmd("qa!")
end, {})

vim.api.nvim_set_keymap("n", "<leader>sq", ":QuitVimWithSavingMode<CR>", { noremap = true, silent = true })

--
local function open_scratch_panel(height)
  height = height or 15
  vim.cmd(("botright %dsplit"):format(height))
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch=true]
  vim.api.nvim_win_set_buf(win, buf)

  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = "log"
  vim.bo[buf].modifiable = true

  -- Quick close
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
  return buf, win
end

local function append(buf, lines)
  if not lines or #lines == 0 then
    return
  end
  -- Remove trailing empty item some shells add
  if #lines > 0 and lines[#lines] == "" then
    table.remove(lines)
  end
  if #lines == 0 then
    return
  end
  local last = vim.api.nvim_buf_line_count(buf)
  vim.api.nvim_buf_set_lines(buf, last, last, false, lines)
end

local function run_to_panel()
  vim.ui.input({ prompt = "Enter shell command: " }, function(cmd)
    if not cmd or cmd == "" then
      vim.notify("No command entered.", vim.log.levels.WARN)
      return
    end

    local buf = select(1, open_scratch_panel(30))
    local header = {
      ("# Command: %s"):format(cmd),
      ("# Time   : %s"):format(os.date("%Y-%m-%d %H:%M:%S")),
      "# Output -------------------------------------",
      "",
    }
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, header)

    -- Stream both stdout and stderr
    local jid = vim.fn.jobstart({ "sh", "-c", cmd .. " 2>&1" }, {
      stdout_buffered = false,
      on_stdout = function(_, data, _)
        append(buf, data)
      end,
      on_stderr = function(_, data, _)
        append(buf, data)
      end,
      on_exit = function(_, code, _)
        append(buf, {
          "",
          "# -------------------------------------------",
          ("# Exit code: %d"):format(code),
          "# Press q to close this panel.",
        })
        -- Scroll to bottom
        pcall(vim.api.nvim_win_set_cursor, 0, { vim.api.nvim_buf_line_count(buf), 0 })
      end,
    })

    if jid <= 0 then
      append(buf, { "", "# Failed to start job." })
    end
  end)
end

vim.api.nvim_create_user_command("RunToPanel", function()
  run_to_panel()
end, {})

-- Telescope Search hidden files

vim.keymap.set("n", "<leader>fa", function()
  local tb = require("telescope.builtin")

  tb.find_files({
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true,
  })
end, { desc = 'Find Files (Include Hidden/Ignore Files)' })

vim.keymap.set("n", "<leader>fn", function()
  local tb = require("telescope.builtin")

  tb.find_files({
    hidden = true,
  })
end, { desc = 'Find Files (Include Hidden Files)' })
