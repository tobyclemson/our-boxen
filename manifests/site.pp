require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # os defaults
  include osx::global::enable_keyboard_control_access
  include osx::dock::autohide
  include osx::finder::show_all_on_desktop
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate

  # core modules, needed for most things
  include dnsmasq
  include git

  # we'll be needing Java
  include java

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # browsers
  include chrome
  include firefox

  # general development tools
  class { 'intellij':
    edition => 'ultimate'
  }

  # system utilities
  include alfred
  include zsh
  include sizeup
  include dpkg
}
