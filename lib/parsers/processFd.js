module.exports = src => {
	if (src.charCodeAt(0) === 47) {
		return {
			type: 'file',
			path: src,
		};
	}
	let ps = src.split(':');
	let anonInodeType;
	switch (ps[0]) {
		case 'pipe': case 'socket':
			return {
				type: ps[0],
				inode: parseInt(ps[1].substr(1)),
			};
		case 'anon_inode':
			anonInodeType = ps[1];
			if (anonInodeType.charCodeAt(0) === 91 && anonInodeType.charCodeAt(anonInodeType.length - 1) === 93) {
				anonInodeType = anonInodeType.substr(1, anonInodeType.length - 2);
			}
			return {
				type: 'anon-inode',
				anonInodeType,
			};
		default: throw new Error('unexpected format');
	}
};