export NVM_DIR="$HOME/.nvm"

# Macos + Homebrew
mac_nvm_root=$(brew --prefix nvm)
[ -s "${mac_nvm_root}/nvm.sh" ] && . "${mac_nvm_root}/nvm.sh" # This loads nvm
[ -s "${mac_nvm_root}/etc/bash_completion.d/nvm" ] && . "${mac_nvm_root}/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Linux
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# For Apple M1
function nvm_install() {
    version=$1
    uname=$(uname -a)

    if [[ -z "${version}" ]]; then
        nvm_rc_version
        version=$NVM_RC_VERSION
    fi

    if [[ $uname == *"Darwin"* && $uname == *"ARM64"* ]]; then
        echo "Install node for x86_64"
        arch -x86_64 bash -c "source ${mac_nvm_root}/nvm.sh && nvm install ${version}"
    else
        nvm install ${version}
    fi
}
