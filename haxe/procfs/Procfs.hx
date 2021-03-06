package procfs;

/**
Path string
**/
typedef Path = String;

/**
Device ID. Major and minor parts can be extracted using utility functions `procfs.devIdGetMinor`, `procfs.devIdGetMajor` and combined using `procfs.devIdFromMajorMinor`.
**/
typedef DevId = Int;

/**
@field mountId unique ID for the mount (may be reused after umount)
@field parentId ID of the parent mount (or of self for the root of this mount namespace's mount tree)
@field devId value of st_dev for files on this filesystem
@field root pathname of the directory in the filesystem which forms the root of this mount
@field mountPoint pathname of the mount point relative to the process's root directory
@field mountOptions per-mount options
@field optionalFields zero or more fields of the form "tag[:value]"
@field type filesystem type in the form "type[.subtype]"
@field mountSource filesystem-specific information or "none"
@field superOptions per-superblock options
**/
typedef ProcessMountinfo = {
	mountId: Int,
	parentId: Int,
	devId: DevId,
	root: String,
	mountPoint: Path,
	mountOptions: Array<String>,
	optionalFields: Array<String>,
	type: String,
	mountSource: String,
	superOptions: Array<String>,
};

/**
@field read `rchar` number of bytes read
@field write `wchar` number of bytes written
@field readSyscalls `syscr` number of read syscalls
@field writeSyscalls `syscw` number of write syscalls
@field readReal `read_bytes` number of bytes read which were really fetched from storage layer
@field writeReal `write_bytes` number of bytes written which were really sent to storage layer
@field writeCancelled `cancelled_write_bytes` number of bytes process caused to not be written
**/
typedef ProcessIo = {
	read: Int,
	write: Int,
	readReal: Int,
	writeReal: Int,
	readSyscalls: Int,
	writeSyscalls: Int,
	writeCancelled: Int,
};

/**
@field targetStart start of the range of IDs in the user namespace of the target process
@field start start of the range of IDs to which the IDs do map
   Interpretation depends on whether the process that opened and the target process are in the same user namespace.
   If the two processes are in different user namespaces, it is the start of a range of IDs in the user namespace of the process that opened the file
   If the two processes are in the same user namespace it is the start of the range of IDs in the parent user namespace of target process.
@field length length of the range of IDs that is mapped between the two user namespaces
**/
typedef ProcessIdMapRange = {
	targetStart: Int,
	start: Int,
	length: Int,
};

/**
@field name autogroup name
@field nice autogroup nice value
**/
typedef ProcessAutogroup = {
	name: String,
	nice: Int,
};

/**
@field size total program size(same as VmSize in `/proc/<pid>/status`), in pages
@field resident resident set size(same as VmRSS in `/proc/<pid>/status`), in pages
@field shared number of resident shared pages(same as RssFile + RssShmem in `/proc/<pid>/status`), in pages
@field text text (code), in pages
@field data data + stack, in pages
**/
typedef ProcessStatm = {
	size: Int,
	resident: Int,
	shared: Int,
	text: Int,
	data: Int,
};

/**
@field hierarchyId `hierarchy-ID` For cgroups version 1 hierarchies, this field contains a unique hierarchy ID number that can be matched to a hierarchy ID in /proc/cgroups. For the cgroups version 2 hierarchy, this field contains the value 0.
@field controllers `controller-list` For cgroups version 1 hierarchies, this field contains a comma-separated list of the controllers bound to the hierarchy. For the cgroups version 2 hierarchy, this field is `undefined`.
@field path `cgroup-path` Pathname of the control group in the hierarchy to which the process belongs. This pathname is relative to the mount point of the hierarchy.
**/
typedef ProcessCgroup = {
	hierarchyId: Int,
	?controllers: Array<String>,
	path: String,
};

/**
@field name `subsys_name` name of the controller
@field hierarchyId `hierarchy` unique ID of the cgroup hierarchy on which this controller is mounted. The value in this field will be 0 if the controller is not mounted on a cgroups v1 hierarchy, if the controller is bound to the cgroups v2 single unified hierarchy or if the controller is disabled.
@field cgroupsNumber `num_cgroups` number of control groups in this hierarchy using this controller
@field enabled `enabled`
**/
typedef CgroupController = {
	name: String,
	hierarchyId: Int,
	cgroupsNumber: Int,
	enabled: Bool,
};

/**
@field name `Limit` resource limit name
@field soft `Soft Limit` soft limit, `undefined` if unlimited
@field hard `Hard Limit` hard limit, `undefined` if unlimited
@field units `Units` units limit is measured in, `undefined` if scalar
**/
typedef ProcessLimit = {
	name: String,
	?soft: Int,
	?hard: Int,
	?units: String,
};

/**
Process state, consists of one character. Possible values:
 - `R`: running
 - `S`: sleeping in an interruptible wait
 - `D`: waiting in uninterruptible disk sleep
 - `Z`: zombie
 - `T`: stopped or trace stopped
 - `t`: tracing stop
 - `X`: dead
**/
typedef ProcessState = String;

/**
Only (arguably) most valuable fields included so far.
@field pid `pid` The process PID
@field comm `comm` The filename of the executable. Visible whether or not the executable is swapped out.
@field state `state` process state
@field parent `ppid` The PID of the parent of the process.
@field processGroup `pgrp` The process group ID of the process.
@field session `session` The session ID of the process.
@field tty `tty_nr` The controlling terminal of the process.
@field terminalProcessGroup `tpgid` The ID of the foreground process group of the controlling terminal of the process.
@field flags `flags` The kernel flags word of the process.
@field minorFaults `minflt` The number of minor faults the process has made which have not required loading a memory page from disk.
@field childMinorFaults `cminflt` The number of minor faults that the process's waited-for children have made.
@field majorFaults `majflt` The number of major faults the process has made which have required loading a memory page from disk.
@field childMajorFaults `cmajflt` The number of major faults that the process's waited-for children have made.
@field userTicks `utime` Amount of time that this process has been scheduled in user mode(includes guest time), in ticks.
@field kernelTicks `stime` Amount of time that this process has been scheduled in kernel mode, in ticks.
@field childUserTicks `cutime` Amount of time that this process's waited-for children have been scheduled in user mode, in ticks.
@field childKernelTicks `cstime` Amount of time that this process's waited-for children have been scheduled in kernel mode, in ticks.
@field priority `priority` For processes running a real-time scheduling policy (policy below), this is the negated scheduling priority, minus one; that is, a number in the range -2 to -100, corresponding to real-time priorities 1 to 99. For processes running under a non-real-time scheduling policy, this is the raw nice value (setpriority(2)) as represented in the kernel. The kernel stores nice values as numbers in the range 0 (high) to 39 (low), corresponding to the user-visible nice range of -20 to 19.
@field nice `nice` The nice value, a value in the range 19(low priority) to -20(high priority).
@field threads `num_threads` Number of threads in this process.
@field startTicks `starttime` The time the process started after system boot, in ticks.
@field vsize `vsize` Virtual memory size in bytes.
@field rss `rss` Resident Set Size, number of pages the process has in real memory. This is just the pages which count toward text, data, or stack space. This does not include pages which have not been demand-loaded in, or which are swapped out.
@field rssSoftLimit `rsslim` Current soft limit in bytes on the rss of the process.
@field exitSignal `exit_signal` Signal to be sent to parent when we die
@field lastCpu `processor` CPU number last executed on.
@field realtimePriority `rt_priority` Real-time scheduling priority, a number in the range 1 to 99 for processes scheduled under a real-time policy, or 0, for non-real-time processes.
@field schedulingPolicy `policy` Scheduling policy.
@field blockIoTicks `delayacct_blkio_ticks` Aggregated block I/O delays, in ticks.
@field guestTicks Guest time of the process (time spent running a virtual CPU for a guest operating system), in ticks.
@field childGuestTicks Guest time of the process's children, in ticks.
**/
typedef ProcessStat = {
	pid: Int,
	comm: String,
	state: ProcessState,
	parent: Int,
	processGroup: Int,
	session: Int,
	tty: Int,
	terminalProcessGroup: Int,
	flags: Int,
	minorFaults: Int,
	childMinorFaults: Int,
	majorFaults: Int,
	childMajorFaults: Int,
	userTicks: Int,
	kernelTicks: Int,
	childUserTicks: Int,
	childKernelTicks: Int,
	priority: Int,
	nice: Int,
	threads: Int,
	startTicks: Int,
	vsize: Int,
	rss: Int,
	rssSoftLimit: Float,
	exitSignal: Int,
	lastCpu: Int,
	realtimePriority: Int,
	schedulingPolicy: Int,
	blockIoTicks: Int,
	guestTicks: Int,
	childGuestTicks: Int,
};

/**
@field name `Name` Command run by the process.
@field ?umask `Umask` Process umask. Available since Linux 4.7.
@field state `State` Current state of the process.
@field threadGroupId `Tgid` Thread group ID.
@field numaGroupId `Ngid` NUMA group ID.
@field pid `Pid` Thread ID.
@field parentPid `PPid` PID of parent process
@field tracerPid `TracerPid` PID of process tracing this process (0 if not being traced)
@field uidReal `Uid` Real UID.
@field uidEffective `Uid` Effective UID.
@field uidSavedSet `Uid` Saved set UID.
@field uidFilesystem `Uid` Filesystem UID.
@field gidReal `Gid` Real GID.
@field gidEffective `Gid` Effective GID.
@field gidSavedSet `Gid` Saved set GID.
@field gidFilesystem `Gid` Filesystem GID.
@field fdSlots `FDSize` Number of file descriptor slots currently allocated.
@field groups `Groups` Supplementary groups.
@field vmPeak `VmPeak` Peak virtual memory size.
@field vmSize `VmSize` Virtual memory size.
@field vmLocked `VmLck` Locked memory size.
@field vmPinned `VmPin` Pinned memory size. These are pages that can't be moved because something needs to directly access physical memory.
@field vmHwm `VmHWM` Peak resident set size.
@field vmRss `VmRSS` Resident  set  size. Note: value is the sum of `rssAnon`, `rssFile`, and `rssShmem`(which might not be available depending on kernel version).
@field ?rssAnon `RssAnon` Size of resident anonymous memory. Available since Linux 4.5.
@field ?rssFile `RssFile` Size of resident file mappings. Available since Linux 4.5
@field ?rssShmem `RssShmem` Size of resident shared memory (includes System V shared memory, mappings from tmpfs, and shared anonymous mappings). Available since Linux 4.5.
@field vmData `VmData` Size of data segment.
@field vmStack `VmStk` Size of stack segment.
@field vmExe `VmExe` Size of text segment.
@field vmLib `VmLib` Shared library code size.
@field vmPte `VmPTE` Page table entries size.
@field vmSwap `VmSwap` Swapped-out virtual memory size by anonymous private pages; shmem swap usage is not included.
@field hugetlbPagesSize `HugetlbPages` Size of hugetlb memory portions.
@field threads `Threads` Number of threads in process containing this thread.
@field signalsQueued `SigQ` The number of currently queued signals for real UID of the process.
@field signalsQueuedLimit `SigQ` Resource limit on the number of queued signals for this process.
@field signalsPending `SigPnd` Number of signals pending for thread.
@field sharedSignalsPending `ShdPnd` Number of signals pending for process as a whole.
@field signalsBlocked `SigBlk` Mask indicating signals being blocked, low part.
@field signalsIgnored `SigIgn` Mask indicating signals being ignored, low part.
@field signalsCaught `SigCgt` Mask indicating signals being caught, low part.
@field rtSignalsBlocked `SigBlk` Mask indicating signals being blocked, high part(realtime signals).
@field rtSignalsIgnored `SigIgn` Mask indicating signals being ignored, high part(realtime signals).
@field rtSignalsCaught `SigCgt` Mask indicating signals being caught, high part(realtime signals).
@field seccompMode `Seccomp` Seccomp  mode of the process. `0` means SECCOMP_MODE_DISABLED; `1` means SECCOMP_MODE_STRICT; `2` means SECCOMP_MODE_FILTER. Available if the kernel is configured with `CONFIG_SECCOMP`.
@field ?speculationStoreBypass `Speculation_Store_Bypass` Speculation flaw mitigation state. Available since Linux 4.17.
@field cpusAllowedMask `Cpus_allowed` Mask of CPUs on which this process may run.
@field memoriesAllowedMask `Mems_allowed` Mask of memory nodes allowed to this process.
@field contextSwitchesVoluntary `voluntary_ctxt_switches` Number of voluntary context switches.
@field contextSwitchesNonvoluntary `nonvoluntary_ctxt_switches` Number of involuntary context switches.
@field namespacePids `NSpid` Thread IDs in each of descending PID namespaces process is a member of, starting from namespace of process that mounted procfs(or root namespace if mounted by kernel).
@field namespaceThreadGroupIds `NStgid` Thread group IDs in each of descending PID namespaces process is a member of, starting from namespace of process that mounted procfs(or root namespace if mounted by kernel).
@field namespaceProcessGroupIds `NSpgid` Process group IDs in each of descending PID namespaces process is a member of, starting from namespace of process that mounted procfs(or root namespace if mounted by kernel).
@field namespaceSessionIds `NSsid` Session IDs in each of descending PID namespaces process is a member of, starting from namespace of process that mounted procfs(or root namespace if mounted by kernel).
**/
typedef ProcessStatus = {
	name: String,
	?umask: Int,
	state: ProcessState,
	threadGroupId: Int,
	numaGroupId: Int,
	pid: Int,
	parentPid: Int,
	tracerPid: Int,
	uidReal: Int,
	uidEffective: Int,
	uidSavedSet: Int,
	uidFilesystem: Int,
	gidReal: Int,
	gidEffective: Int,
	gidSavedSet: Int,
	gidFilesystem: Int,
	fdSlots: Int,
	groups: Array<Int>,
	vmPeak: Int,
	vmSize: Int,
	vmLocked: Int,
	vmPinned: Int,
	vmHwm: Int,
	vmRss: Int,
	?rssAnon: Int,
	?rssFile: Int,
	?rssShmem: Int,
	vmData: Int,
	vmStack: Int,
	vmExe: Int,
	vmLib: Int,
	vmPte: Int,
	vmSwap: Int,
	hugetlbPagesSize: Int,
	threads: Int,
	signalsQueued: Int,
	signalsQueuedLimit: Int,
	signalsPending: Int,
	sharedSignalsPending: Int,
	signalsBlocked: Int,
	signalsIgnored: Int,
	signalsCaught: Int,
	rtSignalsBlocked: Int,
	rtSignalsIgnored: Int,
	rtSignalsCaught: Int,
	?seccompMode: Int,
	?speculationStoreBypass: String,
	cpusAllowedMask: Int,
	memoriesAllowedMask: Int,
	contextSwitchesVoluntary: Int,
	contextSwitchesNonvoluntary: Int,
	?namespacePids: Array<Int>,
	?namespaceThreadGroupIds: Array<Int>,
	?namespaceProcessGroupIds: Array<Int>,
	?namespaceSessionIds: Array<Int>,
};

typedef CpuCoreInfo = {
	id: Int,
	vendorId: String,
	family: Int,
	model: Int,
	modelName: String,
	stepping: Int,
	microcode: String,
	cpuMhz: Float,
	cacheSize: String,
	physicalId: Int,
	siblings: Int,
	coreId: Int,
	cores: Int,
	apicId: Int,
	initialApicId: Int,
	fpu: Bool,
	fpuException: Bool,
	cpuidLevel: Int,
	wp: Bool,
	flags: Array<String>,
	bugs: Array<String>,
	?bogoMips: Float,
	clflushSize: Int,
	cacheAlignment: Int,
	addressSizes: String,
};

/**
	@field jobsAverage1Minute number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 1 minute
	@field jobsAverage5Minutes number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 5 minutes
	@field jobsAverage15Minutes number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 15 minutes
	@field runnableEntities number of currently runnable kernel scheduling entities
	@field existingEntities number of kernel scheduling entities that currently exist on the system
	@field mostRecentlyCreatedPid pid of the process that was most recently created on the system
**/
typedef Loadavg = {
	jobsAverage1Minute: Float,
	jobsAverage5Minutes: Float,
	jobsAverage15Minutes: Float,
	runnableEntities: Float,
	existingEntities: Float,
	mostRecentlyCreatedPid: Float,
};

/**
@field time uptime of the system, including time spend in suspend, in seconds
@field idle amount of time spent in the idle process, in seconds
**/
typedef Uptime = {
	idle: Float,
	time: Float,
};

/**
@field path `Filename` path to device, partition or file
@field type `Type` commonly `partition` or `file`(theoretically, other values are possible)
@field size `Size` size, in blocks
@field used `Used` used, in blocks
@field priority `Priority`swap area usage priority
**/
typedef Swap = {
	path: Path,
	type: String,
	size: Int,
	used: Int,
	priority: Int,
};

/**
Note: amounts are in units of USER_HZ(a.k.a. ticks) which are 1/100ths of a second on most architectures, use sysconf(_SC_CLK_TCK) to obtain the right value).
@field user `user` time spent in user mode, in ticks
@field nice `nice` time spent in user mode with low priority, in ticks
@field system `system` time spent in system mode, in ticks
@field idle `idle` time spent in the idle task, in ticks
@field iowait `iowait` time waiting for I/O to complete, value is not reliable, in ticks
@field irq `irq` time servicing interrupts, in ticks
@field softirq `softirq` time servicing softirqs, in ticks
@field steal `steal` stolen time, which is the time spent in other operating systems when running in a virtualized environment, in ticks
@field guest `guest` time spent running a virtual CPU for guest operating systems under the control of the Linux kernel, in ticks
@field guestNice `guest_nice` time spent running a niced guest (virtual CPU for guest operating systems under the control of the Linux kernel), in ticks
**/
typedef StatCpuTime = {
	user: Int,
	nice: Int,
	system: Int,
	idle: Int,
	iowait: Int,
	irq: Int,
	softirq: Int,
	steal: Int,
	guest: Int,
	guestNice: Int,
};

/**
@field cpuTime time spent in various states, for each CPU
@field systemCpuTime time system spent in various states
@field interrupts total number of all interrupts serviced including unnumbered architecture specific interrupts
@field numberedInterrupts number of interrupts serviced for each numbered interrupt
@field contextSwitches number of context switches that the system underwent
@field bootTime boot time, in seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC)
@field forks number of forks since boot
@field processesRunning number of processes in runnable state
@field processesBlocked number of processes blocked waiting for I/O to complete
@field softInterrupts total number of soft interrupts serviced
@field numberedSoftInterrupts number of soft interrupts serviced for each softirq
**/
typedef Stat = {
	cpuTime: Array<StatCpuTime>,
	systemCpuTime: StatCpuTime,
	interrupts: Int,
	numberedInterrupts: Array<Int>,
	contextSwitches: Int,
	bootTime: Date,
	forks: Int,
	processesRunning: Int,
	processesBlocked: Int,
	softInterrupts: Int,
	numberedSoftInterrupts: Array<Int>,
};

/**
@field major Device ID major part
@field group Group name
@field type `character` or `block`
**/
typedef Device = {
	major: Int,
	group: String,
	type: String,
};

/**
	@field name filesystem name
	@field requiresBlockDevice if filesystem requires a block device to be mounted (unlike e.g., virtual filesystem, network filesystem)
**/
typedef Filesystem = {
	requiresBlockDevice: Bool,
	name: String,
};

/**
@field devId device id
@field name device name
@field reads total number of reads
@field readsMerged number of reads merged
@field sectorsRead total number of sectors read
@field readTime milliseconds spent reading
@field writes total number of writes
@field writesMerged number of writes merged
@field sectorsWriten total number of sectors written
@field writeTime milliseconds spent writing
@field currentIoCount number of of IOs currently in progress
@field ioTime milliseconds spent doing IO
@field weightedIoTime weighted milliseconds spent doing I/Os. This field is incremented at each I/O start, I/O completion, I/O merge, or read of these stats by the number of I/Os in progress times the number of milliseconds spent doing I/O since the last update of this field.  This can provide an easy measure of both I/O completion time and the backlog that may be accumulating.
**/
typedef Diskstat = {
	devId: DevId,
	name: String,
	reads: Int,
	readsMerged: Int,
	sectorsRead: Int,
	readTime: Int,
	writes: Int,
	writesMerged: Int,
	sectorsWriten: Int,
	writeTime: Int,
	currentIoCount: Int,
	ioTime: Int,
	weightedIoTime: Int,
};

/**
@field devId major and minor numbers of device
@field blocks number of 1024-byte blocks on partition
@field name partition name
**/
typedef Partition = {
	devId: DevId,
	blocks: Int,
	name: String,
};

/**
Memory amounts are expressed in bytes.

@field total `MemTotal` Total usable RAM
@field free `MemFree` Amount of free RAM
@field available `MemAvailable` An estimate of how much memory is available for starting new applications, without swapping
@field buffers `Buffers` Relatively temporary storage for raw disk blocks that shouldn't get tremendously large
@field cached `Cached` In-memory cache for files read from the disk (the page cache). Doesn't include Swap‐Cached.
@field swapCached `SwapCached` Memory that once was swapped out, is swapped back in but still also is in the swap file. (If memory pressure is high, these pages don't need to be swapped out again because they are already in the swap file. This saves I/O.)
@field active `Active` Memory that has been used more recently and usually not reclaimed unless absolutely necessary.
@field inactive `Inactive` Memory which has been less recently used. It is more eligible to be reclaimed for other purposes.
@field swapTotal `SwapTotal` Total amount of swap space available.
@field swapFree `SwapFree` Amount of swap space that is currently unused.
@field dirty `Dirty` Memory which is waiting to get written back to the disk.
@field writeback `Writeback` Memory which is actively being written back to the disk.
@field anonPages `AnonPages` Non-file backed pages mapped into user-space page tables.
@field mapped `Mapped` Files which have been mapped into memory (with mmap), such as libraries.
@field shmem `Shmem` Amount of memory consumed in tmpfs filesystems.
@field kernelReclaimable `KReclaimable` Kernel allocations that the kernel will attempt to reclaim under memory pressure. Includes `SReclaimable` and other direct allocations with a shrinker. Available since Linux 4.20.
@field slab `Slab` In-kernel data structures cache.
@field slabReclaimable `SReclaimable` Part of Slab, that might be reclaimed, such as caches.
@field slabUnreclaimable `SUnreclaim` Part of Slab, that cannot be reclaimed on memory pressure.
@field kernelStack `KernelStack` Amount of memory allocated to kernel stacks.
@field pageTables `PageTables` Amount of memory dedicated to the lowest level of page tables.
@field bounceBuffers `Bounce` Memory used for block device "bounce buffers".
@field writebackTmp `WritebackTmp` Memory used by FUSE for temporary writeback buffers.
@field commitLimit `CommitLimit` Total amount of memory currently available to be allocated on the system.
@field vmallocTotal `VmallocTotal` Total size of vmalloc memory area.
@field hardwareCorrupted `HardwareCorrupted` Available if the kernel is configured with `CONFIG_MEMORY_FAILURE`.
@field anonHugePages `AnonHugePages` Non-file backed huge pages mapped into userspace page tables. Available if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.
@field shmemHugePages `ShmemHugePages` Memory used by shared memory and tmpfs allocated with huge pages. Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.
@field shmemPmdMapped `ShmemPmdMapped` Shared memory mapped into user space with huge pages. Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.
@field hugepagesTotal `HugePages_Total` The size of the pool of huge pages. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field hugepagesFree `HugePages_Free` The number of huge pages in the pool that are not yet allocated. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field hugepagesReserved `HugePages_Rsvd` This is the number of huge pages for which a commitment to allocate from the pool has been made, but no allocation has yet been made. These reserved huge pages guarantee that an application will be able to allocate a huge page from the pool of huge pages at fault time. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field hugepagesSurplus `HugePages_Surp` This is the number of huge pages in the pool above the value in `/proc/sys/vm/nr_hugepages`. The maximum number of surplus huge pages is controlled by `/proc/sys/vm/nr_overcommit_hugepages`. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field hugepageSize `Hugepagesize` The size of huge pages. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field directMap4K `DirectMap4k` Number of bytes of RAM linearly mapped by kernel in 4kB pages
@field directMap2M `DirectMap2M` Number of bytes of RAM linearly mapped by kernel in 2MB pages.
@field directMap4M `DirectMap4M` Number of bytes of RAM linearly mapped by kernel in 4MB pages.
@field directMap1G `DirectMap1G` Number of bytes of RAM linearly mapped by kernel in 1GB pages.
**/
typedef Meminfo = {
	total: Int,
	free: Int,
	available: Int,
	buffers: Int,
	cached: Int,
	swapCached: Int,
	active: Int,
	inactive: Int,
	swapTotal: Int,
	swapFree: Int,
	dirty: Int,
	writeback: Int,
	anonPages: Int,
	mapped: Int,
	shmem: Int,
	?kernelReclaimable: Int,
	slab: Int,
	slabReclaimable: Int,
	slabUnreclaimable: Int,
	kernelStack: Int,
	pageTables: Int,
	bounceBuffers: Int,
	writebackTmp: Int,
	commitLimit: Int,
	vmallocTotal: Int,
	?hardwareCorrupted: Int,
	anonHugePages: Int,
	?shmemHugePages: Int,
	?shmemPmdMapped: Int,
	?hugepagesTotal: Int,
	?hugepagesFree: Int,
	?hugepagesReserved: Int,
	?hugepagesSurplus: Int,
	?hugepageSize: Int,
	directMap4K: Int,
	directMap2M: Int,
	directMap4M: Int,
	directMap1G: Int,
};

/**
@field fd `tfd`, file descriptor
@field mask `events`, mask of events being monitored for fd
**/
typedef ProcessFdinfoEpollCounter = {
	fd: Int,
	mask: Int,
};

/**
@field wd `wd`, watch descriptor number
@field inode `ino`, inode of the target file
@field devId `sdev`, ID of the device where the file resides
@field mask `mask`, mask of events being monitored for the file
@field ignoredMask `ignored_mask`, event mask that is ignored for target file
**/
typedef ProcessFdinfoInotifyFile = {
	wd: Int,
	mask: Int,
	ignoredMask: Int,
	inode: Int,
	devId: DevId,
};

/**
@field inode `ino`, inode of the target file
@field devId `sdev`, ID of the device where the file resides
@field mask `mask`, event mask for this mark
@field ignoredMask `ignored_mask`, event mask that is ignored for this mark
@field flags `flags`, mark flags
**/
typedef ProcessFdinfoFanotifyMark = {
	devId: DevId,
	mask: Int,
	ignoredMask: Int,
	inode: Int,
	flags: Int,
};

/**
Type of file descriptor. Possible values:
 - `regular`: regular file descriptor
 - `event`: eventfd file descriptor
 - `epoll`: epoll file descriptor
 - `signal`: signalfd file descriptor
 - `inotify`: intofiy file descriptor
 - `fanotify`: fanotify file descriptor
 - `timer`: timerfd file descriptor
**/
typedef ProcessFdinfoType = String;

/**
@field type fd type
@field position file offset
@field mountId ID of the mount point containing the file
@field flags file access mode and status flags
@field eventCounter for type `event`, current value of the event counter
@field epollCounters for type `epoll`, information about file descriptors being monitoring
@field rtSignalMask for type `signal`, mask of signals being monitored, high part
@field signalMask for type `signal`, mask of signals being monitored, low part
@field inotifyFiles for type `inotify`, information of files being monitored
@field fanotifyFlags for type `fanotify`, `flags` argument given to `fanotify_init`
@field fanotifyEventFlags for type 'fanotify`, `event_f_flags` argument given to `fanotify_init`
@field fanotifyMarks for type `fanotify`, information about marks in fanotify group
@field timerClockId for type `timer`,  clock ID
@field timerTicks for type `timer`, number of timer expirations that have occured
@field timerSettimeFlags for type `timer`, flags with which timer was last armed
@field timerValue for type `timer`, amount of time until the timer will next expire, seconds and nanoseconds
@field timerInterval for type `timer`, interval of the timer, seconds and nanoseconds
**/
typedef ProcessFdinfo = {
	type: ProcessFdinfoType,
	position: Int,
	mountId: Int,
	flags: Int,
	?eventCounter: Int,
	?epollCounters: Array<ProcessFdinfoEpollCounter>,
	?rtSignalMask: Int,
	?signalMask: Int,
	?inotifyFiles: Array<ProcessFdinfoInotifyFile>,
	?fanotifyFlags: Int,
	?fanotifyEventFlags: Int,
	?fanotifyMarks: Array<ProcessFdinfoFanotifyMark>,
	?timerClockId: Int,
	?timerTicks: Int,
	?timerSettimeFlags: Int,
	?timerValue: Array<Int>,
	?timerInterval: Array<Int>,
};

/**
@field type `pipe`, `socket`, `file` or `anon-inode`
@field inode for `type`s `pipe` and `socket`, the inode of this pipe or socket
@field anonInodeType for `type` `anon-inode`, the file type, like `eventfd`, `eventpoll`
@field path for `type` `file`, the file path
**/
typedef ProcessFd = {
	type: String,
	?inode: Int,
	?anonInodeType: String,
	?path: String,
};

/**
	@field path actual path of executed command
	@field deleted if path have been unlinked
**/
typedef ProcessExe = {
	path: String,
	deleted: Bool,
};

/**
@field name `Interface` interface name
@field rxBytes `Receive/bytes` number of received bytes
@field rxPackets `Receive/packets` number of received packets
@field rxErrors `Receive/errs` total number of receive errors
@field rxDrop `Receive/drop` number of received packets dropped
@field rxFifo `Receive/fifo` number of receive FIFO buffer errors
@field rxFrame `Receive/frame` number of packet framing errors
@field rxCompressed `Receive/compressed` number of compressed packets received
@field rxMulticast `Receive/multicast` number of multicast frames received

@field txBytes `Transmit/bytes` transmitted bytes
@field txPackets `Transmit/packets` transmitted packets
@field txErrors `Transmit/errs` total number of transmit errors
@field txDrop `Transmit/drop` number of transmit packets dropped
@field txFifo `Transmit/fifo` number of transmit FIFO buffer errors
@field txColls `Transmit/colls` number of collisions detected on the interface
@field txCarrier `Transmit/carrier` number of carrier losses detected on the interface
@field txCompressed `Transmit/compressed` number of compressed packets transmitted
**/
typedef NetDevice = {
	name: String,
	rxBytes: Int,
	rxPackets: Int,
	rxErrors: Int,
	rxDrop: Int,
	rxFifo: Int,
	rxFrame: Int,
	rxCompressed: Int,
	rxMulticast: Int,

	txBytes: Int,
	txPackets: Int,
	txErrors: Int,
	txDrop: Int,
	txFifo: Int,
	txColls: Int,
	txCarrier: Int,
	txCompressed: Int,
};

/**
@field name interface name
@field link general quality of the reception
@field level signal strength at the receiver
@field noise silence level (no packet) at the receiver
@field discardedNwid number of packets discarded due to wrong nwid/essid
@field discardedCrypt number of packets discarded due to
@field discardedFrag number of packets discarded due to inability to perform MAC reassembly
@field discardedRetry number of packets discarded due to max MAC retries num reached
@field discardedMisc number of packets discarded due to other reasons
@field missedBeacons number of missed beacons/superframes
**/
typedef NetWirelessDevice = {
	name: String,
	link: Float,
	level: Float,
	noise: Float,
	discardedNwid: Int,
	discardedCrypt: Int,
	discardedFrag: Int,
	discardedRetry: Int,
	discardedMisc: Int,
	missedBeacons: Int,
};

/**
@field slot kernel table slot number
@field referenceCount number of users of the socket
@field type socket type, `1` for `SOCK_STREAM` sockets, `2` for `SOCK_DGRAM` sockets, `5` for `SOCK_SEQPACKET` sockets
@field path bound pathname (if any) of the socket. For sockets in the abstract namespace, starts with at sign(char code 64).

**/
typedef NetUnixSocket = {
	slot: String,
	referenceCount: Int,
	type: Int,
	?path: String,
};


/**
@field slot kernel hash slot for the socket
@field uid effective UID of the creator of the socket
@field localAddress local address as 32 bit integer
@field localPort local port
@field remoteAddress remote address as 32 bit integer
@field remotePort remote port
@field txQueue outgoing queue memory usage
@field rxQueue incoming queue memory usage
**/
typedef NetSocket4 = {
	slot: Int,
	uid: Int,
	localAddress: Int,
	localPort: Int,
	remoteAddress: Int,
	remotePort: Int,
	txQueue: Int,
	rxQueue: Int,
};

/**
@field slot kernel hash slot for the socket
@field uid effective UID of the creator of the socket
@field localAddress local address as hexadecimal string
@field localPort local port
@field remoteAddress remote address as hexadecimal string
@field remotePort remote port
@field txQueue outgoing queue memory usage
@field rxQueue incoming queue memory usage
**/
typedef NetSocket6 = {
	slot: Int,
	uid: Int,
	localAddress: String,
	localPort: Int,
	remoteAddress: String,
	remotePort: Int,
	txQueue: Int,
	rxQueue: Int,
};

extern class Procfs{
/**
Parses contents of `/proc/<pid>/mountinfo`
@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processMountinfo(?pid:Int): Array<ProcessMountinfo>;

/**
Parses contents of `/proc/<pid>/io`
@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processIo(?pid:Int): ProcessIo;

/**
Parses contents of `/proc/<pid>/uid_map`
@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processUidMap(?pid:Int): Array<ProcessIdMapRange>;

/**
Parses contents of `/proc/<pid>/gid_map`
@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processGidMap(?pid:Int): Array<ProcessIdMapRange>;

/**
Parses contents of `/proc/<pid>/environ`
Note: the result can be used to create map, `new Map(result)`.
@param pid process PID, `self` process if undefined
@returns key-value pairs of initial environment process was started with
@throws ProcfsError
**/
	public static function processEnviron(?pid:Int): Array<Array<String>>;

/**
Parses contents of `/proc/<pid>/oom_score`
@param pid process PID, `self` process if undefined
@returns current score that the kernel gives to this process for the purpose of selecting a process for the OOM-killer
@throws ProcfsError
**/
	public static function processOomScore(?pid:Int): Int;

/**
Parses contents of `/proc/<pid>/timerslack_ns`
@param pid process PID, `self` process if undefined
@returns process's "current" timer slack value, in nanoseconds
@throws ProcfsError
**/
	public static function processTimerslackNs(?pid:Int): Int;

/**
Parses contents of `/proc/<pid>/cmdline`
Complete list of command-line arguments for the process, unless the process is a zombie. In the latter case, `null`.
Depending on `hidepid` option `procfs` was mounted with, may not be accessible by anyone but process owner.
@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processCmdline(?pid:Int): Null<Array<String>>;

/**
Parses contents of `/proc/<pid>/autogroup`
@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processAutogroup(?pid:Int): ProcessAutogroup;

/**
Parses contents of `/proc/<pid>/statm`
@param pid process PID, `self` process if undefined
@returns information about process memory usage
@throws ProcfsError
**/
	public static function processStatm(?pid:Int): ProcessStatm;

/**
Parses contents of `/proc/<pid>/comm`
Note: different threads in the same process may have different comm values

@param pid process PID, `self` process if undefined
@returns the command name associated with the process
@throws ProcfsError
**/
	public static function processComm(?pid:Int): String;

/**
Parses contents of `/proc/<pid>/cgroups`
@param pid process PID, `self` process if undefined
@returns control groups to which the process belongs
@throws ProcfsError
**/
	public static function processCgroups(?pid:Int): Array<ProcessCgroup>;

/**
Parses contents of `/proc/<pid>/personality`
Process's execution domain, as set by `personality`.
Note: permission to access this file is governed by ptrace access mode `PTRACE_MODE_ATTACH_FSCREDS`

@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processPersonality(?pid:Int): Int;

/**
Parses contents of `/proc/<pid>/cpuset`
@param pid process PID, `self` process if undefined
@returns path of the process's cpuset directory relative to the root of the cpuset filesystem
@throws ProcfsError
**/
	public static function processCpuset(?pid:Int): String;

/**
Parses contents of `/proc/<pid>/limits`
@param pid process PID, `self` process if undefined
@returns process's resource limits
@throws ProcfsError
**/
	public static function processLimits(?pid:Int): Array<ProcessLimit>;

/**
Parses contents of `/proc/<pid>/stat`
@param pid process PID, `self` process if undefined
@returns status information about the process(used by `ps`)
@throws ProcfsError
**/
	public static function processStat(?pid:Int): ProcessStat;

/**
Parses contents of `/proc/<pid>/status`
Depending on `hidepid` option `procfs` was mounted with, may not be accessible by anyone but process owner.
@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processStatus(?pid:Int): ProcessStatus;

/**
Parses list of `/proc/<pid>/fd/*` entries.
Note: In a multithreaded process, the contents of this directory are not available if the main thread has already terminated (typically by calling pthread_exit).
@param pid process PID, `self` process if undefined
@return process's current open fds
@throws ProcfsError
**/
	public static function processFds(?pid:Int): Array<Int>;

/**
Parses list of `/proc/<pid>/task/*` entries.
@param pid process PID, `self` process if undefined
@returns process's current threads
@throws ProcfsError
**/
	public static function processThreads(?pid:Int): Array<Int>;

/**
Parses contents of `/proc/<pid>/fdinfo/<fd>`
@param fd target fd
@param pid process PID, `self` process if undefined
@returns information about target file descriptor
@throws ProcfsError
**/
	public static function processFdinfo(fd:Int, ?pid:Int): ProcessFdinfo;

/**
Parses symlink at `/proc/<pid>/fd/<fd>`
Note: Permission to read this is governed by a ptrace access mode `PTRACE_MODE_READ_FSCREDS` check.
@param fd target fd
@param pid process PID, `self` process if undefined
@returns information about target file descriptor
@throws ProcfsError
**/
	public static function processFd(fd:Int, ?pid:Int): ProcessFd;

/**
Parses symlink at `/proc/<pid>/exe`
@param pid process PID, `self` process if undefined
@throws ProcfsError
**/
	public static function processExe(?pid:Int): ProcessExe;

/**
Parses symlink at `/proc/<pid>/cwd`
Note: in a multithreaded process, it is not available if the main thread has already terminated.
Note: permission to read this file(symlink) is governed by ptrace access mode `PTRACE_MODE_READ_FSCREDS`.

@param pid process PID, `self` process if undefined
@returns path to process `cwd`
@throws ProcfsError
**/
	public static function processCwd(?pid:Int): Path;

/**
Parses contents of `/proc/<pid>/net/dev`
@param pid process PID, `self` process if undefined
@returns statuses of network devices present within the system
@throws ProcfsError
**/
	public static function processNetDev(?pid:Int): Array<NetDevice>;

/**
Parses contents of `/proc/<pid>/net/wireless`
@param pid process PID, `self` process if undefined
@returns statuses of wireless network devices present within the system
@throws ProcfsError
**/
	public static function processNetWireless(?pid:Int): Array<NetWirelessDevice>;

/**
Parses contents of `/proc/<pid>/net/unix`
@param pid process PID, `self` process if undefined
@returns statuses of UNIX domain sockets present within the system
@throws ProcfsError
**/
	public static function processNetUnix(?pid:Int): Array<NetUnixSocket>;

/**
Parses contents of `/proc/<pid>/net/tcp`
@param pid process PID, `self` process if undefined
@returns statuses of IPv4 TCP sockets present within the system
@throws ProcfsError
**/
	public static function processNetTcp4(?pid:Int): Array<NetSocket4>;

/**
Parses contents of `/proc/<pid>/net/udp`
@param pid process PID, `self` process if undefined
@returns statuses of IPv4 UDP sockets present within the system
@throws ProcfsError
**/
	public static function processNetUdp4(?pid:Int): Array<NetSocket4>;

/**
Parses contents of `/proc/<pid>/net/tcp6`
@param pid process PID, `self` process if undefined
@returns statuses of IPv6 TCP sockets present within the system
@throws ProcfsError
**/
	public static function processNetTcp6(?pid:Int): Array<NetSocket6>;

/**
Parses contents of `/proc/<pid>/net/udp6`
@param pid process PID, `self` process if undefined
@returns statuses of IPv6 UDP sockets present within the system
@throws ProcfsError
**/
	public static function processNetUdp6(?pid:Int): Array<NetSocket6>;

/**
Parses contents of `/proc/net/dev`
@returns statuses of network devices present within the system
@throws ProcfsError
**/
	public static function netDev(): Array<NetDevice>;

/**
Parses contents of `/proc/net/wireless`
@returns statuses of wireless network devices present within the system
@throws ProcfsError
**/
	public static function netWireless(): Array<NetWirelessDevice>;

/**
Parses contents of `/proc/net/unix`
@returns statuses of UNIX domain sockets present within the system
@throws ProcfsError
**/
	public static function netUnix(): Array<NetUnixSocket>;

/**
Parses contents of `/proc/net/tcp`
@returns statuses of IPv4 TCP sockets present within the system
@throws ProcfsError
**/
	public static function netTcp4(): Array<NetSocket4>;

/**
Parses contents of `/proc/net/udp`
@returns statuses of IPv4 UDP sockets present within the system
@throws ProcfsError
**/
	public static function netUdp4(): Array<NetSocket4>;

/**
Parses contents of `/proc/net/tcp6`
@returns statuses of IPv6 TCP sockets present within the system
@throws ProcfsError
**/
	public static function netTcp6(): Array<NetSocket6>;

/**
Parses contents of `/proc/net/udp6`
@returns statuses of IPv6 UDP sockets present within the system
@throws ProcfsError
**/
	public static function netUdp6(): Array<NetSocket6>;

/**
Parses contents of `/proc/cpuinfo`
@unstable documentation on that is hard to find, need to get at least a list of fields which are present on all systems or just remove this method from the library
@throws ProcfsError
**/
	public static function cpuinfo(): Array<CpuCoreInfo>;

/**
Parses contents of `/proc/loadavg`
@throws ProcfsError
**/
	public static function loadavg(): Loadavg;

/**
Parses contents of `/proc/uptime`
@throws ProcfsError
**/
	public static function uptime(): Uptime;

/**
Parses contents of `/proc/version`
Note: includes the contents of `/proc/sys/kernel/ostype`, `/proc/sys/kernel/osrelease` and `/proc/sys/kernel/version`.
@returns identifies the kernel version that is currently running
@throws ProcfsError
**/
	public static function version(): String;

/**
Parses contents of `/proc/cmdline`
@returns arguments passed to the Linux kernel at boot time
@throws ProcfsError
**/
	public static function cmdline(): String;

/**
Parses contents of `/proc/swaps`
@returns swap areas in use
@throws ProcfsError
**/
	public static function swaps(): Array<Swap>;

/**
Parses contents of `/proc/stat`
@returns kernel/system statistics
@throws ProcfsError
**/
	public static function stat(): Stat;

/**
Parses contents of `/proc/devices`
@returns major numbers and device groups.
@throws ProcfsError
**/
	public static function devices(): Array<Device>;

/**
Parses contents of `/proc/filesystems`
@returns filesystems which are supported by the kernel(which were compiled into the kernel or whose kernel modules are currently loaded)
@throws ProcfsError
**/
	public static function filesystems(): Array<Filesystem>;

/**
Parses contents of `/proc/diskstats`
@returns I/O statistics for each disk device
@throws ProcfsError
**/
	public static function diskstats(): Array<Diskstat>;

/**
Parses contents of `/proc/partitions`
@returns partitions in system
@throws ProcfsError
**/
	public static function partitions(): Array<Partition>;

/**
Parses contents of `/proc/meminfo`
@returns statistics about memory usage on the system
@throws ProcfsError
**/
	public static function meminfo(): Meminfo;

/**
Parses list of `/proc/*` entries.
Depending on `hidepid` option `procfs` was mounted with, may only contain user's own processes.
@returns pids of currently running processes
@throws ProcfsError
**/
	public static function processes(): Array<Int>;

/**
Parses contents of `/proc/config.gz`
Available if the kernel is configured with `CONFIG_IKCONFIG_PROC`
@returns kernel config
@throws ProcfsError
**/
	public static function config(): String;

/**
Parses contents of `/proc/cgroups`
@returns controllers that are compiled into the kernel
@throws ProcfsError
**/
	public static function cgroups(): Array<CgroupController>;

/**
@returns minor part of devId
**/
	public static function devIdGetMinor(devId:DevId):Int;

/**
@returns major part of devId
**/
	public static function devIdGetMajor(devId:DevId):Int;

/**
@param major major part of DevId
@param minor minor part of DevId
@returns id combined from major and minor parts
**/
	public static function devIdFromMajorMinor(major:Int, minor:Int):DevId;
}
