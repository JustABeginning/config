-- Initialize local variables
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

-- Snippet Configuration
ls.add_snippets("tex",{
    -- Environments
    -- \begin{} / \end{}
    s("beg",fmt(
        [[
        \begin{{{}}}
            {}
        \end{{{}}}
        ]],{
            i(1), i(0), rep(1)
        }
    )),
    -- \chapter{}
    s("chap",fmt(
        [[
        \chapter{{{}}}
        ]],{
            i(1)
        }
    )),
    -- \section{}
    s("sec",fmt(
        [[
        \section{{{}}}
        ]],{
            i(1)
        }
    )),
    -- \subsection{}
    s("subs",fmt(
        [[
        \subsection{{{}}}
        ]],{
            i(1)
        }
    )),
    -- Math
    -- inline math
    s("im",fmt(
        [[
        ${}$
        ]],{
            i(1)
        }
    )),
    -- display math
    s("dm",fmt(
        [[
        \[{}\]
        ]],{
            i(1)
        }
    ))
})
