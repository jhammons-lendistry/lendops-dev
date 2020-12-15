#!/bin/bash
set -eo pipefail

function wp_cli_setup() {
  vvv_info " * Installing/updating WP-CLI"
  # WP-CLI Install
  local exists_wpcli

  # Remove old wp-cli symlink, if it exists.
  if [[ -L "/usr/local/bin/wp" ]]; then
    vvv_info " * Removing old wp-cli symlink"
    rm -f /usr/local/bin/wp
  fi

  exists_wpcli="$(which wp)"
  if [[ "/usr/local/bin/wp" != "${exists_wpcli}" ]]; then
    vvv_info " * Downloading wp-cli nightly, see <url>http://wp-cli.org</url>"
    curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar
    chmod +x wp-cli-nightly.phar
    sudo mv wp-cli-nightly.phar /usr/local/bin/wp

    vvv_info " * Grabbing WP CLI bash completions"
    # Install bash completions
    noroot curl -s https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash -o /srv/config/wp-cli/wp-completion.bash
  else
    vvv_info " * Updating wp-cli..."
    wp --allow-root cli update --nightly --yes
  fi
  vvv_info " * Installing WP CLI doctor sub-command"
  wp --allow-root package install git@github.com:wp-cli/doctor-command.git
}
export -f wp_cli_setup

vvv_add_hook after_packages wp_cli_setup
