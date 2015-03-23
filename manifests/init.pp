# = Class: cbsd
#
# Main class for managing FreeBSD cbsd
# Sets up the environment to create cbsd::jail
# resources in.
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, cbsd class will automatically "include $my_class"
#
# [*config_dir*]
#   Path to cbsd configs, to override the config_dir from cbsd::params.
#
# [*cbsd*]
#   Hash containing cbsd::jail resource definitions.
#
# [*defaults*]
#   Hash containing default settings being applied on all $cbsd.
#   This overrides the hardcoded hash from cbsd::params.
#
# == Author
#   Reinier Schoof <reinier@skoef.nl>
#
class cbsd (
  $my_class   = $cbsd::params::my_class,
  $config_dir = $cbsd::params::config_dir,
  $cbsd      = $cbsd::params::cbsd,
  $defaults   = $cbsd::params::defaults,
  $template   = $cbsd::params::template,
) inherits cbsd::params {

  if $my_class != '' {
    include $my_class
  }

  file { 'jail.d':
    ensure => directory,
    path   => $cbsd::config_dir,
  }

  # create defined cbsd
  create_resources('cbsd::jail', $cbsd, $defaults)
}
