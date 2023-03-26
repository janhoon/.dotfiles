-- local dap = require('dap')
-- local widgets = require('dap.ui.widgets')

-- local function open_dap_widget(widget)
--     widgets.centered_float(widget)
-- end

-- vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>dc', function () return dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>dl', function () return dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>dro', dap.repl.toggle,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>drl', dap.run_last,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>drs', function () return open_dap_widget(widgets.scopes) end,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>drf', function () return open_dap_widget(widgets.frames) end,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>dre', function () return open_dap_widget(widgets.expression) end,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>drt', function () return open_dap_widget(widgets.threads) end,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>drh', widgets.hover,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<F5>', dap.continue,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<F10>', dap.step_over,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<F11>', dap.step_into,  {noremap=true, silent=true})
-- vim.keymap.set('n', '<F12>', dap.step_out,  {noremap=true, silent=true})

-- vim.fn.sign_define('DapBreakpoint', {text='', texthl='Error', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='Constant', linehl='', numhl=''})
-- vim.fn.sign_define('DapLogPoint', {text='', texthl='String', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='→', texthl='Identifier', linehl='', numhl=''})

-- require("dap-vscode-js").setup({
--   adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
-- })

-- for _, language in ipairs({ "typescript", "javascript" }) do
--   require("dap").configurations[language] = {
--     {
--       type = "node",
--       request = "launch",
--       name = "Debug Current Test File",
--       autoAttachChildProcesses = true,
--       skipFiles = {"<node_internals>/**", "**/node_modules/**"},
--       program = "${workspaceRoot}/node_modules/vitest/vitest.mjs",
--       args = {"run", "${relativeFile}"},
--       smartStep = true,
--       console = "integratedTerminal"
--     }
--   }
-- end
