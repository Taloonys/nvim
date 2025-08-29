# Reminder

- `after/` - is responsible for after-work, called like this because it's called at very last moment or as a very last fix
- `config/` - is responsible for core-configurations
- `plugins/` - contents plugins...

- File load order: `plugin` -> `opts` -> `config()` -> `after/` (or `config/`)

- lazy plugin manager **doesn't load plugin twice** if you specify plugin and then specify it as dependencie for another plugin

# Todo

- AI integration like in cursor
