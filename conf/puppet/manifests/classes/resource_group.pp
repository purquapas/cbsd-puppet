class motd {
	file { "/etc/motd":
		ensure  => file,
		owner   => root,
		group   => wheel,
		mode    => 444,
		source  => "puppet:///files/etc/motd",
	}
}

class root_authorized_keys {
	file { "/root/.ssh/authorized_keys":
		ensure  => file,
		owner   => root,
		group   => wheel,
		mode    => 444,
		source  => "puppet:///files/root/.ssh/authorized_keys",
	}
}

class sshd {
	file { "/etc/ssh/sshd_config":
		owner => root,
		group  => wheel,
		mode => 0644,
		source => "puppet:///files/etc/ssh/sshd_config",
	}

	service { 'sshd_services':
		ensure      => running,
		name        => "sshd",
		enable      => true,
		hasrestart  => true,
		hasstatus   => true,
		subscribe   => File['/etc/ssh/sshd_config'],
	}
}
