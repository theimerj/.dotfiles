# Commands

# Lazygit
lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

phpv() {
    valet stop
    brew unlink php@8.1 php@8.2 # php@7.4
    brew link --force --overwrite $1
    brew services start $1
    composer global update
    rm -f ~/.config/valet/valet.sock
    valet install
}

myip() {
    ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'
}

# alias php74="phpv php@7.4"
# alias php80="phpv php@8.0"
alias php81="phpv php@8.1"
alias php82="phpv php@8.2"

composer-link() {
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

function stage {
    SOURCE_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
    echo "pull existing changes..." &&
    git pull &&
    echo "checking out staging..." &&
    git checkout staging &&
    echo "pulling staging..." &&
    git pull
    echo "merging $SOURCE_BRANCH.." &&
    git merge $SOURCE_BRANCH --no-edit &&
    echo "pushing to staging..." &&
    git push &&
    echo "checkout back to $SOURCE_BRANCH" &&
    git checkout $SOURCE_BRANCH
}

# Zellij
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}
function zpipe () {
  if [ -z "$1" ]; then
    zellij pipe;
  else
    zellij pipe -p $1;
  fi
}
