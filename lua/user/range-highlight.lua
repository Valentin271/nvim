local status_ok, rh = pcall(require, "range-highlight")
if not status_ok then
  return
end


rh.setup({})
