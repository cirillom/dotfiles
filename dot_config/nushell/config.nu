$env.config.completions.algorithm = "fuzzy"

source ~/.zoxide.nu

if (which starship | is-not-empty) {
    mkdir ($nu.data-dir | path join "vendor" "autoload")
    starship init nu | save -f ($nu.data-dir | path join "vendor" "autoload" "starship.nu")
}
