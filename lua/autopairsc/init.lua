local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local npairs = require('nvim-autopairs')

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

npairs.setup({})
-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
