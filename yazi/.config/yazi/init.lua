-- === GIT CONFIG ===
th.git = th.git or {}
th.git.modified_sign = "M"
th.git.deleted_sign = "D"
th.git.untracked_sign = "?"
th.git.ignored_sign = "/"
require("git"):setup()

--- === STARSHIP CONFIG ===
require("starship"):setup({ config_file = "~/.config/yazi/starship.toml" })
