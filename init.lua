-- Basics
require("settings")
require("keymap")

-- Plugin Manager
require("config.lazy")

-- Config domains
require("config.parsers")
require("config.terminal")
require("config.searching")
require("config.marks")

require("after.colors")
require("config.statusline")

require("config.messages")
require("config.jobs-management")

require("config.lsp")
require("config.formatting")
require("config.linting")

-- C++ specific
require("config.cpp-landscape.cmake")
