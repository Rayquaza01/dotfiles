-- === GIT CONFIG ===
THEME.git = THEME.git or {}
THEME.git.modified_sign = "M"
THEME.git.deleted_sign = "D"
THEME.git.untracked_sign = "?"
require("git"):setup()

--- === STARSHIP CONFIG ===
require("starship"):setup({ config_file = "~/.config/yazi/starship.toml" })
