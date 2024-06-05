local status, n = pcall(require, "solarized")
if (not status) then return end

n.setup({
 comment_italics = true,
})

