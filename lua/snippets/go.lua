local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local postfix = require("luasnip.extras.postfix").postfix

-- Base
ls.add_snippets("go", {
	postfix(".if", {
		f(function(_, parent)
			return "if " .. parent.snippet.env.POSTFIX_MATCH .. " {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".out", {
		f(function(_, parent)
			return "fmt.Println(" .. parent.snippet.env.POSTFIX_MATCH .. ")"
		end),
	}),

	postfix(".fout", {
		f(function(_, parent)
			return 'fmt.Printf("%v\\n", ' .. parent.snippet.env.POSTFIX_MATCH .. ")"
		end),
	}),

	postfix(".var", {
		i(1, "name"),
		t(" := "),
		f(function(_, snip)
			return snip.env.POSTFIX_MATCH
		end),
	}),

	postfix(".ret", {
		f(function(_, snip)
			return "return " .. snip.env.POSTFIX_MATCH
		end),
	}),

	postfix(".itos", {
		f(function(_, snip)
			return "strconv.Itoa(" .. snip.env.POSTFIX_MATCH .. ")"
		end),
	}),
})

-- Cycles
ls.add_snippets("go", {
	postfix(".for", {
		f(function(_, parent)
			return "for " .. parent.snippet.env.POSTFIX_MATCH .. " {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".forv", {
		f(function(_, parent)
			return "for _, v := range " .. parent.snippet.env.POSTFIX_MATCH .. " {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".fori", {
		f(function(_, parent)
			return "for i, v := range " .. parent.snippet.env.POSTFIX_MATCH .. " {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),
})

-- errors
ls.add_snippets("go", {
	postfix(".iferr", {
		f(function(_, snip)
			local fn = snip.env.POSTFIX_MATCH
			return "if err := " .. fn .. "("
		end),
		i(1), -- ← inside func (..)
		t("); err != nil {"),
		t({ "", "    " }),
		i(2, "return err"), -- ← inside { }
		t({ "", "}" }),
	}),

	postfix(".nil", {
		f(function(_, parent)
			return "if " .. parent.snippet.env.POSTFIX_MATCH .. " == nil {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".!nil", {
		f(function(_, parent)
			return "if " .. parent.snippet.env.POSTFIX_MATCH .. " != nil {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),
})

-- channels
ls.add_snippets("go", {
	postfix(".send", {
		f(function(_, parent)
			return parent.snippet.env.POSTFIX_MATCH .. " <- "
		end),
		i(1, "value"),
	}),

	postfix(".recv", {
		f(function(_, parent)
			return "<-" .. parent.snippet.env.POSTFIX_MATCH
		end),
	}),
})
