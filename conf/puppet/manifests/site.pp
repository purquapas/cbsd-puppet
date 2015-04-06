#import 'classes/*.pp'
filebucket { main: server => "bsdpuppet.my.domain" }
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }

Package {
	provider => pkgng
}


node 'freebsd-default' {
	include motd
	include sshd

	ssh_authorized_key {
		'oleg@gizmo.my.domain-key1':
			ensure => 'present',
			user   => 'root',
			type   => 'ssh-rsa',
			key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDAfFTGncdwkZ8kpNLjCXnWlX8pg3pgaB5qU6KNtRzvEIxyF4tSk7JOQpxjcjW4bHDuu9yNfhWxbK/Uj0cF97BKD/kYBWQcQVwUfqBXx/J6AFVe5XrrIhts2oR0RriwQmDWwvcrlYsk5LxX4xs7vergWo9E6TZtH9FfEH9N2W9DaK0wOkDmD+Vq9JMh8fPvfj1Fxx1uoUg+21apAC0IGHmHNsJJniYIn1lStjc613aaBDwrQJ+D7bqGFoFOv0CN1ND6tL4PHmls0GG4mnxLG/+6QcY3rM/S9jcYtneJPQhR0A7qoPrHYl4qo3FL9eqfweM1tvDy2PmJmmVKGs5ZlIbt';
		'oleg@gizmo.my.domain-key2':
			ensure => 'present',
			user   => 'root',
			type   => 'ssh-rsa',
			key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDeu6F22UHSFxkZeLpfToeVUhR4BY3FMbfF6R+qLbJ3MFFxPSfu27dxIexvliQKsBCyVAqxvxGYxHjehBN7mFJ1bewQRECNjpeLv+oOv28qiAYRWejYpkLAvhvTFZSUsJtam0H4fqVXCjb3CaoSUAe9V1fiNyR3q9o8F32oGMvbnZbj5CfwYLa+XT5nyc90++dMl1vMCdnPbYsI1svxrAmORvhxaoCGGP657F/5Cpq9vhp72M3BLkVuNvo2F0paLczXsw+2YIKfh7tBNIHLjBGFTCgGIm5ZKL4dmwaNhxhkpHpeWJnA9Memtk9NTxqEFeNGLhxsXGE8dEuY6TsKVcMb';
	}

	package { 'devel/git': }
	package { 'ftp/wget': ensure=>installed }
	package { 'devel/subversion': ensure => "absent" }  # no subversion
}


node "bsdpuppetcl1.my.domain" inherits freebsd-default {
	cbsd::jail { 'jail1':
		jname		=> 'jail1',
		path		=> 'jails/jail1',
		ip4_addr	=> '192.168.0.5/24',
		host_hostname	=> 'jail1.my.domain',
		astart		=> '1',
		arch		=> 'amd64',
	}
}

node "bsdpuppetcl2.my.domain" inherits freebsd-default {}

