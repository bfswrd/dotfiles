eval "$(starship init zsh)"

l ()
{
    ls -lh
}

st ()
{
    git status
}

rmds ()
{
    find . -name .DS_Store | xargs rm -f
}

rmdw ()
{
    rm -rf ~/Downloads/*
}
