// generated code
const Joi = require('joi');

const asserter = schema => v => {
	let {error} = schema.validate(v);
	if (error) {
		throw error;
	}
};

module.exports = {
	processMountinfo: asserter(Joi.array().items(Joi.object().keys({
		type: Joi.string().allow('').required(),
		superOptions: Joi.array().items(Joi.string().allow('')).min(0).required(),
		root: Joi.string().allow('').required(),
		parentId: Joi.number().integer().required(),
		optionalFields: Joi.array().items(Joi.string().allow('')).min(0).required(),
		mountSource: Joi.string().allow('').required(),
		mountPoint: Joi.string().allow('').required(),
		mountOptions: Joi.array().items(Joi.string().allow('')).min(0).required(),
		mountId: Joi.number().integer().required(),
		devId: Joi.number().integer().required(),
	})).min(0).required()),
	processIo: asserter(Joi.object().keys({
		writeSyscalls: Joi.number().integer().required(),
		writeReal: Joi.number().integer().required(),
		writeCancelled: Joi.number().integer().required(),
		write: Joi.number().integer().required(),
		readSyscalls: Joi.number().integer().required(),
		readReal: Joi.number().integer().required(),
		read: Joi.number().integer().required(),
	}).required()),
	processUidMap: asserter(Joi.array().items(Joi.object().keys({
		targetStart: Joi.number().integer().required(),
		start: Joi.number().integer().required(),
		length: Joi.number().integer().required(),
	})).min(0).required()),
	processGidMap: asserter(Joi.array().items(Joi.object().keys({
		targetStart: Joi.number().integer().required(),
		start: Joi.number().integer().required(),
		length: Joi.number().integer().required(),
	})).min(0).required()),
	processEnviron: asserter(Joi.array().items(Joi.array().items(Joi.string().allow('')).min(0)).min(0).required()),
	processOomScore: asserter(Joi.number().integer().required()),
	processTimerslackNs: asserter(Joi.number().integer().required()),
	processCmdline: asserter(Joi.array().items(Joi.string().allow('')).min(0).required()),
	processAutogroup: asserter(Joi.object().keys({
		nice: Joi.number().integer().required(),
		name: Joi.string().allow('').required(),
	}).required()),
	processStatm: asserter(Joi.object().keys({
		text: Joi.number().integer().required(),
		size: Joi.number().integer().required(),
		shared: Joi.number().integer().required(),
		resident: Joi.number().integer().required(),
		data: Joi.number().integer().required(),
	}).required()),
	processComm: asserter(Joi.string().allow('').required()),
	processCgroups: asserter(Joi.array().items(Joi.object().keys({
		path: Joi.string().allow('').required(),
		hierarchyId: Joi.number().integer().required(),
		controllers: Joi.array().items(Joi.string().allow('')).min(0),
	})).min(0).required()),
	processPersonality: asserter(Joi.number().integer().required()),
	processCpuset: asserter(Joi.string().allow('').required()),
	processLimits: asserter(Joi.array().items(Joi.object().keys({
		units: Joi.string().allow(''),
		soft: Joi.number().integer(),
		name: Joi.string().allow('').required(),
		hard: Joi.number().integer(),
	})).min(0).required()),
	processStat: asserter(Joi.object().keys({
		vsize: Joi.number().integer().required(),
		userTicks: Joi.number().integer().required(),
		tty: Joi.number().integer().required(),
		threads: Joi.number().integer().required(),
		terminalProcessGroup: Joi.number().integer().required(),
		state: Joi.string().allow('').required(),
		startTicks: Joi.number().integer().required(),
		session: Joi.number().integer().required(),
		schedulingPolicy: Joi.number().integer().required(),
		rssSoftLimit: Joi.number().unsafe().required(),
		rss: Joi.number().integer().required(),
		realtimePriority: Joi.number().integer().required(),
		processGroup: Joi.number().integer().required(),
		priority: Joi.number().integer().required(),
		pid: Joi.number().integer().required(),
		parent: Joi.number().integer().required(),
		nice: Joi.number().integer().required(),
		minorFaults: Joi.number().integer().required(),
		majorFaults: Joi.number().integer().required(),
		lastCpu: Joi.number().integer().required(),
		kernelTicks: Joi.number().integer().required(),
		guestTicks: Joi.number().integer().required(),
		flags: Joi.number().integer().required(),
		exitSignal: Joi.number().integer().required(),
		comm: Joi.string().allow('').required(),
		childUserTicks: Joi.number().integer().required(),
		childMinorFaults: Joi.number().integer().required(),
		childMajorFaults: Joi.number().integer().required(),
		childKernelTicks: Joi.number().integer().required(),
		childGuestTicks: Joi.number().integer().required(),
		blockIoTicks: Joi.number().integer().required(),
	}).required()),
	processStatus: asserter(Joi.object().keys({
		vmSwap: Joi.number().integer().required(),
		vmStack: Joi.number().integer().required(),
		vmSize: Joi.number().integer().required(),
		vmRss: Joi.number().integer().required(),
		vmPte: Joi.number().integer().required(),
		vmPinned: Joi.number().integer().required(),
		vmPeak: Joi.number().integer().required(),
		vmLocked: Joi.number().integer().required(),
		vmLib: Joi.number().integer().required(),
		vmHwm: Joi.number().integer().required(),
		vmExe: Joi.number().integer().required(),
		vmData: Joi.number().integer().required(),
		umask: Joi.number().integer(),
		uidSavedSet: Joi.number().integer().required(),
		uidReal: Joi.number().integer().required(),
		uidFilesystem: Joi.number().integer().required(),
		uidEffective: Joi.number().integer().required(),
		tracerPid: Joi.number().integer().required(),
		threads: Joi.number().integer().required(),
		threadGroupId: Joi.number().integer().required(),
		state: Joi.string().allow('').required(),
		speculationStoreBypass: Joi.string().allow(''),
		signalsQueuedLimit: Joi.number().integer().required(),
		signalsQueued: Joi.number().integer().required(),
		signalsPending: Joi.number().integer().required(),
		signalsIgnored: Joi.number().integer().required(),
		signalsCaught: Joi.number().integer().required(),
		signalsBlocked: Joi.number().integer().required(),
		sharedSignalsPending: Joi.number().integer().required(),
		seccompMode: Joi.number().integer(),
		rtSignalsIgnored: Joi.number().integer().required(),
		rtSignalsCaught: Joi.number().integer().required(),
		rtSignalsBlocked: Joi.number().integer().required(),
		rssShmem: Joi.number().integer(),
		rssFile: Joi.number().integer(),
		rssAnon: Joi.number().integer(),
		pid: Joi.number().integer().required(),
		parentPid: Joi.number().integer().required(),
		numaGroupId: Joi.number().integer().required(),
		name: Joi.string().allow('').required(),
		memoriesAllowedMask: Joi.number().integer().required(),
		hugetlbPagesSize: Joi.number().integer().required(),
		groups: Joi.array().items(Joi.number().integer()).min(0).required(),
		gidSavedSet: Joi.number().integer().required(),
		gidReal: Joi.number().integer().required(),
		gidFilesystem: Joi.number().integer().required(),
		gidEffective: Joi.number().integer().required(),
		fdSlots: Joi.number().integer().required(),
		cpusAllowedMask: Joi.number().integer().required(),
		contextSwitchesVoluntary: Joi.number().integer().required(),
		contextSwitchesNonvoluntary: Joi.number().integer().required(),
	}).required()),
	processFds: asserter(Joi.array().items(Joi.number().integer()).min(0).required()),
	processThreads: asserter(Joi.array().items(Joi.number().integer()).min(0).required()),
	processFdinfo: asserter(Joi.object().keys({
		type: Joi.string().allow('').required(),
		timerValue: Joi.array().items(Joi.number().integer()).min(0),
		timerTicks: Joi.number().integer(),
		timerSettimeFlags: Joi.number().integer(),
		timerInterval: Joi.array().items(Joi.number().integer()).min(0),
		timerClockId: Joi.number().integer(),
		signalMask: Joi.number().integer(),
		rtSignalMask: Joi.number().integer(),
		pos: Joi.number().integer().required(),
		mntId: Joi.number().integer().required(),
		inotifyFiles: Joi.array().items(Joi.object().keys({
			wd: Joi.number().integer().required(),
			mask: Joi.number().integer().required(),
			inode: Joi.number().integer().required(),
			ignoredMask: Joi.number().integer().required(),
			deviceId: Joi.number().integer().required(),
		})).min(0),
		flags: Joi.number().integer().required(),
		fanotifyMarks: Joi.array().items(Joi.object().keys({
			mask: Joi.number().integer().required(),
			inode: Joi.number().integer().required(),
			ignoredMask: Joi.number().integer().required(),
			flags: Joi.number().integer().required(),
			deviceId: Joi.number().integer().required(),
		})).min(0),
		fanotifyFlags: Joi.number().integer(),
		fanotifyEventFlags: Joi.number().integer(),
		eventfdCounter: Joi.number().integer(),
		epollCounters: Joi.array().items(Joi.object().keys({
			fd: Joi.number().integer().required(),
			eventMask: Joi.number().integer().required(),
			data: Joi.string().allow('').required(),
		})).min(0),
	}).required()),
	processFd: asserter(Joi.object().keys({
		type: Joi.string().allow('').required(),
		path: Joi.string().allow(''),
		inode: Joi.number().integer(),
		anonInodeType: Joi.string().allow(''),
	}).required()),
	processExe: asserter(Joi.object().keys({
		path: Joi.string().allow('').required(),
		deleted: Joi.boolean().required(),
	}).required()),
	processCwd: asserter(Joi.string().allow('').required()),
	processNetDev: asserter(Joi.array().items(Joi.object().keys({
		txPackets: Joi.number().integer().required(),
		txFifo: Joi.number().integer().required(),
		txErrors: Joi.number().integer().required(),
		txDrop: Joi.number().integer().required(),
		txCompressed: Joi.number().integer().required(),
		txColls: Joi.number().integer().required(),
		txCarrier: Joi.number().integer().required(),
		txBytes: Joi.number().integer().required(),
		rxPackets: Joi.number().integer().required(),
		rxMulticast: Joi.number().integer().required(),
		rxFrame: Joi.number().integer().required(),
		rxFifo: Joi.number().integer().required(),
		rxErrors: Joi.number().integer().required(),
		rxDrop: Joi.number().integer().required(),
		rxCompressed: Joi.number().integer().required(),
		rxBytes: Joi.number().integer().required(),
		name: Joi.string().allow('').required(),
	})).min(0).required()),
	processNetWireless: asserter(Joi.array().items(Joi.object().keys({
		noise: Joi.number().unsafe().required(),
		name: Joi.string().allow('').required(),
		missedBeacons: Joi.number().integer().required(),
		link: Joi.number().unsafe().required(),
		level: Joi.number().unsafe().required(),
		discardedRetry: Joi.number().integer().required(),
		discardedNwid: Joi.number().integer().required(),
		discardedMisc: Joi.number().integer().required(),
		discardedFrag: Joi.number().integer().required(),
		discardedCrypt: Joi.number().integer().required(),
	})).min(0).required()),
	processNetUnix: asserter(Joi.array().items(Joi.object().keys({
		type: Joi.number().integer().required(),
		slot: Joi.string().allow('').required(),
		referenceCount: Joi.number().integer().required(),
		path: Joi.string().allow(''),
	})).min(0).required()),
	processNetTcp4: asserter(Joi.array().items(Joi.object().keys({
		uid: Joi.number().integer().required(),
		txQueue: Joi.number().integer().required(),
		slot: Joi.number().integer().required(),
		rxQueue: Joi.number().integer().required(),
		remotePort: Joi.number().integer().required(),
		remoteAddress: Joi.number().integer().required(),
		localPort: Joi.number().integer().required(),
		localAddress: Joi.number().integer().required(),
	})).min(0).required()),
	processNetUdp4: asserter(Joi.array().items(Joi.object().keys({
		uid: Joi.number().integer().required(),
		txQueue: Joi.number().integer().required(),
		slot: Joi.number().integer().required(),
		rxQueue: Joi.number().integer().required(),
		remotePort: Joi.number().integer().required(),
		remoteAddress: Joi.number().integer().required(),
		localPort: Joi.number().integer().required(),
		localAddress: Joi.number().integer().required(),
	})).min(0).required()),
	processNetTcp6: asserter(Joi.array().items(Joi.object().keys({
		uid: Joi.number().integer().required(),
		txQueue: Joi.number().integer().required(),
		slot: Joi.number().integer().required(),
		rxQueue: Joi.number().integer().required(),
		remotePort: Joi.number().integer().required(),
		remoteAddress: Joi.string().allow('').required(),
		localPort: Joi.number().integer().required(),
		localAddress: Joi.string().allow('').required(),
	})).min(0).required()),
	processNetUdp6: asserter(Joi.array().items(Joi.object().keys({
		uid: Joi.number().integer().required(),
		txQueue: Joi.number().integer().required(),
		slot: Joi.number().integer().required(),
		rxQueue: Joi.number().integer().required(),
		remotePort: Joi.number().integer().required(),
		remoteAddress: Joi.string().allow('').required(),
		localPort: Joi.number().integer().required(),
		localAddress: Joi.string().allow('').required(),
	})).min(0).required()),
	netDev: asserter(Joi.array().items(Joi.object().keys({
		txPackets: Joi.number().integer().required(),
		txFifo: Joi.number().integer().required(),
		txErrors: Joi.number().integer().required(),
		txDrop: Joi.number().integer().required(),
		txCompressed: Joi.number().integer().required(),
		txColls: Joi.number().integer().required(),
		txCarrier: Joi.number().integer().required(),
		txBytes: Joi.number().integer().required(),
		rxPackets: Joi.number().integer().required(),
		rxMulticast: Joi.number().integer().required(),
		rxFrame: Joi.number().integer().required(),
		rxFifo: Joi.number().integer().required(),
		rxErrors: Joi.number().integer().required(),
		rxDrop: Joi.number().integer().required(),
		rxCompressed: Joi.number().integer().required(),
		rxBytes: Joi.number().integer().required(),
		name: Joi.string().allow('').required(),
	})).min(0).required()),
	netWireless: asserter(Joi.array().items(Joi.object().keys({
		noise: Joi.number().unsafe().required(),
		name: Joi.string().allow('').required(),
		missedBeacons: Joi.number().integer().required(),
		link: Joi.number().unsafe().required(),
		level: Joi.number().unsafe().required(),
		discardedRetry: Joi.number().integer().required(),
		discardedNwid: Joi.number().integer().required(),
		discardedMisc: Joi.number().integer().required(),
		discardedFrag: Joi.number().integer().required(),
		discardedCrypt: Joi.number().integer().required(),
	})).min(0).required()),
	netUnix: asserter(Joi.array().items(Joi.object().keys({
		type: Joi.number().integer().required(),
		slot: Joi.string().allow('').required(),
		referenceCount: Joi.number().integer().required(),
		path: Joi.string().allow(''),
	})).min(0).required()),
	netTcp4: asserter(Joi.array().items(Joi.object().keys({
		uid: Joi.number().integer().required(),
		txQueue: Joi.number().integer().required(),
		slot: Joi.number().integer().required(),
		rxQueue: Joi.number().integer().required(),
		remotePort: Joi.number().integer().required(),
		remoteAddress: Joi.number().integer().required(),
		localPort: Joi.number().integer().required(),
		localAddress: Joi.number().integer().required(),
	})).min(0).required()),
	netUdp4: asserter(Joi.array().items(Joi.object().keys({
		uid: Joi.number().integer().required(),
		txQueue: Joi.number().integer().required(),
		slot: Joi.number().integer().required(),
		rxQueue: Joi.number().integer().required(),
		remotePort: Joi.number().integer().required(),
		remoteAddress: Joi.number().integer().required(),
		localPort: Joi.number().integer().required(),
		localAddress: Joi.number().integer().required(),
	})).min(0).required()),
	netTcp6: asserter(Joi.array().items(Joi.object().keys({
		uid: Joi.number().integer().required(),
		txQueue: Joi.number().integer().required(),
		slot: Joi.number().integer().required(),
		rxQueue: Joi.number().integer().required(),
		remotePort: Joi.number().integer().required(),
		remoteAddress: Joi.string().allow('').required(),
		localPort: Joi.number().integer().required(),
		localAddress: Joi.string().allow('').required(),
	})).min(0).required()),
	netUdp6: asserter(Joi.array().items(Joi.object().keys({
		uid: Joi.number().integer().required(),
		txQueue: Joi.number().integer().required(),
		slot: Joi.number().integer().required(),
		rxQueue: Joi.number().integer().required(),
		remotePort: Joi.number().integer().required(),
		remoteAddress: Joi.string().allow('').required(),
		localPort: Joi.number().integer().required(),
		localAddress: Joi.string().allow('').required(),
	})).min(0).required()),
	cpuinfo: asserter(Joi.array().items(Joi.object().keys({
		wp: Joi.boolean().required(),
		vendorId: Joi.string().allow('').required(),
		stepping: Joi.number().integer().required(),
		siblings: Joi.number().integer().required(),
		physicalId: Joi.number().integer().required(),
		modelName: Joi.string().allow('').required(),
		model: Joi.number().integer().required(),
		microcode: Joi.string().allow('').required(),
		initialApicId: Joi.number().integer().required(),
		id: Joi.number().integer().required(),
		fpuException: Joi.boolean().required(),
		fpu: Joi.boolean().required(),
		flags: Joi.array().items(Joi.string().allow('')).min(0).required(),
		family: Joi.number().integer().required(),
		cpuidLevel: Joi.number().integer().required(),
		cpuMhz: Joi.number().unsafe().required(),
		cores: Joi.number().integer().required(),
		coreId: Joi.number().integer().required(),
		clflushSize: Joi.number().integer().required(),
		cacheSize: Joi.string().allow('').required(),
		cacheAlignment: Joi.number().integer().required(),
		bugs: Joi.array().items(Joi.string().allow('')).min(0).required(),
		bogoMips: Joi.number().integer().required(),
		apicId: Joi.number().integer().required(),
		addressSizes: Joi.string().allow('').required(),
	})).min(0).required()),
	loadavg: asserter(Joi.object().keys({
		runnableEntities: Joi.number().unsafe().required(),
		mostRecentlyCreatedPid: Joi.number().unsafe().required(),
		jobsAverage5Minutes: Joi.number().unsafe().required(),
		jobsAverage1Minute: Joi.number().unsafe().required(),
		jobsAverage15Minutes: Joi.number().unsafe().required(),
		existingEntities: Joi.number().unsafe().required(),
	}).required()),
	uptime: asserter(Joi.object().keys({
		time: Joi.number().unsafe().required(),
		idle: Joi.number().unsafe().required(),
	}).required()),
	version: asserter(Joi.string().allow('').required()),
	cmdline: asserter(Joi.string().allow('').required()),
	swaps: asserter(Joi.array().items(Joi.object().keys({
		used: Joi.number().integer().required(),
		type: Joi.string().allow('').required(),
		size: Joi.number().integer().required(),
		priority: Joi.number().integer().required(),
		path: Joi.string().allow('').required(),
	})).min(0).required()),
	stat: asserter(Joi.object().keys({
		systemCpuTime: Joi.object().keys({
			user: Joi.number().integer().required(),
			system: Joi.number().integer().required(),
			steal: Joi.number().integer().required(),
			softirq: Joi.number().integer().required(),
			nice: Joi.number().integer().required(),
			irq: Joi.number().integer().required(),
			iowait: Joi.number().integer().required(),
			idle: Joi.number().integer().required(),
			guestNice: Joi.number().integer().required(),
			guest: Joi.number().integer().required(),
		}).required(),
		softInterrupts: Joi.number().integer().required(),
		processesRunning: Joi.number().integer().required(),
		processesBlocked: Joi.number().integer().required(),
		numberedSoftInterrupts: Joi.array().items(Joi.number().integer()).min(0).required(),
		numberedInterrupts: Joi.array().items(Joi.number().integer()).min(0).required(),
		interrupts: Joi.number().integer().required(),
		forks: Joi.number().integer().required(),
		cpuTime: Joi.array().items(Joi.object().keys({
			user: Joi.number().integer().required(),
			system: Joi.number().integer().required(),
			steal: Joi.number().integer().required(),
			softirq: Joi.number().integer().required(),
			nice: Joi.number().integer().required(),
			irq: Joi.number().integer().required(),
			iowait: Joi.number().integer().required(),
			idle: Joi.number().integer().required(),
			guestNice: Joi.number().integer().required(),
			guest: Joi.number().integer().required(),
		})).min(0).required(),
		contextSwitches: Joi.number().integer().required(),
		bootTime: Joi.date().required(),
	}).required()),
	devices: asserter(Joi.array().items(Joi.object().keys({
		type: Joi.string().allow('').required(),
		major: Joi.number().integer().required(),
		group: Joi.string().allow('').required(),
	})).min(0).required()),
	filesystems: asserter(Joi.array().items(Joi.object().keys({
		requiresBlockDevice: Joi.boolean().required(),
		name: Joi.string().allow('').required(),
	})).min(0).required()),
	diskstats: asserter(Joi.array().items(Joi.object().keys({
		writesMerged: Joi.number().integer().required(),
		writes: Joi.number().integer().required(),
		writeTime: Joi.number().integer().required(),
		weightedIoTime: Joi.number().integer().required(),
		sectorsWriten: Joi.number().integer().required(),
		sectorsRead: Joi.number().integer().required(),
		readsMerged: Joi.number().integer().required(),
		reads: Joi.number().integer().required(),
		readTime: Joi.number().integer().required(),
		name: Joi.string().allow('').required(),
		ioTime: Joi.number().integer().required(),
		devId: Joi.number().integer().required(),
		currentIoCount: Joi.number().integer().required(),
	})).min(0).required()),
	partitions: asserter(Joi.array().items(Joi.object().keys({
		name: Joi.string().allow('').required(),
		devId: Joi.number().integer().required(),
		blocks: Joi.number().integer().required(),
	})).min(0).required()),
	meminfo: asserter(Joi.object().keys({
		writebackTmp: Joi.number().integer().required(),
		writeback: Joi.number().integer().required(),
		vmallocTotal: Joi.number().integer().required(),
		total: Joi.number().integer().required(),
		swapTotal: Joi.number().integer().required(),
		swapFree: Joi.number().integer().required(),
		swapCached: Joi.number().integer().required(),
		slabUnreclaimable: Joi.number().integer().required(),
		slabReclaimable: Joi.number().integer().required(),
		slab: Joi.number().integer().required(),
		shmemPmdMapped: Joi.number().integer(),
		shmemHugePages: Joi.number().integer(),
		shmem: Joi.number().integer().required(),
		pageTables: Joi.number().integer().required(),
		mapped: Joi.number().integer().required(),
		kernelStack: Joi.number().integer().required(),
		kernelReclaimable: Joi.number().integer(),
		inactive: Joi.number().integer().required(),
		hugepagesTotal: Joi.number().integer(),
		hugepagesSurplus: Joi.number().integer(),
		hugepagesReserved: Joi.number().integer(),
		hugepagesFree: Joi.number().integer(),
		hugepageSize: Joi.number().integer(),
		hardwareCorrupted: Joi.number().integer(),
		free: Joi.number().integer().required(),
		dirty: Joi.number().integer().required(),
		directMap4M: Joi.number().integer().required(),
		directMap4K: Joi.number().integer().required(),
		directMap2M: Joi.number().integer().required(),
		directMap1G: Joi.number().integer().required(),
		commitLimit: Joi.number().integer().required(),
		cached: Joi.number().integer().required(),
		buffers: Joi.number().integer().required(),
		bounceBuffers: Joi.number().integer().required(),
		available: Joi.number().integer().required(),
		anonPages: Joi.number().integer().required(),
		anonHugePages: Joi.number().integer().required(),
		active: Joi.number().integer().required(),
	}).required()),
	processes: asserter(Joi.array().items(Joi.number().integer()).min(0).required()),
	config: asserter(Joi.string().allow('').required()),
	cgroups: asserter(Joi.array().items(Joi.object().keys({
		name: Joi.string().allow('').required(),
		hierarchyId: Joi.number().integer().required(),
		enabled: Joi.boolean().required(),
		cgroupsNumber: Joi.number().integer().required(),
	})).min(0).required()),
	devIdGetMinor: asserter(Joi.number().integer().required()),
	devIdGetMajor: asserter(Joi.number().integer().required()),
	devIdFromMajorMinor: asserter(Joi.number().integer().required()),
};
