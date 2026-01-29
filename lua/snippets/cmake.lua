local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local postfix = require("luasnip.extras.postfix").postfix

-- Printing
ls.add_snippets("cmake", {
	postfix(".pout", {
		f(function(_, parent)
			local variable = parent.snippet.env.POSTFIX_MATCH
			return 'message("[${PROJECT_NAME}] ' .. variable .. " = ${" .. variable .. '}")'
		end),
	}),

	postfix(".warn", {
		f(function(_, parent)
			local variable = parent.snippet.env.POSTFIX_MATCH
			return 'message(WARNING "[${PROJECT_NAME}] ' .. variable .. " = ${" .. variable .. '}")'
		end),
	}),

	postfix(".err", {
		f(function(_, parent)
			local variable = parent.snippet.env.POSTFIX_MATCH
			return 'message(FATAL_ERROR "[${PROJECT_NAME}] ' .. variable .. " = ${" .. variable .. '}")'
		end),
	}),
})
