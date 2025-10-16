-- require: java, graphviz
-- sudo apt install default-jre
-- brew install graphviz

return {
	"weirongxu/plantuml-previewer.vim",
	dependencies = {
		"tyru/open-browser.vim",
		"aklt/plantuml-syntax",
	},
	-- Commands start at :Plantuml...
}
