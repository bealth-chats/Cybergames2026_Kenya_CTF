
sc.bin:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
   0:	d10043ff 	sub	sp, sp, #0x10
   4:	d286cdaa 	mov	x10, #0x366d                	// #13933
   8:	f2a645ea 	movk	x10, #0x322f, lsl #16
   c:	f2c4edaa 	movk	x10, #0x276d, lsl #32
  10:	f2e5668a 	movk	x10, #0x2b34, lsl #48
  14:	f90003ea 	str	x10, [sp]
  18:	d28d85ca 	mov	x10, #0x6c2e                	// #27694
  1c:	f2a5462a 	movk	x10, #0x2a31, lsl #16
  20:	f2c8484a 	movk	x10, #0x4242, lsl #32
  24:	f2e8484a 	movk	x10, #0x4242, lsl #48
  28:	f90007ea 	str	x10, [sp, #8]
  2c:	910003eb 	mov	x11, sp
  30:	d28001ac 	mov	x12, #0xd                   	// #13
  34:	d280084e 	mov	x14, #0x42                  	// #66
  38:	3940016d 	ldrb	w13, [x11]
  3c:	4a0e01ad 	eor	w13, w13, w14
  40:	3800156d 	strb	w13, [x11], #1
  44:	f100058c 	subs	x12, x12, #0x1
  48:	54ffff81 	b.ne	0x38  // b.any
  4c:	d29ff380 	mov	x0, #0xff9c                	// #65436
  50:	f2bfffe0 	movk	x0, #0xffff, lsl #16
  54:	f2dfffe0 	movk	x0, #0xffff, lsl #32
  58:	f2ffffe0 	movk	x0, #0xffff, lsl #48
  5c:	910003e1 	mov	x1, sp
  60:	d2804822 	mov	x2, #0x241                 	// #577
  64:	d2803da3 	mov	x3, #0x1ed                 	// #493
  68:	d2800708 	mov	x8, #0x38                  	// #56
  6c:	d4000001 	svc	#0x0
  70:	aa0003f3 	mov	x19, x0
  74:	d10183ff 	sub	sp, sp, #0x60
  78:	d28c6c2a 	mov	x10, #0x6361                	// #25441
  7c:	f2a40daa 	movk	x10, #0x206d, lsl #16
  80:	f2c5856a 	movk	x10, #0x2c2b, lsl #32
  84:	f2e40daa 	movk	x10, #0x206d, lsl #48
  88:	f90003ea 	str	x10, [sp]
  8c:	d286246a 	mov	x10, #0x3123                	// #12579
  90:	f2a9054a 	movk	x10, #0x482a, lsl #16
  94:	f2c6e42a 	movk	x10, #0x3721, lsl #32
  98:	f2e0202a 	movk	x10, #0x101, lsl #48
  9c:	aa1f03ee 	mov	x14, xzr
  a0:	f2e5e62e 	movk	x14, #0x2f31, lsl #48
  a4:	ca0a01ca 	eor	x10, x14, x10
  a8:	f90007ea 	str	x10, [sp, #8]
  ac:	d28dec4a 	mov	x10, #0x6f62                	// #28514
  b0:	f2ac462a 	movk	x10, #0x6231, lsl #16
  b4:	f2c54caa 	movk	x10, #0x2a65, lsl #32
  b8:	f2e6c6ca 	movk	x10, #0x3636, lsl #48
  bc:	f9000bea 	str	x10, [sp, #16]
  c0:	d28f064a 	mov	x10, #0x7832                	// #30770
  c4:	f2adadaa 	movk	x10, #0x6d6d, lsl #16
  c8:	f2c744ea 	movk	x10, #0x3a27, lsl #32
  cc:	f2ed864a 	movk	x10, #0x6c32, lsl #48
  d0:	f9000fea 	str	x10, [sp, #24]
  d4:	d287642a 	mov	x10, #0x3b21                	// #15137
  d8:	f2a0202a 	movk	x10, #0x101, lsl #16
  dc:	f2c0202a 	movk	x10, #0x101, lsl #32
  e0:	f2e5e46a 	movk	x10, #0x2f23, lsl #48
  e4:	aa1f03ee 	mov	x14, xzr
  e8:	f2a4c42e 	movk	x14, #0x2621, lsl #16
  ec:	f2c4862e 	movk	x14, #0x2431, lsl #32
  f0:	ca0a01ca 	eor	x10, x14, x10
  f4:	f90013ea 	str	x10, [sp, #32]
  f8:	d28d84ea 	mov	x10, #0x6c27                	// #27687
  fc:	f2a5262a 	movk	x10, #0x2931, lsl #16
 100:	f2c4adaa 	movk	x10, #0x256d, lsl #32
 104:	f2e6c46a 	movk	x10, #0x3623, lsl #48
 108:	f90017ea 	str	x10, [sp, #40]
 10c:	d28fa4ea 	mov	x10, #0x7d27                	// #32039
 110:	f2afe48a 	movk	x10, #0x7f24, lsl #16
 114:	f2c1222a 	movk	x10, #0x911, lsl #32
 118:	f2e02dea 	movk	x10, #0x16f, lsl #48
 11c:	f9001bea 	str	x10, [sp, #48]
 120:	d280202a 	mov	x10, #0x101                 	// #257
 124:	f2a722ca 	movk	x10, #0x3916, lsl #16
 128:	f2c0202a 	movk	x10, #0x101, lsl #32
 12c:	f2eeaeea 	movk	x10, #0x7577, lsl #48
 130:	d28220ce 	mov	x14, #0x1106                	// #4358
 134:	f2c6c62e 	movk	x14, #0x3631, lsl #32
 138:	ca0a01ca 	eor	x10, x14, x10
 13c:	f9001fea 	str	x10, [sp, #56]
 140:	d28e23aa 	mov	x10, #0x711d                	// #28957
 144:	f2ae274a 	movk	x10, #0x713a, lsl #16
 148:	f2c6e42a 	movk	x10, #0x3721, lsl #32
 14c:	f2ee4eaa 	movk	x10, #0x7275, lsl #48
 150:	f90023ea 	str	x10, [sp, #64]
 154:	d280202a 	mov	x10, #0x101                 	// #257
 158:	f2a48e4a 	movk	x10, #0x2472, lsl #16
 15c:	f2cee3aa 	movk	x10, #0x771d, lsl #32
 160:	f2ee654a 	movk	x10, #0x732a, lsl #48
 164:	d283862e 	mov	x14, #0x1c31                	// #7217
 168:	ca0a01ca 	eor	x10, x14, x10
 16c:	f90027ea 	str	x10, [sp, #72]
 170:	d28ea48a 	mov	x10, #0x7524                	// #29988
 174:	f2a4ce2a 	movk	x10, #0x2671, lsl #16
 178:	f2c643aa 	movk	x10, #0x321d, lsl #32
 17c:	f2e76eca 	movk	x10, #0x3b76, lsl #48
 180:	f9002bea 	str	x10, [sp, #80]
 184:	d28e45ca 	mov	x10, #0x722e                	// #29230
 188:	f2a4ceca 	movk	x10, #0x2676, lsl #16
 18c:	f2cca7ea 	movk	x10, #0x653f, lsl #32
 190:	f2e0202a 	movk	x10, #0x101, lsl #48
 194:	aa1f03ee 	mov	x14, xzr
 198:	f2e8692e 	movk	x14, #0x4349, lsl #48
 19c:	ca0a01ca 	eor	x10, x14, x10
 1a0:	f9002fea 	str	x10, [sp, #88]
 1a4:	910003eb 	mov	x11, sp
 1a8:	d2800c0c 	mov	x12, #0x60                  	// #96
 1ac:	d280084e 	mov	x14, #0x42                  	// #66
 1b0:	3940016d 	ldrb	w13, [x11]
 1b4:	4a0e01ad 	eor	w13, w13, w14
 1b8:	3800156d 	strb	w13, [x11], #1
 1bc:	f100058c 	subs	x12, x12, #0x1
 1c0:	54ffff81 	b.ne	0x1b0  // b.any
 1c4:	aa1303e0 	mov	x0, x19
 1c8:	910003e1 	mov	x1, sp
 1cc:	d2800be2 	mov	x2, #0x5f                  	// #95
 1d0:	d2800808 	mov	x8, #0x40                  	// #64
 1d4:	d4000001 	svc	#0x0
 1d8:	aa1303e0 	mov	x0, x19
 1dc:	d2800728 	mov	x8, #0x39                  	// #57
 1e0:	d4000001 	svc	#0x0
 1e4:	d100c3ff 	sub	sp, sp, #0x30
 1e8:	d285edaa 	mov	x10, #0x2f6d                	// #12141
 1ec:	f2a6c58a 	movk	x10, #0x362c, lsl #16
 1f0:	f2c54daa 	movk	x10, #0x2a6d, lsl #32
 1f4:	f2e484aa 	movk	x10, #0x2425, lsl #48
 1f8:	f90003ea 	str	x10, [sp]
 1fc:	d28da62a 	mov	x10, #0x6d31                	// #27953
 200:	f2a5462a 	movk	x10, #0x2a31, lsl #16
 204:	f2c6046a 	movk	x10, #0x3023, lsl #32
 208:	f2e4c4ea 	movk	x10, #0x2627, lsl #48
 20c:	f90007ea 	str	x10, [sp, #8]
 210:	d28d8daa 	mov	x10, #0x6c6d                	// #27757
 214:	f2adad8a 	movk	x10, #0x6d6c, lsl #16
 218:	f2cd8d8a 	movk	x10, #0x6c6c, lsl #32
 21c:	f2ed8daa 	movk	x10, #0x6c6d, lsl #48
 220:	f9000bea 	str	x10, [sp, #16]
 224:	d28dad8a 	mov	x10, #0x6d6c                	// #28012
 228:	f2a6c4ea 	movk	x10, #0x3627, lsl #16
 22c:	f2cda42a 	movk	x10, #0x6d21, lsl #32
 230:	f2e6042a 	movk	x10, #0x3021, lsl #48
 234:	f9000fea 	str	x10, [sp, #24]
 238:	d28585aa 	mov	x10, #0x2c2d                	// #11309
 23c:	f2a466ca 	movk	x10, #0x2336, lsl #16
 240:	f2c0202a 	movk	x10, #0x101, lsl #32
 244:	f2e8484a 	movk	x10, #0x4242, lsl #48
 248:	aa1f03ee 	mov	x14, xzr
 24c:	f2c8642e 	movk	x14, #0x4321, lsl #32
 250:	ca0a01ca 	eor	x10, x14, x10
 254:	f90013ea 	str	x10, [sp, #32]
 258:	910003eb 	mov	x11, sp
 25c:	d28004cc 	mov	x12, #0x26                  	// #38
 260:	d280084e 	mov	x14, #0x42                  	// #66
 264:	3940016d 	ldrb	w13, [x11]
 268:	4a0e01ad 	eor	w13, w13, w14
 26c:	3800156d 	strb	w13, [x11], #1
 270:	f100058c 	subs	x12, x12, #0x1
 274:	54ffff81 	b.ne	0x264  // b.any
 278:	d29ff380 	mov	x0, #0xff9c                	// #65436
 27c:	f2bfffe0 	movk	x0, #0xffff, lsl #16
 280:	f2dfffe0 	movk	x0, #0xffff, lsl #32
 284:	f2ffffe0 	movk	x0, #0xffff, lsl #48
 288:	910003e1 	mov	x1, sp
 28c:	d2808022 	mov	x2, #0x401                 	// #1025
 290:	d2800708 	mov	x8, #0x38                  	// #56
 294:	d4000001 	svc	#0x0
 298:	aa0003f3 	mov	x19, x0
 29c:	d100c3ff 	sub	sp, sp, #0x30
 2a0:	d280202a 	mov	x10, #0x101                 	// #257
 2a4:	f2ad0c4a 	movk	x10, #0x6862, lsl #16
 2a8:	f2cd0c4a 	movk	x10, #0x6862, lsl #32
 2ac:	f2ed0c4a 	movk	x10, #0x6862, lsl #48
 2b0:	d28d292e 	mov	x14, #0x6949                	// #26953
 2b4:	ca0a01ca 	eor	x10, x14, x10
 2b8:	f90003ea 	str	x10, [sp]
 2bc:	d28d0c4a 	mov	x10, #0x6862                	// #26722
 2c0:	f2a60c4a 	movk	x10, #0x3062, lsl #16
 2c4:	f2c5a5aa 	movk	x10, #0x2d2d, lsl #32
 2c8:	f2ec46ca 	movk	x10, #0x6236, lsl #48
 2cc:	f90007ea 	str	x10, [sp, #8]
 2d0:	d2840daa 	mov	x10, #0x206d                	// #8301
 2d4:	f2a5856a 	movk	x10, #0x2c2b, lsl #16
 2d8:	f2c40daa 	movk	x10, #0x206d, lsl #32
 2dc:	f2e6246a 	movk	x10, #0x3123, lsl #48
 2e0:	f9000bea 	str	x10, [sp, #16]
 2e4:	d28c454a 	mov	x10, #0x622a                	// #25130
 2e8:	f2a6cdaa 	movk	x10, #0x366d, lsl #16
 2ec:	f2c645ea 	movk	x10, #0x322f, lsl #32
 2f0:	f2e4edaa 	movk	x10, #0x276d, lsl #48
 2f4:	f9000fea 	str	x10, [sp, #24]
 2f8:	d285668a 	mov	x10, #0x2b34                	// #11060
 2fc:	f2ad85ca 	movk	x10, #0x6c2e, lsl #16
 300:	f2c5462a 	movk	x10, #0x2a31, lsl #32
 304:	f2e0202a 	movk	x10, #0x101, lsl #48
 308:	aa1f03ee 	mov	x14, xzr
 30c:	f2e8692e 	movk	x14, #0x4349, lsl #48
 310:	ca0a01ca 	eor	x10, x14, x10
 314:	f90013ea 	str	x10, [sp, #32]
 318:	910003eb 	mov	x11, sp
 31c:	d280050c 	mov	x12, #0x28                  	// #40
 320:	d280084e 	mov	x14, #0x42                  	// #66
 324:	3940016d 	ldrb	w13, [x11]
 328:	4a0e01ad 	eor	w13, w13, w14
 32c:	3800156d 	strb	w13, [x11], #1
 330:	f100058c 	subs	x12, x12, #0x1
 334:	54ffff81 	b.ne	0x324  // b.any
 338:	aa1303e0 	mov	x0, x19
 33c:	910003e1 	mov	x1, sp
 340:	d28004e2 	mov	x2, #0x27                  	// #39
 344:	d2800808 	mov	x8, #0x40                  	// #64
 348:	d4000001 	svc	#0x0
 34c:	aa1303e0 	mov	x0, x19
 350:	d2800728 	mov	x8, #0x39                  	// #57
 354:	d4000001 	svc	#0x0
 358:	d2800ba8 	mov	x8, #0x5d                  	// #93
 35c:	d4000001 	svc	#0x0
