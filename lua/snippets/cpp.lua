local ls = require("luasnip")
-- local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local postfix = require("luasnip.extras.postfix").postfix

-- Base
ls.add_snippets("cpp", {

	postfix(".if", {
		f(function(_, parent)
			return "if (" .. parent.snippet.env.POSTFIX_MATCH .. ") {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".cout", {
		f(function(_, parent)
			return "std::cout << " .. parent.snippet.env.POSTFIX_MATCH .. ' << "\\n";'
		end),
	}),

	postfix(".pout", {
		f(function(_, parent)
			local expr = parent.snippet.env.POSTFIX_MATCH
			return 'std::cout << "' .. expr .. ': " << ' .. expr .. ' << "\\n";'
		end),
	}),

	postfix(".perr", {
		f(function(_, parent)
			local expr = parent.snippet.env.POSTFIX_MATCH
			return 'std::cerr << "[DBG] ' .. expr .. ': " << ' .. expr .. ' << "\\n";'
		end),
	}),

	postfix(".for", {
		f(function(_, parent)
			return "for (auto& elem : " .. parent.snippet.env.POSTFIX_MATCH .. ") {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),
})

-- Cycles
ls.add_snippets("cpp", {
	postfix(".fori", {
		f(function(_, parent)
			return "for (size_t i = 0; i < " .. parent.snippet.env.POSTFIX_MATCH .. ".size(); ++i) {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),

	postfix(".while", {
		f(function(_, parent)
			return "while (" .. parent.snippet.env.POSTFIX_MATCH .. ") {"
		end),
		t({ "", "    " }),
		i(1),
		t({ "", "}" }),
	}),
})

-- Types
ls.add_snippets("cpp", {
	postfix(".uniq", {
		f(function(_, parent)
			local type = parent.snippet.env.POSTFIX_MATCH
			return "std::make_unique<" .. type .. ">()"
		end),
	}),

	postfix(".uniqv", {
		condition = function(_, _, c)
			return c.POSTFIX_MATCH:match("^%w+%.%w+$")
		end,
		f(function(_, parent)
			local lhs, type = parent.snippet.env.POSTFIX_MATCH:match("^(%w+)%.(%w+)$")
			return "auto " .. lhs .. " = std::make_unique<" .. type .. ">();"
		end),
	}),

	postfix(".shared", {
		f(function(_, parent)
			local type = parent.snippet.env.POSTFIX_MATCH
			return "std::make_shared<" .. type .. ">()"
		end),
	}),

	postfix(".move", {
		f(function(_, parent)
			return "std::move(" .. parent.snippet.env.POSTFIX_MATCH .. ")"
		end),
	}),
})
