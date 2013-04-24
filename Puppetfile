# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "1.2.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",  "1.0.0"
github "gcc",      "1.0.0"
github "git",      "1.0.0"
github "homebrew", "1.1.2"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "java",       "1.0.6"
github "intellij",   "1.1.3"
github "chrome",     "1.1.0"
github "firefox",    "1.0.5"
github "alfred",     "1.0.2"
github "zsh", 	     "1.0.0"
github "osx", 	     "1.1.0"
github "sizeup",     "1.0.0"
github "dpkg", 	     "1.0.0"
#github "vagrant",    "2.0.6"
#github "virtualbox", "1.0.2"