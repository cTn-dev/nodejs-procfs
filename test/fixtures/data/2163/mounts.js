module.exports = [
	{
		spec: 'proc',
		file: '/proc',
		vfstype: 'proc',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'sys',
		file: '/sys',
		vfstype: 'sysfs',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'dev',
		file: '/dev',
		vfstype: 'devtmpfs',
		mntops: ['rw', 'nosuid', 'relatime', 'size=3947588k', 'nr_inodes=986897', 'mode=755'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'run',
		file: '/run',
		vfstype: 'tmpfs',
		mntops: ['rw', 'nosuid', 'nodev', 'relatime', 'mode=755'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'efivarfs',
		file: '/sys/firmware/efi/efivars',
		vfstype: 'efivarfs',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: '/dev/nvme0n1p3',
		file: '/',
		vfstype: 'ext4',
		mntops: ['rw', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'securityfs',
		file: '/sys/kernel/security',
		vfstype: 'securityfs',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'tmpfs',
		file: '/dev/shm',
		vfstype: 'tmpfs',
		mntops: ['rw', 'nosuid', 'nodev'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'devpts',
		file: '/dev/pts',
		vfstype: 'devpts',
		mntops: ['rw', 'nosuid', 'noexec', 'relatime', 'gid=5', 'mode=620', 'ptmxmode=000'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'tmpfs',
		file: '/sys/fs/cgroup',
		vfstype: 'tmpfs',
		mntops: ['ro', 'nosuid', 'nodev', 'noexec', 'mode=755'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup2',
		file: '/sys/fs/cgroup/unified',
		vfstype: 'cgroup2',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'nsdelegate'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/systemd',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'xattr', 'name=systemd'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'pstore',
		file: '/sys/fs/pstore',
		vfstype: 'pstore',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'bpf',
		file: '/sys/fs/bpf',
		vfstype: 'bpf',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'mode=700'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/perf_event',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'perf_event'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/cpu,cpuacct',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'cpu', 'cpuacct'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/hugetlb',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'hugetlb'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/freezer',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'freezer'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/memory',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'memory'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/blkio',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'blkio'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/rdma',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'rdma'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/cpuset',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'cpuset'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/pids',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'pids'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/net_cls,net_prio',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'net_cls', 'net_prio'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'cgroup',
		file: '/sys/fs/cgroup/devices',
		vfstype: 'cgroup',
		mntops: ['rw', 'nosuid', 'nodev', 'noexec', 'relatime', 'devices'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'systemd-1',
		file: '/proc/sys/fs/binfmt_misc',
		vfstype: 'autofs',
		mntops: ['rw', 'relatime', 'fd=31', 'pgrp=1', 'timeout=0', 'minproto=5', 'maxproto=5', 'direct', 'pipe_ino=13796'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'hugetlbfs',
		file: '/dev/hugepages',
		vfstype: 'hugetlbfs',
		mntops: ['rw', 'relatime', 'pagesize=2M'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'debugfs',
		file: '/sys/kernel/debug',
		vfstype: 'debugfs',
		mntops: ['rw', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'mqueue',
		file: '/dev/mqueue',
		vfstype: 'mqueue',
		mntops: ['rw', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'configfs',
		file: '/sys/kernel/config',
		vfstype: 'configfs',
		mntops: ['rw', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'tmpfs',
		file: '/tmp',
		vfstype: 'tmpfs',
		mntops: ['rw', 'nosuid', 'nodev'],
		freq: 0,
		passno: 0,
	},
	{
		spec: '/dev/nvme0n1p1',
		file: '/boot',
		vfstype: 'vfat',
		mntops: ['rw', 'relatime', 'fmask=0022', 'dmask=0022', 'codepage=437', 'iocharset=iso8859-1', 'shortname=mixed', 'utf8', 'errors=remount-ro'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'tmpfs',
		file: '/run/user/1000',
		vfstype: 'tmpfs',
		mntops: ['rw', 'nosuid', 'nodev', 'relatime', 'size=791396k', 'mode=700', 'uid=1000', 'gid=1000'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'tracefs',
		file: '/sys/kernel/debug/tracing',
		vfstype: 'tracefs',
		mntops: ['rw', 'relatime'],
		freq: 0,
		passno: 0,
	},
	{
		spec: 'binfmt_misc',
		file: '/proc/sys/fs/binfmt_misc',
		vfstype: 'binfmt_misc',
		mntops: ['rw', 'relatime'],
		freq: 0,
		passno: 0,
	},
];