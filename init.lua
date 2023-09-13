local nvchad = vim.api.nvim_get_runtime_file("NvChad", false)[1]

if nvchad then
  package.path = nvchad .. ';' .. nvchad .. '/lua/?/init.lua;' .. nvchad .. '/lua/?.lua;' .. package.path
  dofile(nvchad .. "/init.lua")
end
