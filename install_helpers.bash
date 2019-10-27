# install_helpers.bash
# author: Seong Yong-ju <sei40kr@gmail.com>

SPINNER='/-\|'

COLUMNS="$(tput cols)"

BOLD="$(tput bold)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
PURPLE="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
RESET="$(tput sgr0)"


print_line() {
    local empty_line
    empty_line="$(printf "%${COLUMNS}s")"

    echo "${empty_line// /-}"
}

print_title() {
    local title
    title="$1"

    clear
    print_line
    echo "# ${BOLD}${title}${RESET}"
    print_line
    echo ''
}

print_desc() {
    local desc
    desc="$1"

    echo "$desc"
    echo ''
}

ask_yn() {
    local prompt
    local answer
    prompt="$1"

    read -n1 -rp "${prompt} [yn]: " answer
    echo ''
    echo ''

    if [[ "$answer" == [yY] ]]; then
        return 0
    fi

    return 1
}

print_info() {
    local message
    message="$1"

    echo "${message}"
}

print_warning() {
    local message
    message="$1"

    echo -e "${YELLOW}${message}${RESET}"
}

print_danger() {
    local message
    message="$1"

    echo -e "${RED}${message}${RESET}"
}

with_spinner() {
    local pid
    local i

    "$@" >/dev/null >/dev/null &
    pid="$!"

    echo '  '

    i=0
    while kill -0 "$pid" 2>/dev/null; do
        echo -ne "\b${SPINNER:i++%${#SPINNER}:1}"
        sleep 0.25
    done

    echo -ne '\b\b'

    wait "$pid"
    if [[ "$?" != 0 && "$?" != 255 ]]; then
        return $?
    fi
}

error() {
    local message
    local status_code
    message="$1"
    status_code="$2"

    echo "$message" >&2
    exit "${status_code:-1}"
}

pause() {
    print_line
    read -sn 1 -p 'Press enter to continue ...'
}

pacman_query() {
    local -a pkgs
    pkgs=( "$@" )

    pacman -Q "${pkgs[@]}" &>/dev/null
}

pacman_sync() {
    local -a pkgs
    pkgs=( "$@" )
    sudo pacman -Spy --print-format '%r' "${pkgs[@]}" | read -ra repos

    echo 'Installing'

    for pkg in "${pkgs[@]}"; do
        echo "- ${pkg}"
    done

    with_spinner sudo pacman -Sy --needed --noconfirm --noprogressbar "${pkgs[@]}"
}

trizen_sync() {
    local -a pkgs
    pkgs=( "$@" )

    if ! pacman_query trizen; then
        error 'trizen is not installed. Aborting.'
    fi

    echo 'Installing'

    for pkg in "${pkgs[@]}"; do
        echo "- ${pkg}"
    done

    with_spinner trizen -Sy --needed --noconfirm --noprogressbar --nopull "${pkgs[@]}"
}

stack_install() {
    local -a pkgs
    pkgs=( "$@")

    if ! pacman_query stack; then
        error 'stack is not installed. Aborting.'
    fi

    echo 'Installing'
    printf "%s\n" "${pkgs[@]}"

    with_spinner stack install "${pkgs[@]}"
}

systemctl_enable() {
    local service
    service="$1"

    sudo systemctl enable --now "$service"
}

systemctl_user_enable() {
    local service
    service="$1"

    systemctl --user enable --now "$service"
}

rustup_toolchain_install() {
    local toolchain
    toolchain="$1"

    if ! pacman_query rustup; then
        # TODO Install rustup
        error 'rustup is not installed. Aborting.'
    fi

    with_spinner rustup toolchain install "$toolchain"
}

rustup_component_add() {
    local toolchain
    local components
    toolchain="$1"
    shift
    components=( "$@" )

    if ! pacman_query rustup; then
        error 'rustup is not installed. Aborting.'
    fi

    with_spinner rustup component add --toolchain "$toolchain" "${components[@]}"
}

go_get() {
    local -a pkgs
    pkgs=( "$@" )

    with_spinner "${GOENV_ROOT}/shims/go" get -u "${pkgs[@]}"
}

pip3_install() {
    local -a pkgs
    pkgs=( "$@" )

    with_spinner "${PYENV_ROOT}/shims/pip3" install -qU --exists-action s "${pkgs[@]}"
}

gem_install() {
    local -a gems
    gems=( "$@" )

    with_spinner "${RBENV_ROOT}/shims/gem" install -q --silent --norc "${gems[@]}"
}

yarn_global_add() {
    local -a pkgs
    pkgs=( "$@" )

    PATH="${NVM_DIR}/current/bin:${PATH}" with_spinner yarn global add --no-default-rc --noprogress --non-interactive "${pkgs[@]}"
}
