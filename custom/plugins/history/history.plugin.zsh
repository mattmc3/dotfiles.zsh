#
# history - Set Zsh history options, variables, and aliases.
#

# 16.2.4 History
setopt bang_hist               # Treat the '!' character specially during expansion.
setopt extended_history        # Write the history file in the ':start:elapsed;command' format.
setopt hist_expire_dups_first  # Expire a duplicate event first when trimming history.
setopt hist_find_no_dups       # Do not display a previously found event.
setopt hist_ignore_all_dups    # Delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_dups        # Do not record an event that was just recorded again.
setopt hist_ignore_space       # Do not record an event starting with a space.
setopt hist_reduce_blanks      # Remove extra blanks from commands added to the history list.
setopt hist_save_no_dups       # Do not write a duplicate event to the history file.
setopt hist_verify             # Do not execute immediately upon history expansion.
setopt inc_append_history      # Write to the history file immediately, not when the shell exits.
setopt NO_hist_beep            # Don't beep when accessing non-existent history.
setopt NO_share_history        # Don't share history between all sessions.

# Path to the history file.
: ${__zsh_user_data_dir:=${XDG_DATA_HOME:-$HOME/.local/share}/zsh}
HISTFILE=$__zsh_user_data_dir/zsh_history      # History file path.
[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h
[[ "$SAVEHIST" -gt 1000 ]] || SAVEHIST=100000  # Max history file size.
[[ "$HISTSIZE" -gt 2000 ]] || HISTSIZE=20000   # Max session history size.

# History aliases.
alias hist='fc -li'
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
