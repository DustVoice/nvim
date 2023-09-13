local custom_init_path = vim.api.nvim_get_runtime_file("NvChad/init.lua", false)[1]

if custom_init_path then
  package.path = './NvChad;./NvChad/lua/?/init.lua;./NvChad/lua/?.lua;' .. package.path
  dofile(custom_init_path)
end
