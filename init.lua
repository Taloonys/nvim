-- Basics
require("settings")
require("keymap")

-- Plugin Manager
require("config.lazy")

-- Config domains
require("config.parsers")

require("after.colors")
require("config.statusline")

require("config.lsp")
require("config.linting")

-- C++ specific
require("config.cpp-landscape.cmake")
