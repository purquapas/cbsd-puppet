#
class cbsd::params {
  $config_dir        = '/etc/jail.d/'
  $config_file_owner = 'root'
  $config_file_group = 'wheel'
  $config_file_mode  = '0444'

  $defaults          = {
    'exec_start'        => '/bin/sh /etc/rc',
    'exec_stop'         => '/bin/sh /etc/rc.shutdown',
    'exec_clean'        => 1,
    'mount_devfs'       => 1,
    'allow_mount'       => 1,
    'allow_mount_devfs' => 1,

    'allow_devfs' => 1,
    'allow_nullfs' => 1,
    'mkhostsfile' => 1,
    'devfs_ruleset' => 4,
    'ver' => 'native',
    'arch' => 'native',
    'basename' => '',
    'baserw' => '0',
    'mount_src' => 0,
    'mount_obj' => 0,
    'mount_kernel' => 0,
    'mount_ports' => 1,
    'astart' => 1,
    'vnet' => 0,
    'applytpl' => 1,
    'mdsize' => 0,
    'floatresolv' => 1,

    'exec_poststart' => '0',
    'exec_poststop' => '0',
    'exec_prestart' => '0',
    'exec_prestop' => '0',

   'exec_master_poststart' => '0',
   'exec_master_poststop' => '0',
   'exec_master_prestart' => '0',
   'exec_master_prestop' => '0',
   'pkg_bootstrap' => 1,
   'interface' => 'auto',
  }

  # general
  $cbsd    = {}
  $my_class = ''
  $template = 'cbsd/jail.conf.erb'
}
