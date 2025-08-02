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

require("config.colors")
require("config.statusline")

require("config.messages")
require("config.file-explorer")
require("config.jobs-management")
require("config.animations")

require("config.lsp")
require("config.formatting")
require("config.linting")

-- C++ specific
require("config.cpp-landscape.cmake")
