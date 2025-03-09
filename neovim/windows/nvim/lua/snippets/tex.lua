-- Initialize local variables
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

-- Snippet Configuration
ls.add_snippets("tex", {
    -- Environments
    -- \begin{} / \end{}
    s("beg", fmt(
        [[
        \begin{{{}}}
            {}
        \end{{{}}}
        ]], {
            i(1), i(0), rep(1)
        }
    )),
    -- \chapter{}
    s("chap", fmt(
        [[
        \chapter{{{}}}
        ]], {
            i(1)
        }
    )),
    -- \section{}
    s("sec", fmt(
        [[
        \section{{{}}}
        ]], {
            i(1)
        }
    )),
    -- \subsection{}
    s("subs", fmt(
        [[
        \subsection{{{}}}
        ]], {
            i(1)
        }
    )),
    -- Figure
    s("figr", fmt(
        [[
        \begin{{figure}}[H]
            {}
        \end{{figure}}
        ]], {
            i(1)
        }
    )),
    -- SubFloat
    s("subf", fmt(
        [[
        \subfloat[{}]{{{}}}
        ]], {
            i(1), i(0)
        }
    )),
    -- IncludeGraphics
    s("incg", fmt(
        [[
        \includegraphics[{}]{{{}}}
        ]], {
            i(1), i(0)
        }
    )),
    -- Table
    s("tabl", fmt(
        [[
        \begin{{table}}[H]
            {}
        \end{{table}}
        ]], {
            i(1)
        }
    )),
    -- tabularx
    s("tablx", fmt(
        [[
        \begin{{tabularx}}{{{}}}{{{}}}
            {}
        \end{{tabularx}}
        ]], {
            i(1), i(2), i(0)
        }
    )),
    -- minipage
    s("minp", fmt(
        [[
        \begin{{minipage}}[{}]{{{}}}
            {}
        \end{{minipage}}
        ]], {
            i(1), i(2), i(0)
        }
    )),
    -- adjustbox
    s("adjb", fmt(
        [[
        \adjustbox{{{}}}{{%
            {}
        }}
        ]], {
            i(1), i(0)
        }
    )),
    -- multicols
    s("mulc", fmt(
        [[
        \begin{{multicols}}{{{}}}
            {}
        \end{{multicols}}
        ]], {
            i(1), i(0)
        }
    )),
    -- Alignment
    -- columnbreak
    s("cb", t("\\columnbreak")),
    -- centering
    s("cn", t("\\centering")),
    -- raggedright
    s("rr", t("\\raggedright")),
    -- raggedleft
    s("rl", t("\\raggedleft")),
    -- Dimension
    s("wt", fmt(
        [[
        width={}
        ]], {
            i(1)
        }
    )),
    s("ht", fmt(
        [[
        height={}
        ]], {
            i(1)
        }
    )),
    s("vl", fmt(
        [[
        valign={}
        ]], {
            i(1)
        }
    )),
    -- textwidth
    s("tw", fmt(
        [[
        {}\textwidth{}
        ]], {
            i(1), i(0)
        }
    )),
    -- textheight
    s("th", fmt(
        [[
        {}\textheight{}
        ]], {
            i(1), i(0)
        }
    )),
    -- Text
    -- Italics Text
    s("it", fmt(
        [[
        \textit{{{}}}
        ]], {
            i(1)
        }
    )),
    -- Bold Text
    s("bf", fmt(
        [[
        \textbf{{{}}}
        ]], {
            i(1)
        }
    )),
    -- Math
    -- inline math
    s("im", fmt(
        [[
        ${}$
        ]], {
            i(1)
        }
    )),
    -- display math
    s("dm", fmt(
        [[
        \[ {} \]
        ]], {
            i(1)
        }
    )),
    -- \frac{}{}
    s("fr", fmt(
        [[
        \frac{{{}}}{{{}}}
        ]], {
            i(1), i(0)
        }
    ))
})
