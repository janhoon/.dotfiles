require("smileyhoon.nvimtree")
require("smileyhoon.lsp")
require("smileyhoon.telescope")
require("smileyhoon.lualine")
require("smileyhoon.theme")
require("smileyhoon.spectre")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
