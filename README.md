# Reminder

- `after/` - is responsible for after-work, called like this because it's called at very last moment or as a very last fix
- `config/` - is responsible for core-configurations
- `plugins/` - contents plugins...

- File load order: `plugin` -> `opts` -> `config()` -> `after/` (or `config/`)

- lazy plugin manager **doesn't load plugin twice** if you specify plugin and then specify it as dependencie for another plugin

# Keybinds overview

## Visual text

- `vab` Select Around Brackets, `vib` Select Inside Brackets
- `vaq`, `viq` can now work with any kind of Quotes like `'"
- `vabab` for example Select Around inner Brackets, then Select Around next outer Brackets
  - or it could switch to the next brackets inside "current bracket-scope"
- `via` Select function Argument, `viaia` Select next function Argument and so on... ("around" here would select with comma, "inner" - without)
- `vaf` - select function call, `vif` select inside function call
- `vanq` around next quotes, `valq` around last (previous) quotes

- `S` - select brackets with leap-marking (after pressing you can choose which scope you want...)

## Surround words

- `saw%` surround around word with %
- `sd-` surround delete -
- `sr"'` surround replace "" with ''
- `sawf` > `DoIt` will wrap current word with `DoIt(...)`

## Copy

- `space p` paste from system buffer (not ok for wsl tbh, ctrl shift v is still better)
- `space y` copy to system buffer
- `space d` cut and move to system buffer

### Text moves

- `griw` replace current work with yank, but keep yank as it was (default `vsiwp` replaces yank...)
- `gxiww.` EXchange Inner Word .. next Word .. and `.` to apply
- `gxxj.` EXchange current line and next one
- `gmiw` multiply current word, `gmaw` multiply it with around symbols and whitespaces
  - also works with `b`rackets and `m` as lines
- `grr` replace whole line with yank, doesn't affect yank and it keep tab level
- `g=ib` evaluates Inner Brackets, example is `(93 + 16)->(109)`

## LSP

- `K` - show docs for stuff under cursor
- `grn` - ReName variable
- `gR` - all variable references/useses/mentions
- `gD` - go to declaration
- `gd`- go to definition
- `gi` - go to implementation
- `gbd` - whole buffer diagnostics
- `gld` - line diagnostic
- `<Tab>` - choose autocomplete candidate

### Snippets

> Highest priority, even over lsp

- own **postfix** snippets for some languages
- `<Tab>` to jump to next snippet position

## Select autocomplete/telescope candidate

- kinda everything through `<C-n>`, `<C-p>` as Next and Previous

## Navigation impovements

- `ss` > type symbols > press according mark - as fast current screen jump anywhere
- `tab` - to escape brackets/quotes [`( u r here )` -> `tab` -> `( )here`]
- `<Ctrl> h/j/k/l` for panes switching

## Terminal

- `<C-t><C-t>` - open/exit Terminal

## Search through project

> With preview

- `<C-p>` - git files (there would be no untracked files)
- `<space>ff` - Find File in whole project
- `<space>fb` - show opened File Buffers
- `<space>gs` > type - search line in projects files, aka Grep Search

## Comment code

- `gcc` - Comment Current line, for selection - `gc`
- `gc{` - Comment `{`-bracketed and etc
- `dgc` - delete comment block

## Debug

> You are not gonna use it, but..

- `<space>b` set breakpoint

## Git

- `lg` - open LazyGit, that's enough

## Docker

- `ldr` - open LazyDockeR, that's is not really useful

## Miscellaneous

- `<space>zen` - distrction free mode with only current buffer and local diming (shadow non-current scope)
