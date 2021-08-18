export NVM_DIR="$HOME/.nvm"

# Macos + Homebrew
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Linux
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function nvm_install() {
    version=$1
    uname=$(uname -a)

    if [[ -z "${version}" ]]; then
        nvm_rc_version
        version=$NVM_RC_VERSION
    fi

    if [[ $uname == *"Darwin"* && $uname == *"ARM64"* ]]; then
        echo "Install node for x86_64"
        arch -x86_64 bash -c "source /opt/homebrew/opt/nvm/nvm.sh && nvm install ${version}"
    else
        nvm install ${version}
    fi
}
