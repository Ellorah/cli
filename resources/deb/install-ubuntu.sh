#!/bin/sh
{
    echo "This script requires superuser access to install apt packages."
    echo "You will be prompted for your password by sudo."

    # clear any previous sudo permission
    sudo -k

    # run inside sudo
    sudo sh <<SCRIPT
  set -ex

  # remove toolbelt
  rm -f /etc/apt/sources.list.d/heroku.list
  apt-get remove -y heroku-toolbelt heroku

  # add heroku repository to apt
  add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"

  # install heroku's release key for package verification
  wget -qO- https://cli-assets.heroku.com/apt/release.key | apt-key add -

  # update your sources
  apt-get update

  # install the toolbelt
  apt-get install -y heroku

SCRIPT
}
