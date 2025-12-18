local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local postfix = require("luasnip.extras.postfix").postfix

-- Base
ls.add_snippets("rust", {
	postfix(".if", {
		f(function(_, parent)
			return "if " .. parent.snippet.env.POSTFIX_MATCH .. " {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".dbg", {
		f(function(_, parent)
			local e = parent.snippet.env.POSTFIX_MATCH
			return 'dbg!(("' .. e .. '", &' .. e .. "));"
		end),
	}),

	postfix(".print", {
		f(function(_, parent)
			return 'println!("{:?}", ' .. parent.snippet.env.POSTFIX_MATCH .. ");"
		end),
	}),
})

-- Cycles
ls.add_snippets("rust", {
	postfix(".for", {
		f(function(_, parent)
			return "for elem in " .. parent.snippet.env.POSTFIX_MATCH .. " {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".iter", {
		f(function(_, parent)
			return "for elem in " .. parent.snippet.env.POSTFIX_MATCH .. ".iter() {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".iteri", {
		f(function(_, parent)
			return "for (i, elem) in " .. parent.snippet.env.POSTFIX_MATCH .. ".iter().enumerate() {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".while", {
		f(function(_, parent)
			return "while " .. parent.snippet.env.POSTFIX_MATCH .. " {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".loop", {
		t("loop {"),
		t({ "", "    " }),
		f(function(_, parent)
			return parent.snippet.env.POSTFIX_MATCH
		end),
		t({ "", "}" }),
	}),
})
