local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end
bufferline.setup{
  options = {
    separator_style = "padded_slant"
  }
}
