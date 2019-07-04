module.exports = [
	{
		name: 'ccm(aes)',
		driver: 'ccm_base(ctr(aes-aesni),cbcmac(aes-aesni))',
		module: 'ccm',
		priority: 300,
		refcnt: 3,
		selftest: 'passed',
		internal: false,
		type: 'aead',
		async: false,
		blocksize: 1,
		ivsize: 16,
		maxauthsize: 16,
		geniv: '<none>',
	},
	{
		name: 'ctr(aes)',
		driver: 'ctr(aes-aesni)',
		module: 'kernel',
		priority: 300,
		refcnt: 5,
		selftest: 'passed',
		internal: false,
		type: 'blkcipher',
		blocksize: 1,
		minKeysize: 16,
		maxKeysize: 32,
		ivsize: 16,
		geniv: 'chainiv',
	},
	{
		name: 'cbcmac(aes)',
		driver: 'cbcmac(aes-aesni)',
		module: 'ccm',
		priority: 300,
		refcnt: 5,
		selftest: 'passed',
		internal: false,
		type: 'shash',
		blocksize: 1,
		digestsize: 16,
	},
	{
		name: 'ecb(arc4)',
		driver: 'ecb(arc4)-generic',
		module: 'arc4',
		priority: 100,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'blkcipher',
		blocksize: 1,
		minKeysize: 1,
		maxKeysize: 256,
		ivsize: 0,
		geniv: '<default>',
	},
	{
		name: 'arc4',
		driver: 'arc4-generic',
		module: 'arc4',
		priority: 0,
		refcnt: 3,
		selftest: 'passed',
		internal: false,
		type: 'cipher',
		blocksize: 1,
		minKeysize: 1,
		maxKeysize: 256,
	},
	{
		name: 'ecdh',
		driver: 'ecdh-generic',
		module: 'ecdh_generic',
		priority: 100,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'kpp',
	},
	{
		name: 'crct10dif',
		driver: 'crct10dif-pclmul',
		module: 'crct10dif_pclmul',
		priority: 200,
		refcnt: 2,
		selftest: 'passed',
		internal: false,
		type: 'shash',
		blocksize: 1,
		digestsize: 2,
	},
	{
		name: 'crc32',
		driver: 'crc32-pclmul',
		module: 'crc32_pclmul',
		priority: 200,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'shash',
		blocksize: 1,
		digestsize: 4,
	},
	{
		name: 'ghash',
		driver: 'ghash-clmulni',
		module: 'ghash_clmulni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'ahash',
		async: true,
		blocksize: 16,
		digestsize: 16,
	},
	{
		name: '__ghash',
		driver: '__ghash-pclmulqdqni',
		module: 'ghash_clmulni_intel',
		priority: 0,
		refcnt: 1,
		selftest: 'passed',
		internal: true,
		type: 'shash',
		blocksize: 16,
		digestsize: 16,
	},
	{
		name: 'xts(aes)',
		driver: 'xts-aes-aesni',
		module: 'aesni_intel',
		priority: 401,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'skcipher',
		async: true,
		blocksize: 16,
		minKeysize: 32,
		maxKeysize: 64,
		ivsize: 16,
		chunksize: 16,
		walksize: 16,
	},
	{
		name: 'ctr(aes)',
		driver: 'ctr-aes-aesni',
		module: 'aesni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'skcipher',
		async: true,
		blocksize: 1,
		minKeysize: 16,
		maxKeysize: 32,
		ivsize: 16,
		chunksize: 16,
		walksize: 16,
	},
	{
		name: 'cbc(aes)',
		driver: 'cbc-aes-aesni',
		module: 'aesni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'skcipher',
		async: true,
		blocksize: 16,
		minKeysize: 16,
		maxKeysize: 32,
		ivsize: 16,
		chunksize: 16,
		walksize: 16,
	},
	{
		name: 'ecb(aes)',
		driver: 'ecb-aes-aesni',
		module: 'aesni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'skcipher',
		async: true,
		blocksize: 16,
		minKeysize: 16,
		maxKeysize: 32,
		ivsize: 0,
		chunksize: 16,
		walksize: 16,
	},
	{
		name: 'gcm(aes)',
		driver: 'generic-gcm-aesni',
		module: 'aesni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'aead',
		async: true,
		blocksize: 1,
		ivsize: 12,
		maxauthsize: 16,
		geniv: '<none>',
	},
	{
		name: '__generic-gcm-aes-aesni',
		driver: '__driver-generic-gcm-aes-aesni',
		module: 'aesni_intel',
		priority: 0,
		refcnt: 1,
		selftest: 'passed',
		internal: true,
		type: 'aead',
		async: false,
		blocksize: 1,
		ivsize: 12,
		maxauthsize: 16,
		geniv: '<none>',
	},
	{
		name: 'rfc4106(gcm(aes))',
		driver: 'rfc4106-gcm-aesni',
		module: 'aesni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'aead',
		async: true,
		blocksize: 1,
		ivsize: 8,
		maxauthsize: 16,
		geniv: '<none>',
	},
	{
		name: '__gcm-aes-aesni',
		driver: '__driver-gcm-aes-aesni',
		module: 'aesni_intel',
		priority: 0,
		refcnt: 1,
		selftest: 'passed',
		internal: true,
		type: 'aead',
		async: false,
		blocksize: 1,
		ivsize: 8,
		maxauthsize: 16,
		geniv: '<none>',
	},
	{
		name: '__xts(aes)',
		driver: '__xts-aes-aesni',
		module: 'aesni_intel',
		priority: 401,
		refcnt: 1,
		selftest: 'passed',
		internal: true,
		type: 'skcipher',
		async: false,
		blocksize: 16,
		minKeysize: 32,
		maxKeysize: 64,
		ivsize: 16,
		chunksize: 16,
		walksize: 16,
	},
	{
		name: '__ctr(aes)',
		driver: '__ctr-aes-aesni',
		module: 'aesni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: true,
		type: 'skcipher',
		async: false,
		blocksize: 1,
		minKeysize: 16,
		maxKeysize: 32,
		ivsize: 16,
		chunksize: 16,
		walksize: 16,
	},
	{
		name: '__cbc(aes)',
		driver: '__cbc-aes-aesni',
		module: 'aesni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: true,
		type: 'skcipher',
		async: false,
		blocksize: 16,
		minKeysize: 16,
		maxKeysize: 32,
		ivsize: 16,
		chunksize: 16,
		walksize: 16,
	},
	{
		name: '__ecb(aes)',
		driver: '__ecb-aes-aesni',
		module: 'aesni_intel',
		priority: 400,
		refcnt: 1,
		selftest: 'passed',
		internal: true,
		type: 'skcipher',
		async: false,
		blocksize: 16,
		minKeysize: 16,
		maxKeysize: 32,
		ivsize: 0,
		chunksize: 16,
		walksize: 16,
	},
	{
		name: '__aes',
		driver: '__aes-aesni',
		module: 'aesni_intel',
		priority: 300,
		refcnt: 1,
		selftest: 'passed',
		internal: true,
		type: 'cipher',
		blocksize: 16,
		minKeysize: 16,
		maxKeysize: 32,
	},
	{
		name: 'aes',
		driver: 'aes-aesni',
		module: 'aesni_intel',
		priority: 300,
		refcnt: 5,
		selftest: 'passed',
		internal: false,
		type: 'cipher',
		blocksize: 16,
		minKeysize: 16,
		maxKeysize: 32,
	},
	{
		name: 'aes',
		driver: 'aes-asm',
		module: 'aes_x86_64',
		priority: 200,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'cipher',
		blocksize: 16,
		minKeysize: 16,
		maxKeysize: 32,
	},
	{
		name: 'pkcs1pad(rsa,sha256)',
		driver: 'pkcs1pad(rsa-generic,sha256)',
		module: 'kernel',
		priority: 100,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'akcipher',
	},
	{
		name: 'crc32c',
		driver: 'crc32c-generic',
		module: 'crc32c_generic',
		priority: 100,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'shash',
		blocksize: 1,
		digestsize: 4,
	},
	{
		name: 'crc32c',
		driver: 'crc32c-intel',
		module: 'crc32c_intel',
		priority: 200,
		refcnt: 3,
		selftest: 'passed',
		internal: false,
		type: 'shash',
		blocksize: 1,
		digestsize: 4,
	},
	{
		name: 'pkcs1pad(rsa,sha512)',
		driver: 'pkcs1pad(rsa-generic,sha512)',
		module: 'kernel',
		priority: 100,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'akcipher',
	},
	{
		name: 'hmac(sha256)',
		driver: 'hmac(sha256-generic)',
		module: 'kernel',
		priority: 100,
		refcnt: 5,
		selftest: 'passed',
		internal: false,
		type: 'shash',
		blocksize: 64,
		digestsize: 32,
	},
	{
		name: 'hmac(sha1)',
		driver: 'hmac(sha1-generic)',
		module: 'kernel',
		priority: 100,
		refcnt: 5,
		selftest: 'passed',
		internal: false,
		type: 'shash',
		blocksize: 64,
		digestsize: 20,
	},
	{
		name: 'zstd',
		driver: 'zstd-scomp',
		module: 'kernel',
		priority: 0,
		refcnt: 1,
		selftest: 'passed',
		internal: false,
		type: 'scomp',
	},
];
