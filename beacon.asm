
beacon:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 c1 5f 10 01 	mov    0x1105fc1(%rip),%rax        # 1106fd0 <__cxa_finalize@plt+0x1105f30>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <getenv@plt-0x1a>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <getenv@plt-0x10>:
    1020:	ff 35 ca 5f 10 01    	push   0x1105fca(%rip)        # 1106ff0 <__cxa_finalize@plt+0x1105f50>
    1026:	ff 25 cc 5f 10 01    	jmp    *0x1105fcc(%rip)        # 1106ff8 <__cxa_finalize@plt+0x1105f58>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <getenv@plt>:
    1030:	ff 25 ca 5f 10 01    	jmp    *0x1105fca(%rip)        # 1107000 <__cxa_finalize@plt+0x1105f60>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <getenv@plt-0x10>

0000000000001040 <clock_gettime@plt>:
    1040:	ff 25 c2 5f 10 01    	jmp    *0x1105fc2(%rip)        # 1107008 <__cxa_finalize@plt+0x1105f68>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <getenv@plt-0x10>

0000000000001050 <write@plt>:
    1050:	ff 25 ba 5f 10 01    	jmp    *0x1105fba(%rip)        # 1107010 <__cxa_finalize@plt+0x1105f70>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <getenv@plt-0x10>

0000000000001060 <getpid@plt>:
    1060:	ff 25 b2 5f 10 01    	jmp    *0x1105fb2(%rip)        # 1107018 <__cxa_finalize@plt+0x1105f78>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <getenv@plt-0x10>

0000000000001070 <memset@plt>:
    1070:	ff 25 aa 5f 10 01    	jmp    *0x1105faa(%rip)        # 1107020 <__cxa_finalize@plt+0x1105f80>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <getenv@plt-0x10>

0000000000001080 <syscall@plt>:
    1080:	ff 25 a2 5f 10 01    	jmp    *0x1105fa2(%rip)        # 1107028 <__cxa_finalize@plt+0x1105f88>
    1086:	68 05 00 00 00       	push   $0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <getenv@plt-0x10>

0000000000001090 <getrandom@plt>:
    1090:	ff 25 9a 5f 10 01    	jmp    *0x1105f9a(%rip)        # 1107030 <__cxa_finalize@plt+0x1105f90>
    1096:	68 06 00 00 00       	push   $0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <getenv@plt-0x10>

Disassembly of section .plt.got:

00000000000010a0 <__cxa_finalize@plt>:
    10a0:	ff 25 3a 5f 10 01    	jmp    *0x1105f3a(%rip)        # 1106fe0 <__cxa_finalize@plt+0x1105f40>
    10a6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000010b0 <.text>:
    10b0:	f3 0f 1e fa          	endbr64
    10b4:	31 ed                	xor    %ebp,%ebp
    10b6:	49 89 d1             	mov    %rdx,%r9
    10b9:	5e                   	pop    %rsi
    10ba:	48 89 e2             	mov    %rsp,%rdx
    10bd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10c1:	50                   	push   %rax
    10c2:	54                   	push   %rsp
    10c3:	45 31 c0             	xor    %r8d,%r8d
    10c6:	31 c9                	xor    %ecx,%ecx
    10c8:	48 8d 3d d1 00 00 00 	lea    0xd1(%rip),%rdi        # 11a0 <__cxa_finalize@plt+0x100>
    10cf:	ff 15 eb 5e 10 01    	call   *0x1105eeb(%rip)        # 1106fc0 <__cxa_finalize@plt+0x1105f20>
    10d5:	f4                   	hlt
    10d6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10dd:	00 00 00
    10e0:	48 8d 3d 39 61 10 01 	lea    0x1106139(%rip),%rdi        # 1107220 <__cxa_finalize@plt+0x1106180>
    10e7:	48 8d 05 32 61 10 01 	lea    0x1106132(%rip),%rax        # 1107220 <__cxa_finalize@plt+0x1106180>
    10ee:	48 39 f8             	cmp    %rdi,%rax
    10f1:	74 15                	je     1108 <__cxa_finalize@plt+0x68>
    10f3:	48 8b 05 ce 5e 10 01 	mov    0x1105ece(%rip),%rax        # 1106fc8 <__cxa_finalize@plt+0x1105f28>
    10fa:	48 85 c0             	test   %rax,%rax
    10fd:	74 09                	je     1108 <__cxa_finalize@plt+0x68>
    10ff:	ff e0                	jmp    *%rax
    1101:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1108:	c3                   	ret
    1109:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1110:	48 8d 3d 09 61 10 01 	lea    0x1106109(%rip),%rdi        # 1107220 <__cxa_finalize@plt+0x1106180>
    1117:	48 8d 35 02 61 10 01 	lea    0x1106102(%rip),%rsi        # 1107220 <__cxa_finalize@plt+0x1106180>
    111e:	48 29 fe             	sub    %rdi,%rsi
    1121:	48 89 f0             	mov    %rsi,%rax
    1124:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1128:	48 c1 f8 03          	sar    $0x3,%rax
    112c:	48 01 c6             	add    %rax,%rsi
    112f:	48 d1 fe             	sar    $1,%rsi
    1132:	74 14                	je     1148 <__cxa_finalize@plt+0xa8>
    1134:	48 8b 05 9d 5e 10 01 	mov    0x1105e9d(%rip),%rax        # 1106fd8 <__cxa_finalize@plt+0x1105f38>
    113b:	48 85 c0             	test   %rax,%rax
    113e:	74 08                	je     1148 <__cxa_finalize@plt+0xa8>
    1140:	ff e0                	jmp    *%rax
    1142:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1148:	c3                   	ret
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1150:	f3 0f 1e fa          	endbr64
    1154:	80 3d c1 60 10 01 00 	cmpb   $0x0,0x11060c1(%rip)        # 110721c <__cxa_finalize@plt+0x110617c>
    115b:	75 2b                	jne    1188 <__cxa_finalize@plt+0xe8>
    115d:	55                   	push   %rbp
    115e:	48 83 3d 7a 5e 10 01 	cmpq   $0x0,0x1105e7a(%rip)        # 1106fe0 <__cxa_finalize@plt+0x1105f40>
    1165:	00
    1166:	48 89 e5             	mov    %rsp,%rbp
    1169:	74 0c                	je     1177 <__cxa_finalize@plt+0xd7>
    116b:	48 8b 3d ce 5e 10 01 	mov    0x1105ece(%rip),%rdi        # 1107040 <__cxa_finalize@plt+0x1105fa0>
    1172:	e8 29 ff ff ff       	call   10a0 <__cxa_finalize@plt>
    1177:	e8 64 ff ff ff       	call   10e0 <__cxa_finalize@plt+0x40>
    117c:	c6 05 99 60 10 01 01 	movb   $0x1,0x1106099(%rip)        # 110721c <__cxa_finalize@plt+0x110617c>
    1183:	5d                   	pop    %rbp
    1184:	c3                   	ret
    1185:	0f 1f 00             	nopl   (%rax)
    1188:	c3                   	ret
    1189:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1190:	f3 0f 1e fa          	endbr64
    1194:	e9 77 ff ff ff       	jmp    1110 <__cxa_finalize@plt+0x70>
    1199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    11a0:	8b 05 a6 5e 10 01    	mov    0x1105ea6(%rip),%eax        # 110704c <__cxa_finalize@plt+0x1105fac>
    11a6:	8d 48 01             	lea    0x1(%rax),%ecx
    11a9:	0f af c8             	imul   %eax,%ecx
    11ac:	f6 c1 01             	test   $0x1,%cl
    11af:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 11dc <__cxa_finalize@plt+0x13c>
    11b6:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 11c3 <__cxa_finalize@plt+0x123>
    11bd:	48 0f 44 c8          	cmove  %rax,%rcx
    11c1:	ff e1                	jmp    *%rcx
    11c3:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    11c8:	33 05 82 5e 10 01    	xor    0x1105e82(%rip),%eax        # 1107050 <__cxa_finalize@plt+0x1105fb0>
    11ce:	8d 04 40             	lea    (%rax,%rax,2),%eax
    11d1:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    11d6:	89 05 74 5e 10 01    	mov    %eax,0x1105e74(%rip)        # 1107050 <__cxa_finalize@plt+0x1105fb0>
    11dc:	55                   	push   %rbp
    11dd:	41 57                	push   %r15
    11df:	41 56                	push   %r14
    11e1:	53                   	push   %rbx
    11e2:	48 81 ec 68 01 00 00 	sub    $0x168,%rsp
    11e9:	e8 12 01 00 00       	call   1300 <__cxa_finalize@plt+0x260>
    11ee:	89 c5                	mov    %eax,%ebp
    11f0:	e8 6b 01 00 00       	call   1360 <__cxa_finalize@plt+0x2c0>
    11f5:	41 89 c7             	mov    %eax,%r15d
    11f8:	e8 63 02 00 00       	call   1460 <__cxa_finalize@plt+0x3c0>
    11fd:	41 89 c6             	mov    %eax,%r14d
    1200:	0f b7 dd             	movzwl %bp,%ebx
    1203:	89 df                	mov    %ebx,%edi
    1205:	e8 b6 02 00 00       	call   14c0 <__cxa_finalize@plt+0x420>
    120a:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
    120f:	89 de                	mov    %ebx,%esi
    1211:	e8 1a 05 00 00       	call   1730 <__cxa_finalize@plt+0x690>
    1216:	45 09 fe             	or     %r15d,%r14d
    1219:	48 8d 05 19 00 00 00 	lea    0x19(%rip),%rax        # 1239 <__cxa_finalize@plt+0x199>
    1220:	48 8d 0d 2c 00 00 00 	lea    0x2c(%rip),%rcx        # 1253 <__cxa_finalize@plt+0x1b3>
    1227:	48 0f 45 c8          	cmovne %rax,%rcx
    122b:	83 bc 24 60 01 00 00 	cmpl   $0x0,0x160(%rsp)
    1232:	00
    1233:	48 0f 44 c8          	cmove  %rax,%rcx
    1237:	ff e1                	jmp    *%rcx
    1239:	41 69 d6 a5 a5 a5 a5 	imul   $0xa5a5a5a5,%r14d,%edx
    1240:	33 94 24 4c 01 00 00 	xor    0x14c(%rsp),%edx
    1247:	48 89 e7             	mov    %rsp,%rdi
    124a:	89 de                	mov    %ebx,%esi
    124c:	e8 6f 07 00 00       	call   19c0 <__cxa_finalize@plt+0x920>
    1251:	eb 40                	jmp    1293 <__cxa_finalize@plt+0x1f3>
    1253:	48 8b 84 24 22 01 00 	mov    0x122(%rsp),%rax
    125a:	00
    125b:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    1260:	0f 10 84 24 e2 00 00 	movups 0xe2(%rsp),%xmm0
    1267:	00
    1268:	0f 10 8c 24 f2 00 00 	movups 0xf2(%rsp),%xmm1
    126f:	00
    1270:	0f 10 94 24 02 01 00 	movups 0x102(%rsp),%xmm2
    1277:	00
    1278:	0f 10 9c 24 12 01 00 	movups 0x112(%rsp),%xmm3
    127f:	00
    1280:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
    1285:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
    128a:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
    128f:	0f 29 04 24          	movaps %xmm0,(%rsp)
    1293:	0f b7 84 24 4c 01 00 	movzwl 0x14c(%rsp),%eax
    129a:	00
    129b:	66 31 e8             	xor    %bp,%ax
    129e:	0f b7 f8             	movzwl %ax,%edi
    12a1:	e8 da 09 00 00       	call   1c80 <__cxa_finalize@plt+0xbe0>
    12a6:	0f b7 8c 24 4e 01 00 	movzwl 0x14e(%rsp),%ecx
    12ad:	00
    12ae:	66 31 e9             	xor    %bp,%cx
    12b1:	0f b7 f1             	movzwl %cx,%esi
    12b4:	49 89 e6             	mov    %rsp,%r14
    12b7:	4c 89 f7             	mov    %r14,%rdi
    12ba:	89 c2                	mov    %eax,%edx
    12bc:	e8 9f 0a 00 00       	call   1d60 <__cxa_finalize@plt+0xcc0>
    12c1:	8b 0d 81 5d 10 01    	mov    0x1105d81(%rip),%ecx        # 1107048 <__cxa_finalize@plt+0x1105fa8>
    12c7:	c1 e1 04             	shl    $0x4,%ecx
    12ca:	d3 e3                	shl    %cl,%ebx
    12cc:	31 1d 76 5d 10 01    	xor    %ebx,0x1105d76(%rip)        # 1107048 <__cxa_finalize@plt+0x1105fa8>
    12d2:	ba 48 00 00 00       	mov    $0x48,%edx
    12d7:	bf 01 00 00 00       	mov    $0x1,%edi
    12dc:	4c 89 f6             	mov    %r14,%rsi
    12df:	e8 6c fd ff ff       	call   1050 <write@plt>
    12e4:	31 c0                	xor    %eax,%eax
    12e6:	48 81 c4 68 01 00 00 	add    $0x168,%rsp
    12ed:	5b                   	pop    %rbx
    12ee:	41 5e                	pop    %r14
    12f0:	41 5f                	pop    %r15
    12f2:	5d                   	pop    %rbp
    12f3:	c3                   	ret
    12f4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    12fb:	00 00 00 00 00
    1300:	8b 05 4e 5d 10 01    	mov    0x1105d4e(%rip),%eax        # 1107054 <__cxa_finalize@plt+0x1105fb4>
    1306:	8d 48 01             	lea    0x1(%rax),%ecx
    1309:	0f af c8             	imul   %eax,%ecx
    130c:	f6 c1 01             	test   $0x1,%cl
    130f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 133c <__cxa_finalize@plt+0x29c>
    1316:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 1323 <__cxa_finalize@plt+0x283>
    131d:	48 0f 44 c8          	cmove  %rax,%rcx
    1321:	ff e1                	jmp    *%rcx
    1323:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    1328:	33 05 2a 5d 10 01    	xor    0x1105d2a(%rip),%eax        # 1107058 <__cxa_finalize@plt+0x1105fb8>
    132e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1331:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1336:	89 05 1c 5d 10 01    	mov    %eax,0x1105d1c(%rip)        # 1107058 <__cxa_finalize@plt+0x1105fb8>
    133c:	50                   	push   %rax
    133d:	bf 27 00 00 00       	mov    $0x27,%edi
    1342:	31 c0                	xor    %eax,%eax
    1344:	e8 37 fd ff ff       	call   1080 <syscall@plt>
    1349:	66 85 c0             	test   %ax,%ax
    134c:	b9 01 00 00 00       	mov    $0x1,%ecx
    1351:	0f 44 c1             	cmove  %ecx,%eax
    1354:	59                   	pop    %rcx
    1355:	c3                   	ret
    1356:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    135d:	00 00 00
    1360:	8b 05 f6 5c 10 01    	mov    0x1105cf6(%rip),%eax        # 110705c <__cxa_finalize@plt+0x1105fbc>
    1366:	8d 48 01             	lea    0x1(%rax),%ecx
    1369:	0f af c8             	imul   %eax,%ecx
    136c:	f6 c1 01             	test   $0x1,%cl
    136f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 139c <__cxa_finalize@plt+0x2fc>
    1376:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 1383 <__cxa_finalize@plt+0x2e3>
    137d:	48 0f 44 c8          	cmove  %rax,%rcx
    1381:	ff e1                	jmp    *%rcx
    1383:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    1388:	33 05 d2 5c 10 01    	xor    0x1105cd2(%rip),%eax        # 1107060 <__cxa_finalize@plt+0x1105fc0>
    138e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1391:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1396:	89 05 c4 5c 10 01    	mov    %eax,0x1105cc4(%rip)        # 1107060 <__cxa_finalize@plt+0x1105fc0>
    139c:	41 56                	push   %r14
    139e:	53                   	push   %rbx
    139f:	50                   	push   %rax
    13a0:	48 8d 3d 41 40 10 01 	lea    0x1104041(%rip),%rdi        # 11053e8 <__cxa_finalize@plt+0x1104348>
    13a7:	e8 84 fc ff ff       	call   1030 <getenv@plt>
    13ac:	49 89 c6             	mov    %rax,%r14
    13af:	48 8d 3d 3d 40 10 01 	lea    0x110403d(%rip),%rdi        # 11053f3 <__cxa_finalize@plt+0x1104353>
    13b6:	e8 75 fc ff ff       	call   1030 <getenv@plt>
    13bb:	48 89 c3             	mov    %rax,%rbx
    13be:	48 8d 3d 37 40 10 01 	lea    0x1104037(%rip),%rdi        # 11053fc <__cxa_finalize@plt+0x110435c>
    13c5:	e8 66 fc ff ff       	call   1030 <getenv@plt>
    13ca:	4d 85 f6             	test   %r14,%r14
    13cd:	48 8d 0d 23 00 00 00 	lea    0x23(%rip),%rcx        # 13f7 <__cxa_finalize@plt+0x357>
    13d4:	48 8d 15 06 00 00 00 	lea    0x6(%rip),%rdx        # 13e1 <__cxa_finalize@plt+0x341>
    13db:	48 0f 44 d1          	cmove  %rcx,%rdx
    13df:	ff e2                	jmp    *%rdx
    13e1:	41 80 3e 00          	cmpb   $0x0,(%r14)
    13e5:	48 8d 15 65 00 00 00 	lea    0x65(%rip),%rdx        # 1451 <__cxa_finalize@plt+0x3b1>
    13ec:	48 0f 44 d1          	cmove  %rcx,%rdx
    13f0:	b9 01 00 00 00       	mov    $0x1,%ecx
    13f5:	ff e2                	jmp    *%rdx
    13f7:	48 85 db             	test   %rbx,%rbx
    13fa:	48 8d 0d 22 00 00 00 	lea    0x22(%rip),%rcx        # 1423 <__cxa_finalize@plt+0x383>
    1401:	48 8d 15 06 00 00 00 	lea    0x6(%rip),%rdx        # 140e <__cxa_finalize@plt+0x36e>
    1408:	48 0f 44 d1          	cmove  %rcx,%rdx
    140c:	ff e2                	jmp    *%rdx
    140e:	80 3b 00             	cmpb   $0x0,(%rbx)
    1411:	48 8d 15 39 00 00 00 	lea    0x39(%rip),%rdx        # 1451 <__cxa_finalize@plt+0x3b1>
    1418:	48 0f 44 d1          	cmove  %rcx,%rdx
    141c:	b9 01 00 00 00       	mov    $0x1,%ecx
    1421:	ff e2                	jmp    *%rdx
    1423:	48 85 c0             	test   %rax,%rax
    1426:	48 8d 0d 22 00 00 00 	lea    0x22(%rip),%rcx        # 144f <__cxa_finalize@plt+0x3af>
    142d:	48 8d 15 06 00 00 00 	lea    0x6(%rip),%rdx        # 143a <__cxa_finalize@plt+0x39a>
    1434:	48 0f 44 d1          	cmove  %rcx,%rdx
    1438:	ff e2                	jmp    *%rdx
    143a:	80 38 00             	cmpb   $0x0,(%rax)
    143d:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # 1451 <__cxa_finalize@plt+0x3b1>
    1444:	48 0f 44 c1          	cmove  %rcx,%rax
    1448:	b9 01 00 00 00       	mov    $0x1,%ecx
    144d:	ff e0                	jmp    *%rax
    144f:	31 c9                	xor    %ecx,%ecx
    1451:	89 c8                	mov    %ecx,%eax
    1453:	48 83 c4 08          	add    $0x8,%rsp
    1457:	5b                   	pop    %rbx
    1458:	41 5e                	pop    %r14
    145a:	c3                   	ret
    145b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1460:	8b 05 fe 5b 10 01    	mov    0x1105bfe(%rip),%eax        # 1107064 <__cxa_finalize@plt+0x1105fc4>
    1466:	8d 48 01             	lea    0x1(%rax),%ecx
    1469:	0f af c8             	imul   %eax,%ecx
    146c:	f6 c1 01             	test   $0x1,%cl
    146f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 149c <__cxa_finalize@plt+0x3fc>
    1476:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 1483 <__cxa_finalize@plt+0x3e3>
    147d:	48 0f 44 c8          	cmove  %rax,%rcx
    1481:	ff e1                	jmp    *%rcx
    1483:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    1488:	33 05 da 5b 10 01    	xor    0x1105bda(%rip),%eax        # 1107068 <__cxa_finalize@plt+0x1105fc8>
    148e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1491:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1496:	89 05 cc 5b 10 01    	mov    %eax,0x1105bcc(%rip)        # 1107068 <__cxa_finalize@plt+0x1105fc8>
    149c:	53                   	push   %rbx
    149d:	e8 be fb ff ff       	call   1060 <getpid@plt>
    14a2:	89 c3                	mov    %eax,%ebx
    14a4:	bf 27 00 00 00       	mov    $0x27,%edi
    14a9:	31 c0                	xor    %eax,%eax
    14ab:	e8 d0 fb ff ff       	call   1080 <syscall@plt>
    14b0:	48 63 d3             	movslq %ebx,%rdx
    14b3:	31 c9                	xor    %ecx,%ecx
    14b5:	48 39 d0             	cmp    %rdx,%rax
    14b8:	0f 95 c1             	setne  %cl
    14bb:	89 c8                	mov    %ecx,%eax
    14bd:	5b                   	pop    %rbx
    14be:	c3                   	ret
    14bf:	90                   	nop
    14c0:	55                   	push   %rbp
    14c1:	41 57                	push   %r15
    14c3:	41 56                	push   %r14
    14c5:	41 55                	push   %r13
    14c7:	41 54                	push   %r12
    14c9:	53                   	push   %rbx
    14ca:	50                   	push   %rax
    14cb:	8b 05 9b 5b 10 01    	mov    0x1105b9b(%rip),%eax        # 110706c <__cxa_finalize@plt+0x1105fcc>
    14d1:	8d 48 01             	lea    0x1(%rax),%ecx
    14d4:	0f af c8             	imul   %eax,%ecx
    14d7:	f6 c1 01             	test   $0x1,%cl
    14da:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 1507 <__cxa_finalize@plt+0x467>
    14e1:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 14ee <__cxa_finalize@plt+0x44e>
    14e8:	48 0f 44 c8          	cmove  %rax,%rcx
    14ec:	ff e1                	jmp    *%rcx
    14ee:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    14f3:	33 05 77 5b 10 01    	xor    0x1105b77(%rip),%eax        # 1107070 <__cxa_finalize@plt+0x1105fd0>
    14f9:	8d 04 40             	lea    (%rax,%rax,2),%eax
    14fc:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1501:	89 05 69 5b 10 01    	mov    %eax,0x1105b69(%rip)        # 1107070 <__cxa_finalize@plt+0x1105fd0>
    1507:	0f b7 ef             	movzwl %di,%ebp
    150a:	89 e8                	mov    %ebp,%eax
    150c:	c1 e0 10             	shl    $0x10,%eax
    150f:	81 f5 de c0 ad 0b    	xor    $0xbadc0de,%ebp
    1515:	09 c5                	or     %eax,%ebp
    1517:	45 31 f6             	xor    %r14d,%r14d
    151a:	bb 03 00 00 00       	mov    $0x3,%ebx
    151f:	4c 8d 25 4a 00 00 00 	lea    0x4a(%rip),%r12        # 1570 <__cxa_finalize@plt+0x4d0>
    1526:	4c 8d 2d f3 3a 10 01 	lea    0x1103af3(%rip),%r13        # 1105020 <__cxa_finalize@plt+0x1103f80>
    152d:	45 31 ff             	xor    %r15d,%r15d
    1530:	eb 3e                	jmp    1570 <__cxa_finalize@plt+0x4d0>
    1532:	35 a5 a5 a5 a5       	xor    $0xa5a5a5a5,%eax
    1537:	01 e8                	add    %ebp,%eax
    1539:	89 c7                	mov    %eax,%edi
    153b:	be 0b 00 00 00       	mov    $0xb,%esi
    1540:	e8 6b 0a 00 00       	call   1fb0 <__cxa_finalize@plt+0xf10>
    1545:	89 c5                	mov    %eax,%ebp
    1547:	41 81 ff 7f 01 00 00 	cmp    $0x17f,%r15d
    154e:	4c 89 e0             	mov    %r12,%rax
    1551:	48 8d 0d bc 01 00 00 	lea    0x1bc(%rip),%rcx        # 1714 <__cxa_finalize@plt+0x674>
    1558:	48 0f 44 c1          	cmove  %rcx,%rax
    155c:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    1560:	41 81 c6 37 9e 00 00 	add    $0x9e37,%r14d
    1567:	83 c3 07             	add    $0x7,%ebx
    156a:	41 89 cf             	mov    %ecx,%r15d
    156d:	ff e0                	jmp    *%rax
    156f:	90                   	nop
    1570:	89 ef                	mov    %ebp,%edi
    1572:	44 31 ff             	xor    %r15d,%edi
    1575:	44 89 fa             	mov    %r15d,%edx
    1578:	83 e2 0f             	and    $0xf,%edx
    157b:	89 de                	mov    %ebx,%esi
    157d:	e8 ce 08 00 00       	call   1e50 <__cxa_finalize@plt+0xdb0>
    1582:	89 c7                	mov    %eax,%edi
    1584:	31 ef                	xor    %ebp,%edi
    1586:	89 f9                	mov    %edi,%ecx
    1588:	44 31 f9             	xor    %r15d,%ecx
    158b:	83 e1 07             	and    $0x7,%ecx
    158e:	83 f9 06             	cmp    $0x6,%ecx
    1591:	0f 87 ab 00 00 00    	ja     1642 <__cxa_finalize@plt+0x5a2>
    1597:	49 63 4c 8d 00       	movslq 0x0(%r13,%rcx,4),%rcx
    159c:	4c 01 e9             	add    %r13,%rcx
    159f:	ff e1                	jmp    *%rcx
    15a1:	44 89 fe             	mov    %r15d,%esi
    15a4:	83 e6 1f             	and    $0x1f,%esi
    15a7:	e8 04 0a 00 00       	call   1fb0 <__cxa_finalize@plt+0xf10>
    15ac:	89 c5                	mov    %eax,%ebp
    15ae:	41 81 ff 7f 01 00 00 	cmp    $0x17f,%r15d
    15b5:	4c 89 e0             	mov    %r12,%rax
    15b8:	48 8d 0d 55 01 00 00 	lea    0x155(%rip),%rcx        # 1714 <__cxa_finalize@plt+0x674>
    15bf:	48 0f 44 c1          	cmove  %rcx,%rax
    15c3:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    15c7:	41 81 c6 37 9e 00 00 	add    $0x9e37,%r14d
    15ce:	83 c3 07             	add    $0x7,%ebx
    15d1:	41 89 cf             	mov    %ecx,%r15d
    15d4:	ff e0                	jmp    *%rax
    15d6:	89 ee                	mov    %ebp,%esi
    15d8:	c1 ee 03             	shr    $0x3,%esi
    15db:	83 e6 1f             	and    $0x1f,%esi
    15de:	89 c7                	mov    %eax,%edi
    15e0:	e8 cb 09 00 00       	call   1fb0 <__cxa_finalize@plt+0xf10>
    15e5:	31 c5                	xor    %eax,%ebp
    15e7:	41 81 ff 7f 01 00 00 	cmp    $0x17f,%r15d
    15ee:	4c 89 e0             	mov    %r12,%rax
    15f1:	48 8d 0d 1c 01 00 00 	lea    0x11c(%rip),%rcx        # 1714 <__cxa_finalize@plt+0x674>
    15f8:	48 0f 44 c1          	cmove  %rcx,%rax
    15fc:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    1600:	41 81 c6 37 9e 00 00 	add    $0x9e37,%r14d
    1607:	83 c3 07             	add    $0x7,%ebx
    160a:	41 89 cf             	mov    %ecx,%r15d
    160d:	ff e0                	jmp    *%rax
    160f:	69 c0 3b 9f 5d 04    	imul   $0x45d9f3b,%eax,%eax
    1615:	44 31 f0             	xor    %r14d,%eax
    1618:	01 c5                	add    %eax,%ebp
    161a:	41 81 ff 7f 01 00 00 	cmp    $0x17f,%r15d
    1621:	4c 89 e0             	mov    %r12,%rax
    1624:	48 8d 0d e9 00 00 00 	lea    0xe9(%rip),%rcx        # 1714 <__cxa_finalize@plt+0x674>
    162b:	48 0f 44 c1          	cmove  %rcx,%rax
    162f:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    1633:	41 81 c6 37 9e 00 00 	add    $0x9e37,%r14d
    163a:	83 c3 07             	add    $0x7,%ebx
    163d:	41 89 cf             	mov    %ecx,%r15d
    1640:	ff e0                	jmp    *%rax
    1642:	05 de c0 ad de       	add    $0xdeadc0de,%eax
    1647:	31 e8                	xor    %ebp,%eax
    1649:	89 c7                	mov    %eax,%edi
    164b:	be 11 00 00 00       	mov    $0x11,%esi
    1650:	e8 5b 09 00 00       	call   1fb0 <__cxa_finalize@plt+0xf10>
    1655:	89 c5                	mov    %eax,%ebp
    1657:	41 81 ff 7f 01 00 00 	cmp    $0x17f,%r15d
    165e:	4c 89 e0             	mov    %r12,%rax
    1661:	48 8d 0d ac 00 00 00 	lea    0xac(%rip),%rcx        # 1714 <__cxa_finalize@plt+0x674>
    1668:	48 0f 44 c1          	cmove  %rcx,%rax
    166c:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    1670:	41 81 c6 37 9e 00 00 	add    $0x9e37,%r14d
    1677:	83 c3 07             	add    $0x7,%ebx
    167a:	41 89 cf             	mov    %ecx,%r15d
    167d:	ff e0                	jmp    *%rax
    167f:	01 c5                	add    %eax,%ebp
    1681:	44 89 f9             	mov    %r15d,%ecx
    1684:	80 e1 07             	and    $0x7,%cl
    1687:	fe c1                	inc    %cl
    1689:	d3 e8                	shr    %cl,%eax
    168b:	31 c5                	xor    %eax,%ebp
    168d:	41 81 ff 7f 01 00 00 	cmp    $0x17f,%r15d
    1694:	4c 89 e0             	mov    %r12,%rax
    1697:	48 8d 0d 76 00 00 00 	lea    0x76(%rip),%rcx        # 1714 <__cxa_finalize@plt+0x674>
    169e:	48 0f 44 c1          	cmove  %rcx,%rax
    16a2:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    16a6:	41 81 c6 37 9e 00 00 	add    $0x9e37,%r14d
    16ad:	83 c3 07             	add    $0x7,%ebx
    16b0:	41 89 cf             	mov    %ecx,%r15d
    16b3:	ff e0                	jmp    *%rax
    16b5:	44 01 f8             	add    %r15d,%eax
    16b8:	69 c0 21 10 00 00    	imul   $0x1021,%eax,%eax
    16be:	31 c5                	xor    %eax,%ebp
    16c0:	41 81 ff 7f 01 00 00 	cmp    $0x17f,%r15d
    16c7:	4c 89 e0             	mov    %r12,%rax
    16ca:	48 8d 0d 43 00 00 00 	lea    0x43(%rip),%rcx        # 1714 <__cxa_finalize@plt+0x674>
    16d1:	48 0f 44 c1          	cmove  %rcx,%rax
    16d5:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    16d9:	41 81 c6 37 9e 00 00 	add    $0x9e37,%r14d
    16e0:	83 c3 07             	add    $0x7,%ebx
    16e3:	41 89 cf             	mov    %ecx,%r15d
    16e6:	ff e0                	jmp    *%rax
    16e8:	d1 cd                	ror    $1,%ebp
    16ea:	31 c5                	xor    %eax,%ebp
    16ec:	41 81 ff 7f 01 00 00 	cmp    $0x17f,%r15d
    16f3:	4c 89 e0             	mov    %r12,%rax
    16f6:	48 8d 0d 17 00 00 00 	lea    0x17(%rip),%rcx        # 1714 <__cxa_finalize@plt+0x674>
    16fd:	48 0f 44 c1          	cmove  %rcx,%rax
    1701:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    1705:	41 81 c6 37 9e 00 00 	add    $0x9e37,%r14d
    170c:	83 c3 07             	add    $0x7,%ebx
    170f:	41 89 cf             	mov    %ecx,%r15d
    1712:	ff e0                	jmp    *%rax
    1714:	31 2d 2e 59 10 01    	xor    %ebp,0x110592e(%rip)        # 1107048 <__cxa_finalize@plt+0x1105fa8>
    171a:	48 83 c4 08          	add    $0x8,%rsp
    171e:	5b                   	pop    %rbx
    171f:	41 5c                	pop    %r12
    1721:	41 5d                	pop    %r13
    1723:	41 5e                	pop    %r14
    1725:	41 5f                	pop    %r15
    1727:	5d                   	pop    %rbp
    1728:	c3                   	ret
    1729:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1730:	55                   	push   %rbp
    1731:	41 57                	push   %r15
    1733:	41 56                	push   %r14
    1735:	41 55                	push   %r13
    1737:	41 54                	push   %r12
    1739:	53                   	push   %rbx
    173a:	50                   	push   %rax
    173b:	89 f5                	mov    %esi,%ebp
    173d:	48 89 fb             	mov    %rdi,%rbx
    1740:	8b 05 2e 59 10 01    	mov    0x110592e(%rip),%eax        # 1107074 <__cxa_finalize@plt+0x1105fd4>
    1746:	8d 48 01             	lea    0x1(%rax),%ecx
    1749:	0f af c8             	imul   %eax,%ecx
    174c:	f6 c1 01             	test   $0x1,%cl
    174f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 177c <__cxa_finalize@plt+0x6dc>
    1756:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 1763 <__cxa_finalize@plt+0x6c3>
    175d:	48 0f 44 c8          	cmove  %rax,%rcx
    1761:	ff e1                	jmp    *%rcx
    1763:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    1768:	33 05 0a 59 10 01    	xor    0x110590a(%rip),%eax        # 1107078 <__cxa_finalize@plt+0x1105fd8>
    176e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1771:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1776:	89 05 fc 58 10 01    	mov    %eax,0x11058fc(%rip)        # 1107078 <__cxa_finalize@plt+0x1105fd8>
    177c:	45 31 ff             	xor    %r15d,%r15d
    177f:	ba 1c 01 00 00       	mov    $0x11c,%edx
    1784:	48 89 df             	mov    %rbx,%rdi
    1787:	31 f6                	xor    %esi,%esi
    1789:	e8 e2 f8 ff ff       	call   1070 <memset@plt>
    178e:	66 83 fd 02          	cmp    $0x2,%bp
    1792:	b8 01 00 00 00       	mov    $0x1,%eax
    1797:	0f 43 c5             	cmovae %ebp,%eax
    179a:	66 89 03             	mov    %ax,(%rbx)
    179d:	0f b7 f0             	movzwl %ax,%esi
    17a0:	35 a5 c3 00 00       	xor    $0xc3a5,%eax
    17a5:	66 83 f8 01          	cmp    $0x1,%ax
    17a9:	83 d0 00             	adc    $0x0,%eax
    17ac:	66 89 43 02          	mov    %ax,0x2(%rbx)
    17b0:	66 c7 43 04 04 a4    	movw   $0xa404,0x4(%rbx)
    17b6:	c6 83 fe 00 00 00 42 	movb   $0x42,0xfe(%rbx)
    17bd:	4c 8d b3 de 00 00 00 	lea    0xde(%rbx),%r14
    17c4:	4c 89 f7             	mov    %r14,%rdi
    17c7:	e8 04 12 00 00       	call   29d0 <__cxa_finalize@plt+0x1930>
    17cc:	48 8d bb ee 00 00 00 	lea    0xee(%rbx),%rdi
    17d3:	0f b7 33             	movzwl (%rbx),%esi
    17d6:	4c 89 f2             	mov    %r14,%rdx
    17d9:	e8 e2 12 00 00       	call   2ac0 <__cxa_finalize@plt+0x1a20>
    17de:	0f b7 03             	movzwl (%rbx),%eax
    17e1:	83 e0 0f             	and    $0xf,%eax
    17e4:	48 83 f0 0a          	xor    $0xa,%rax
    17e8:	0f b6 84 03 ee 00 00 	movzbl 0xee(%rbx,%rax,1),%eax
    17ef:	00
    17f0:	83 f8 05             	cmp    $0x5,%eax
    17f3:	89 83 18 01 00 00    	mov    %eax,0x118(%rbx)
    17f9:	4c 8d 35 8c 01 00 00 	lea    0x18c(%rip),%r14        # 198c <__cxa_finalize@plt+0x8ec>
    1800:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 180d <__cxa_finalize@plt+0x76d>
    1807:	49 0f 44 ce          	cmove  %r14,%rcx
    180b:	ff e1                	jmp    *%rcx
    180d:	4c 8d 2d 0c 01 00 00 	lea    0x10c(%rip),%r13        # 1920 <__cxa_finalize@plt+0x880>
    1814:	4c 8d 25 31 00 00 00 	lea    0x31(%rip),%r12        # 184c <__cxa_finalize@plt+0x7ac>
    181b:	eb 2f                	jmp    184c <__cxa_finalize@plt+0x7ac>
    181d:	0f 1f 00             	nopl   (%rax)
    1820:	85 f6                	test   %esi,%esi
    1822:	0f 85 23 01 00 00    	jne    194b <__cxa_finalize@plt+0x8ab>
    1828:	48 89 df             	mov    %rbx,%rdi
    182b:	e8 90 13 00 00       	call   2bc0 <__cxa_finalize@plt+0x1b20>
    1830:	83 f8 05             	cmp    $0x5,%eax
    1833:	4c 89 f1             	mov    %r14,%rcx
    1836:	49 0f 45 cc          	cmovne %r12,%rcx
    183a:	89 83 18 01 00 00    	mov    %eax,0x118(%rbx)
    1840:	81 fd ff 11 00 00    	cmp    $0x11ff,%ebp
    1846:	49 0f 43 ce          	cmovae %r14,%rcx
    184a:	ff e1                	jmp    *%rcx
    184c:	44 89 fd             	mov    %r15d,%ebp
    184f:	44 8d 7d 01          	lea    0x1(%rbp),%r15d
    1853:	8b 3b                	mov    (%rbx),%edi
    1855:	c1 e7 10             	shl    $0x10,%edi
    1858:	09 c7                	or     %eax,%edi
    185a:	8b b3 0c 01 00 00    	mov    0x10c(%rbx),%esi
    1860:	44 01 fe             	add    %r15d,%esi
    1863:	ba 04 00 00 00       	mov    $0x4,%edx
    1868:	e8 e3 05 00 00       	call   1e50 <__cxa_finalize@plt+0xdb0>
    186d:	8b b3 18 01 00 00    	mov    0x118(%rbx),%esi
    1873:	8d 46 ff             	lea    -0x1(%rsi),%eax
    1876:	83 f8 03             	cmp    $0x3,%eax
    1879:	73 a5                	jae    1820 <__cxa_finalize@plt+0x780>
    187b:	48 89 df             	mov    %rbx,%rdi
    187e:	e8 8d 13 00 00       	call   2c10 <__cxa_finalize@plt+0x1b70>
    1883:	85 c0                	test   %eax,%eax
    1885:	4c 89 e8             	mov    %r13,%rax
    1888:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 1895 <__cxa_finalize@plt+0x7f5>
    188f:	48 0f 44 c1          	cmove  %rcx,%rax
    1893:	ff e0                	jmp    *%rax
    1895:	83 bb 0c 01 00 00 48 	cmpl   $0x48,0x10c(%rbx)
    189c:	48 8d 0d 12 00 00 00 	lea    0x12(%rip),%rcx        # 18b5 <__cxa_finalize@plt+0x815>
    18a3:	48 8d 05 86 ff ff ff 	lea    -0x7a(%rip),%rax        # 1830 <__cxa_finalize@plt+0x790>
    18aa:	48 0f 44 c8          	cmove  %rax,%rcx
    18ae:	b8 04 00 00 00       	mov    $0x4,%eax
    18b3:	ff e1                	jmp    *%rcx
    18b5:	48 89 df             	mov    %rbx,%rdi
    18b8:	be 01 00 00 00       	mov    $0x1,%esi
    18bd:	e8 4e 13 00 00       	call   2c10 <__cxa_finalize@plt+0x1b70>
    18c2:	85 c0                	test   %eax,%eax
    18c4:	4c 89 e8             	mov    %r13,%rax
    18c7:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 18d4 <__cxa_finalize@plt+0x834>
    18ce:	48 0f 44 c1          	cmove  %rcx,%rax
    18d2:	ff e0                	jmp    *%rax
    18d4:	48 89 df             	mov    %rbx,%rdi
    18d7:	be 02 00 00 00       	mov    $0x2,%esi
    18dc:	e8 2f 13 00 00       	call   2c10 <__cxa_finalize@plt+0x1b70>
    18e1:	85 c0                	test   %eax,%eax
    18e3:	4c 89 e8             	mov    %r13,%rax
    18e6:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 18f3 <__cxa_finalize@plt+0x853>
    18ed:	48 0f 44 c1          	cmove  %rcx,%rax
    18f1:	ff e0                	jmp    *%rax
    18f3:	48 89 df             	mov    %rbx,%rdi
    18f6:	be 03 00 00 00       	mov    $0x3,%esi
    18fb:	e8 10 13 00 00       	call   2c10 <__cxa_finalize@plt+0x1b70>
    1900:	85 c0                	test   %eax,%eax
    1902:	4c 89 e8             	mov    %r13,%rax
    1905:	48 8d 0d 76 00 00 00 	lea    0x76(%rip),%rcx        # 1982 <__cxa_finalize@plt+0x8e2>
    190c:	48 0f 44 c1          	cmove  %rcx,%rax
    1910:	ff e0                	jmp    *%rax
    1912:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1919:	1f 84 00 00 00 00 00
    1920:	83 bb 0c 01 00 00 48 	cmpl   $0x48,0x10c(%rbx)
    1927:	48 8d 0d 12 00 00 00 	lea    0x12(%rip),%rcx        # 1940 <__cxa_finalize@plt+0x8a0>
    192e:	48 8d 05 fb fe ff ff 	lea    -0x105(%rip),%rax        # 1830 <__cxa_finalize@plt+0x790>
    1935:	48 0f 44 c8          	cmove  %rax,%rcx
    1939:	b8 04 00 00 00       	mov    $0x4,%eax
    193e:	ff e1                	jmp    *%rcx
    1940:	ff 83 10 01 00 00    	incl   0x110(%rbx)
    1946:	e9 dd fe ff ff       	jmp    1828 <__cxa_finalize@plt+0x788>
    194b:	83 fe 04             	cmp    $0x4,%esi
    194e:	75 32                	jne    1982 <__cxa_finalize@plt+0x8e2>
    1950:	83 bb 0c 01 00 00 48 	cmpl   $0x48,0x10c(%rbx)
    1957:	48 8d 05 0f 00 00 00 	lea    0xf(%rip),%rax        # 196d <__cxa_finalize@plt+0x8cd>
    195e:	48 8d 0d 17 00 00 00 	lea    0x17(%rip),%rcx        # 197c <__cxa_finalize@plt+0x8dc>
    1965:	48 0f 44 c8          	cmove  %rax,%rcx
    1969:	31 c0                	xor    %eax,%eax
    196b:	ff e1                	jmp    *%rcx
    196d:	31 c0                	xor    %eax,%eax
    196f:	81 bb 00 01 00 00 3f 	cmpl   $0xbf71f73f,0x100(%rbx)
    1976:	f7 71 bf
    1979:	0f 94 c0             	sete   %al
    197c:	89 83 14 01 00 00    	mov    %eax,0x114(%rbx)
    1982:	c7 83 18 01 00 00 05 	movl   $0x5,0x118(%rbx)
    1989:	00 00 00
    198c:	83 bb 0c 01 00 00 48 	cmpl   $0x48,0x10c(%rbx)
    1993:	48 8d 05 17 00 00 00 	lea    0x17(%rip),%rax        # 19b1 <__cxa_finalize@plt+0x911>
    199a:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 19a7 <__cxa_finalize@plt+0x907>
    19a1:	48 0f 44 c8          	cmove  %rax,%rcx
    19a5:	ff e1                	jmp    *%rcx
    19a7:	c7 83 14 01 00 00 00 	movl   $0x0,0x114(%rbx)
    19ae:	00 00 00
    19b1:	48 83 c4 08          	add    $0x8,%rsp
    19b5:	5b                   	pop    %rbx
    19b6:	41 5c                	pop    %r12
    19b8:	41 5d                	pop    %r13
    19ba:	41 5e                	pop    %r14
    19bc:	41 5f                	pop    %r15
    19be:	5d                   	pop    %rbp
    19bf:	c3                   	ret
    19c0:	55                   	push   %rbp
    19c1:	41 57                	push   %r15
    19c3:	41 56                	push   %r14
    19c5:	41 55                	push   %r13
    19c7:	41 54                	push   %r12
    19c9:	53                   	push   %rbx
    19ca:	48 83 ec 48          	sub    $0x48,%rsp
    19ce:	41 89 d5             	mov    %edx,%r13d
    19d1:	41 89 f7             	mov    %esi,%r15d
    19d4:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    19d9:	8b 05 9d 56 10 01    	mov    0x110569d(%rip),%eax        # 110707c <__cxa_finalize@plt+0x1105fdc>
    19df:	8d 48 01             	lea    0x1(%rax),%ecx
    19e2:	0f af c8             	imul   %eax,%ecx
    19e5:	f6 c1 01             	test   $0x1,%cl
    19e8:	48 8d 05 28 00 00 00 	lea    0x28(%rip),%rax        # 1a17 <__cxa_finalize@plt+0x977>
    19ef:	48 8d 0d 08 00 00 00 	lea    0x8(%rip),%rcx        # 19fe <__cxa_finalize@plt+0x95e>
    19f6:	48 0f 44 c8          	cmove  %rax,%rcx
    19fa:	89 d2                	mov    %edx,%edx
    19fc:	ff e1                	jmp    *%rcx
    19fe:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    1a03:	33 05 77 56 10 01    	xor    0x1105677(%rip),%eax        # 1107080 <__cxa_finalize@plt+0x1105fe0>
    1a09:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1a0c:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1a11:	89 05 69 56 10 01    	mov    %eax,0x1105669(%rip)        # 1107080 <__cxa_finalize@plt+0x1105fe0>
    1a17:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    1a1c:	41 0f b7 df          	movzwl %r15w,%ebx
    1a20:	41 81 f7 e1 ac 00 00 	xor    $0xace1,%r15d
    1a27:	66 41 83 ff 01       	cmp    $0x1,%r15w
    1a2c:	41 83 d7 00          	adc    $0x0,%r15d
    1a30:	44 89 e8             	mov    %r13d,%eax
    1a33:	66 35 2f 9d          	xor    $0x9d2f,%ax
    1a37:	66 89 44 24 02       	mov    %ax,0x2(%rsp)
    1a3c:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # 1a50 <__cxa_finalize@plt+0x9b0>
    1a43:	48 8d 0d 0d 00 00 00 	lea    0xd(%rip),%rcx        # 1a57 <__cxa_finalize@plt+0x9b7>
    1a4a:	48 0f 44 c8          	cmove  %rax,%rcx
    1a4e:	ff e1                	jmp    *%rcx
    1a50:	66 c7 44 24 02 00 b4 	movw   $0xb400,0x2(%rsp)
    1a57:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
    1a5c:	4c 89 f7             	mov    %r14,%rdi
    1a5f:	89 de                	mov    %ebx,%esi
    1a61:	e8 6a 0f 00 00       	call   29d0 <__cxa_finalize@plt+0x1930>
    1a66:	89 d8                	mov    %ebx,%eax
    1a68:	34 5c                	xor    $0x5c,%al
    1a6a:	41 0f b7 ef          	movzwl %r15w,%ebp
    1a6e:	0f b6 d0             	movzbl %al,%edx
    1a71:	bf 12 00 00 00       	mov    $0x12,%edi
    1a76:	be 68 00 00 00       	mov    $0x68,%esi
    1a7b:	4c 89 f1             	mov    %r14,%rcx
    1a7e:	41 89 e8             	mov    %ebp,%r8d
    1a81:	e8 9a 21 00 00       	call   3c20 <__cxa_finalize@plt+0x2b80>
    1a86:	41 89 c7             	mov    %eax,%r15d
    1a89:	44 89 e8             	mov    %r13d,%eax
    1a8c:	31 d8                	xor    %ebx,%eax
    1a8e:	0f b7 f0             	movzwl %ax,%esi
    1a91:	48 8d 54 24 02       	lea    0x2(%rsp),%rdx
    1a96:	89 ef                	mov    %ebp,%edi
    1a98:	e8 d3 22 00 00       	call   3d70 <__cxa_finalize@plt+0x2cd0>
    1a9d:	41 89 c4             	mov    %eax,%r12d
    1aa0:	41 0f b6 d7          	movzbl %r15b,%edx
    1aa4:	44 0f b7 f8          	movzwl %ax,%r15d
    1aa8:	bf 12 00 00 00       	mov    $0x12,%edi
    1aad:	be 68 00 00 00       	mov    $0x68,%esi
    1ab2:	4c 89 f1             	mov    %r14,%rcx
    1ab5:	45 89 f8             	mov    %r15d,%r8d
    1ab8:	e8 63 21 00 00       	call   3c20 <__cxa_finalize@plt+0x2b80>
    1abd:	89 c5                	mov    %eax,%ebp
    1abf:	89 5c 24 10          	mov    %ebx,0x10(%rsp)
    1ac3:	0f b7 5c 24 02       	movzwl 0x2(%rsp),%ebx
    1ac8:	8d 04 1b             	lea    (%rbx,%rbx,1),%eax
    1acb:	44 31 e0             	xor    %r12d,%eax
    1ace:	0f b7 f8             	movzwl %ax,%edi
    1ad1:	e8 0a 16 00 00       	call   30e0 <__cxa_finalize@plt+0x2040>
    1ad6:	40 30 e8             	xor    %bpl,%al
    1ad9:	34 a7                	xor    $0xa7,%al
    1adb:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
    1ae0:	41 88 06             	mov    %al,(%r14)
    1ae3:	41 c1 e7 10          	shl    $0x10,%r15d
    1ae7:	41 09 df             	or     %ebx,%r15d
    1aea:	44 89 ff             	mov    %r15d,%edi
    1aed:	44 89 ee             	mov    %r13d,%esi
    1af0:	ba 0f 00 00 00       	mov    $0xf,%edx
    1af5:	e8 56 03 00 00       	call   1e50 <__cxa_finalize@plt+0xdb0>
    1afa:	24 0f                	and    $0xf,%al
    1afc:	41 30 06             	xor    %al,(%r14)
    1aff:	bb 01 00 00 00       	mov    $0x1,%ebx
    1b04:	c7 44 24 04 11 11 00 	movl   $0x1111,0x4(%rsp)
    1b0b:	00
    1b0c:	66 b9 0a 00          	mov    $0xa,%cx
    1b10:	66 ba 0d 00          	mov    $0xd,%dx
    1b14:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    1b1b:	00 00 00 00 00
    1b20:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    1b25:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    1b2a:	0f b7 c1             	movzwl %cx,%eax
    1b2d:	69 c0 8f e3 00 00    	imul   $0xe38f,%eax,%eax
    1b33:	c1 e8 13             	shr    $0x13,%eax
    1b36:	83 e0 f8             	and    $0xfffffff8,%eax
    1b39:	8d 04 c0             	lea    (%rax,%rax,8),%eax
    1b3c:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    1b41:	29 c1                	sub    %eax,%ecx
    1b43:	0f b7 c2             	movzwl %dx,%eax
    1b46:	69 c0 8f e3 00 00    	imul   $0xe38f,%eax,%eax
    1b4c:	c1 e8 13             	shr    $0x13,%eax
    1b4f:	83 e0 f8             	and    $0xfffffff8,%eax
    1b52:	8d 04 c0             	lea    (%rax,%rax,8),%eax
    1b55:	29 c2                	sub    %eax,%edx
    1b57:	89 54 24 14          	mov    %edx,0x14(%rsp)
    1b5b:	8d 43 c3             	lea    -0x3d(%rbx),%eax
    1b5e:	8d 53 0b             	lea    0xb(%rbx),%edx
    1b61:	48 83 fb 3d          	cmp    $0x3d,%rbx
    1b65:	0f 43 d0             	cmovae %eax,%edx
    1b68:	48 8d 35 f1 36 10 01 	lea    0x11036f1(%rip),%rsi        # 1105260 <__cxa_finalize@plt+0x11041c0>
    1b6f:	44 0f b6 3c 32       	movzbl (%rdx,%rsi,1),%r15d
    1b74:	0f b7 c1             	movzwl %cx,%eax
    1b77:	0f b6 2c 30          	movzbl (%rax,%rsi,1),%ebp
    1b7b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1b80:	0f b6 54 18 ff       	movzbl -0x1(%rax,%rbx,1),%edx
    1b85:	45 0f b7 e4          	movzwl %r12w,%r12d
    1b89:	44 89 ff             	mov    %r15d,%edi
    1b8c:	89 ee                	mov    %ebp,%esi
    1b8e:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
    1b93:	45 89 e0             	mov    %r12d,%r8d
    1b96:	e8 85 20 00 00       	call   3c20 <__cxa_finalize@plt+0x2b80>
    1b9b:	41 89 c5             	mov    %eax,%r13d
    1b9e:	44 8b 74 24 04       	mov    0x4(%rsp),%r14d
    1ba3:	44 89 f0             	mov    %r14d,%eax
    1ba6:	33 44 24 10          	xor    0x10(%rsp),%eax
    1baa:	33 44 24 18          	xor    0x18(%rsp),%eax
    1bae:	0f b7 f0             	movzwl %ax,%esi
    1bb1:	44 89 e7             	mov    %r12d,%edi
    1bb4:	48 8d 54 24 02       	lea    0x2(%rsp),%rdx
    1bb9:	e8 b2 21 00 00       	call   3d70 <__cxa_finalize@plt+0x2cd0>
    1bbe:	41 89 c4             	mov    %eax,%r12d
    1bc1:	41 0f b6 d5          	movzbl %r13b,%edx
    1bc5:	44 0f b7 e8          	movzwl %ax,%r13d
    1bc9:	44 89 ff             	mov    %r15d,%edi
    1bcc:	89 ee                	mov    %ebp,%esi
    1bce:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
    1bd3:	45 89 e8             	mov    %r13d,%r8d
    1bd6:	e8 45 20 00 00       	call   3c20 <__cxa_finalize@plt+0x2b80>
    1bdb:	89 c5                	mov    %eax,%ebp
    1bdd:	44 0f b7 7c 24 02    	movzwl 0x2(%rsp),%r15d
    1be3:	43 8d 04 3f          	lea    (%r15,%r15,1),%eax
    1be7:	44 31 e0             	xor    %r12d,%eax
    1bea:	0f b7 f8             	movzwl %ax,%edi
    1bed:	e8 ee 14 00 00       	call   30e0 <__cxa_finalize@plt+0x2040>
    1bf2:	40 30 e8             	xor    %bpl,%al
    1bf5:	0f b7 4c 24 14       	movzwl 0x14(%rsp),%ecx
    1bfa:	48 8d 15 5f 36 10 01 	lea    0x110365f(%rip),%rdx        # 1105260 <__cxa_finalize@plt+0x11041c0>
    1c01:	32 04 11             	xor    (%rcx,%rdx,1),%al
    1c04:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    1c09:	88 44 1d 00          	mov    %al,0x0(%rbp,%rbx,1)
    1c0d:	41 c1 e5 10          	shl    $0x10,%r13d
    1c11:	45 09 fd             	or     %r15d,%r13d
    1c14:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    1c19:	8d 34 18             	lea    (%rax,%rbx,1),%esi
    1c1c:	44 89 ef             	mov    %r13d,%edi
    1c1f:	ba 0f 00 00 00       	mov    $0xf,%edx
    1c24:	e8 27 02 00 00       	call   1e50 <__cxa_finalize@plt+0xdb0>
    1c29:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    1c2e:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    1c33:	24 0f                	and    $0xf,%al
    1c35:	30 44 1d 00          	xor    %al,0x0(%rbp,%rbx,1)
    1c39:	48 83 fb 47          	cmp    $0x47,%rbx
    1c3d:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
    1c41:	48 8d 05 d8 fe ff ff 	lea    -0x128(%rip),%rax        # 1b20 <__cxa_finalize@plt+0xa80>
    1c48:	48 8d 35 18 00 00 00 	lea    0x18(%rip),%rsi        # 1c67 <__cxa_finalize@plt+0xbc7>
    1c4f:	48 0f 44 c6          	cmove  %rsi,%rax
    1c53:	41 81 c6 11 11 00 00 	add    $0x1111,%r14d
    1c5a:	44 89 74 24 04       	mov    %r14d,0x4(%rsp)
    1c5f:	83 c1 07             	add    $0x7,%ecx
    1c62:	83 c2 09             	add    $0x9,%edx
    1c65:	ff e0                	jmp    *%rax
    1c67:	48 83 c4 48          	add    $0x48,%rsp
    1c6b:	5b                   	pop    %rbx
    1c6c:	41 5c                	pop    %r12
    1c6e:	41 5d                	pop    %r13
    1c70:	41 5e                	pop    %r14
    1c72:	41 5f                	pop    %r15
    1c74:	5d                   	pop    %rbp
    1c75:	c3                   	ret
    1c76:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1c7d:	00 00 00
    1c80:	53                   	push   %rbx
    1c81:	48 83 ec 20          	sub    $0x20,%rsp
    1c85:	89 fb                	mov    %edi,%ebx
    1c87:	8b 05 f7 53 10 01    	mov    0x11053f7(%rip),%eax        # 1107084 <__cxa_finalize@plt+0x1105fe4>
    1c8d:	8d 48 01             	lea    0x1(%rax),%ecx
    1c90:	0f af c8             	imul   %eax,%ecx
    1c93:	f6 c1 01             	test   $0x1,%cl
    1c96:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 1cc3 <__cxa_finalize@plt+0xc23>
    1c9d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 1caa <__cxa_finalize@plt+0xc0a>
    1ca4:	48 0f 44 c8          	cmove  %rax,%rcx
    1ca8:	ff e1                	jmp    *%rcx
    1caa:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    1caf:	33 05 d3 53 10 01    	xor    0x11053d3(%rip),%eax        # 1107088 <__cxa_finalize@plt+0x1105fe8>
    1cb5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1cb8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1cbd:	89 05 c5 53 10 01    	mov    %eax,0x11053c5(%rip)        # 1107088 <__cxa_finalize@plt+0x1105fe8>
    1cc3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%rsp)
    1cca:	00
    1ccb:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    1cd0:	be 04 00 00 00       	mov    $0x4,%esi
    1cd5:	ba 01 00 00 00       	mov    $0x1,%edx
    1cda:	e8 b1 f3 ff ff       	call   1090 <getrandom@plt>
    1cdf:	48 83 f8 04          	cmp    $0x4,%rax
    1ce3:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # 1cf7 <__cxa_finalize@plt+0xc57>
    1cea:	48 8d 0d 0f 00 00 00 	lea    0xf(%rip),%rcx        # 1d00 <__cxa_finalize@plt+0xc60>
    1cf1:	48 0f 44 c8          	cmove  %rax,%rcx
    1cf5:	ff e1                	jmp    *%rcx
    1cf7:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1cfb:	0f b7 c3             	movzwl %bx,%eax
    1cfe:	eb 33                	jmp    1d33 <__cxa_finalize@plt+0xc93>
    1d00:	0f 57 c0             	xorps  %xmm0,%xmm0
    1d03:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
    1d08:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    1d0d:	bf 01 00 00 00       	mov    $0x1,%edi
    1d12:	e8 29 f3 ff ff       	call   1040 <clock_gettime@plt>
    1d17:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    1d1b:	33 4c 24 18          	xor    0x18(%rsp),%ecx
    1d1f:	0f b7 c3             	movzwl %bx,%eax
    1d22:	89 c7                	mov    %eax,%edi
    1d24:	c1 e7 10             	shl    $0x10,%edi
    1d27:	31 cf                	xor    %ecx,%edi
    1d29:	33 3d 19 53 10 01    	xor    0x1105319(%rip),%edi        # 1107048 <__cxa_finalize@plt+0x1105fa8>
    1d2f:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
    1d33:	31 c7                	xor    %eax,%edi
    1d35:	89 c1                	mov    %eax,%ecx
    1d37:	c1 e1 04             	shl    $0x4,%ecx
    1d3a:	8d 34 08             	lea    (%rax,%rcx,1),%esi
    1d3d:	83 c6 03             	add    $0x3,%esi
    1d40:	ba 0a 00 00 00       	mov    $0xa,%edx
    1d45:	e8 06 01 00 00       	call   1e50 <__cxa_finalize@plt+0xdb0>
    1d4a:	33 44 24 0c          	xor    0xc(%rsp),%eax
    1d4e:	48 83 c4 20          	add    $0x20,%rsp
    1d52:	5b                   	pop    %rbx
    1d53:	c3                   	ret
    1d54:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    1d5b:	00 00 00 00 00
    1d60:	55                   	push   %rbp
    1d61:	41 57                	push   %r15
    1d63:	41 56                	push   %r14
    1d65:	41 55                	push   %r13
    1d67:	41 54                	push   %r12
    1d69:	53                   	push   %rbx
    1d6a:	50                   	push   %rax
    1d6b:	48 89 fb             	mov    %rdi,%rbx
    1d6e:	8b 05 18 53 10 01    	mov    0x1105318(%rip),%eax        # 110708c <__cxa_finalize@plt+0x1105fec>
    1d74:	8d 48 01             	lea    0x1(%rax),%ecx
    1d77:	0f af c8             	imul   %eax,%ecx
    1d7a:	f6 c1 01             	test   $0x1,%cl
    1d7d:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 1daa <__cxa_finalize@plt+0xd0a>
    1d84:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 1d91 <__cxa_finalize@plt+0xcf1>
    1d8b:	48 0f 44 c8          	cmove  %rax,%rcx
    1d8f:	ff e1                	jmp    *%rcx
    1d91:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    1d96:	33 05 f4 52 10 01    	xor    0x11052f4(%rip),%eax        # 1107090 <__cxa_finalize@plt+0x1105ff0>
    1d9c:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1d9f:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1da4:	89 05 e6 52 10 01    	mov    %eax,0x11052e6(%rip)        # 1107090 <__cxa_finalize@plt+0x1105ff0>
    1daa:	89 f5                	mov    %esi,%ebp
    1dac:	c1 e5 10             	shl    $0x10,%ebp
    1daf:	31 d5                	xor    %edx,%ebp
    1db1:	81 f5 a1 b2 c3 d4    	xor    $0xd4c3b2a1,%ebp
    1db7:	44 0f b7 f6          	movzwl %si,%r14d
    1dbb:	45 31 ff             	xor    %r15d,%r15d
    1dbe:	4c 8d 2d 0b 00 00 00 	lea    0xb(%rip),%r13        # 1dd0 <__cxa_finalize@plt+0xd30>
    1dc5:	45 31 e4             	xor    %r12d,%r12d
    1dc8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1dcf:	00
    1dd0:	42 0f b6 3c 23       	movzbl (%rbx,%r12,1),%edi
    1dd5:	31 ef                	xor    %ebp,%edi
    1dd7:	44 89 e2             	mov    %r12d,%edx
    1dda:	83 e2 0f             	and    $0xf,%edx
    1ddd:	43 8d 34 26          	lea    (%r14,%r12,1),%esi
    1de1:	e8 6a 00 00 00       	call   1e50 <__cxa_finalize@plt+0xdb0>
    1de6:	31 c5                	xor    %eax,%ebp
    1de8:	89 e8                	mov    %ebp,%eax
    1dea:	c1 e8 10             	shr    $0x10,%eax
    1ded:	31 e8                	xor    %ebp,%eax
    1def:	0f b7 f8             	movzwl %ax,%edi
    1df2:	e8 e9 12 00 00       	call   30e0 <__cxa_finalize@plt+0x2040>
    1df7:	0f b6 c0             	movzbl %al,%eax
    1dfa:	42 30 04 23          	xor    %al,(%rbx,%r12,1)
    1dfe:	44 01 fd             	add    %r15d,%ebp
    1e01:	01 c5                	add    %eax,%ebp
    1e03:	44 89 e6             	mov    %r12d,%esi
    1e06:	83 e6 07             	and    $0x7,%esi
    1e09:	83 c6 05             	add    $0x5,%esi
    1e0c:	89 ef                	mov    %ebp,%edi
    1e0e:	e8 9d 01 00 00       	call   1fb0 <__cxa_finalize@plt+0xf10>
    1e13:	89 c5                	mov    %eax,%ebp
    1e15:	49 83 fc 47          	cmp    $0x47,%r12
    1e19:	4d 8d 64 24 01       	lea    0x1(%r12),%r12
    1e1e:	4c 89 e8             	mov    %r13,%rax
    1e21:	48 8d 0d 0d 00 00 00 	lea    0xd(%rip),%rcx        # 1e35 <__cxa_finalize@plt+0xd95>
    1e28:	48 0f 44 c1          	cmove  %rcx,%rax
    1e2c:	41 81 c7 37 9e 00 00 	add    $0x9e37,%r15d
    1e33:	ff e0                	jmp    *%rax
    1e35:	48 83 c4 08          	add    $0x8,%rsp
    1e39:	5b                   	pop    %rbx
    1e3a:	41 5c                	pop    %r12
    1e3c:	41 5d                	pop    %r13
    1e3e:	41 5e                	pop    %r14
    1e40:	41 5f                	pop    %r15
    1e42:	5d                   	pop    %rbp
    1e43:	c3                   	ret
    1e44:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    1e4b:	00 00 00 00 00
    1e50:	55                   	push   %rbp
    1e51:	41 57                	push   %r15
    1e53:	41 56                	push   %r14
    1e55:	41 55                	push   %r13
    1e57:	41 54                	push   %r12
    1e59:	53                   	push   %rbx
    1e5a:	50                   	push   %rax
    1e5b:	89 d3                	mov    %edx,%ebx
    1e5d:	41 89 f6             	mov    %esi,%r14d
    1e60:	8b 05 2e 52 10 01    	mov    0x110522e(%rip),%eax        # 1107094 <__cxa_finalize@plt+0x1105ff4>
    1e66:	8d 48 01             	lea    0x1(%rax),%ecx
    1e69:	0f af c8             	imul   %eax,%ecx
    1e6c:	f6 c1 01             	test   $0x1,%cl
    1e6f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 1e9c <__cxa_finalize@plt+0xdfc>
    1e76:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 1e83 <__cxa_finalize@plt+0xde3>
    1e7d:	48 0f 44 c8          	cmove  %rax,%rcx
    1e81:	ff e1                	jmp    *%rcx
    1e83:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    1e88:	33 05 0a 52 10 01    	xor    0x110520a(%rip),%eax        # 1107098 <__cxa_finalize@plt+0x1105ff8>
    1e8e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1e91:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    1e96:	89 05 fc 51 10 01    	mov    %eax,0x11051fc(%rip)        # 1107098 <__cxa_finalize@plt+0x1105ff8>
    1e9c:	44 89 f6             	mov    %r14d,%esi
    1e9f:	89 da                	mov    %ebx,%edx
    1ea1:	e8 5a 01 00 00       	call   2000 <__cxa_finalize@plt+0xf60>
    1ea6:	89 c5                	mov    %eax,%ebp
    1ea8:	81 f5 ed fe 0d d0    	xor    $0xd00dfeed,%ebp
    1eae:	8d 04 5b             	lea    (%rbx,%rbx,2),%eax
    1eb1:	44 8d 24 83          	lea    (%rbx,%rax,4),%r12d
    1eb5:	46 8d 3c 33          	lea    (%rbx,%r14,1),%r15d
    1eb9:	89 ef                	mov    %ebp,%edi
    1ebb:	44 89 f6             	mov    %r14d,%esi
    1ebe:	89 da                	mov    %ebx,%edx
    1ec0:	e8 3b 01 00 00       	call   2000 <__cxa_finalize@plt+0xf60>
    1ec5:	31 c5                	xor    %eax,%ebp
    1ec7:	89 e8                	mov    %ebp,%eax
    1ec9:	44 31 e0             	xor    %r12d,%eax
    1ecc:	83 e0 0f             	and    $0xf,%eax
    1ecf:	4c 8d 2d 7a 4e 10 01 	lea    0x1104e7a(%rip),%r13        # 1106d50 <__cxa_finalize@plt+0x1105cb0>
    1ed6:	89 ef                	mov    %ebp,%edi
    1ed8:	44 89 fe             	mov    %r15d,%esi
    1edb:	41 ff 54 c5 00       	call   *0x0(%r13,%rax,8)
    1ee0:	89 c5                	mov    %eax,%ebp
    1ee2:	89 c7                	mov    %eax,%edi
    1ee4:	81 f7 21 10 00 00    	xor    $0x1021,%edi
    1eea:	41 8d 76 11          	lea    0x11(%r14),%esi
    1eee:	8d 53 01             	lea    0x1(%rbx),%edx
    1ef1:	e8 0a 01 00 00       	call   2000 <__cxa_finalize@plt+0xf60>
    1ef6:	31 c5                	xor    %eax,%ebp
    1ef8:	89 e8                	mov    %ebp,%eax
    1efa:	44 31 e0             	xor    %r12d,%eax
    1efd:	83 e0 0f             	and    $0xf,%eax
    1f00:	83 f0 01             	xor    $0x1,%eax
    1f03:	42 8d 34 33          	lea    (%rbx,%r14,1),%esi
    1f07:	83 c6 55             	add    $0x55,%esi
    1f0a:	89 ef                	mov    %ebp,%edi
    1f0c:	41 ff 54 c5 00       	call   *0x0(%r13,%rax,8)
    1f11:	89 c5                	mov    %eax,%ebp
    1f13:	89 c7                	mov    %eax,%edi
    1f15:	81 f7 42 20 00 00    	xor    $0x2042,%edi
    1f1b:	41 8d 76 22          	lea    0x22(%r14),%esi
    1f1f:	8d 53 02             	lea    0x2(%rbx),%edx
    1f22:	e8 d9 00 00 00       	call   2000 <__cxa_finalize@plt+0xf60>
    1f27:	31 c5                	xor    %eax,%ebp
    1f29:	89 e8                	mov    %ebp,%eax
    1f2b:	44 31 e0             	xor    %r12d,%eax
    1f2e:	83 e0 0f             	and    $0xf,%eax
    1f31:	83 f0 02             	xor    $0x2,%eax
    1f34:	42 8d 34 33          	lea    (%rbx,%r14,1),%esi
    1f38:	81 c6 aa 00 00 00    	add    $0xaa,%esi
    1f3e:	89 ef                	mov    %ebp,%edi
    1f40:	41 ff 54 c5 00       	call   *0x0(%r13,%rax,8)
    1f45:	89 c5                	mov    %eax,%ebp
    1f47:	89 c7                	mov    %eax,%edi
    1f49:	81 f7 63 30 00 00    	xor    $0x3063,%edi
    1f4f:	41 8d 76 33          	lea    0x33(%r14),%esi
    1f53:	8d 53 03             	lea    0x3(%rbx),%edx
    1f56:	e8 a5 00 00 00       	call   2000 <__cxa_finalize@plt+0xf60>
    1f5b:	31 c5                	xor    %eax,%ebp
    1f5d:	41 31 ec             	xor    %ebp,%r12d
    1f60:	41 83 e4 0f          	and    $0xf,%r12d
    1f64:	41 83 f4 03          	xor    $0x3,%r12d
    1f68:	42 8d 34 33          	lea    (%rbx,%r14,1),%esi
    1f6c:	81 c6 ff 00 00 00    	add    $0xff,%esi
    1f72:	89 ef                	mov    %ebp,%edi
    1f74:	43 ff 54 e5 00       	call   *0x0(%r13,%r12,8)
    1f79:	89 c5                	mov    %eax,%ebp
    1f7b:	44 31 f3             	xor    %r14d,%ebx
    1f7e:	31 c3                	xor    %eax,%ebx
    1f80:	89 df                	mov    %ebx,%edi
    1f82:	e8 69 01 00 00       	call   20f0 <__cxa_finalize@plt+0x1050>
    1f87:	8b 0d bb 50 10 01    	mov    0x11050bb(%rip),%ecx        # 1107048 <__cxa_finalize@plt+0x1105fa8>
    1f8d:	31 e9                	xor    %ebp,%ecx
    1f8f:	85 c0                	test   %eax,%eax
    1f91:	89 c8                	mov    %ecx,%eax
    1f93:	f7 d0                	not    %eax
    1f95:	0f 45 c1             	cmovne %ecx,%eax
    1f98:	89 05 aa 50 10 01    	mov    %eax,0x11050aa(%rip)        # 1107048 <__cxa_finalize@plt+0x1105fa8>
    1f9e:	89 e8                	mov    %ebp,%eax
    1fa0:	48 83 c4 08          	add    $0x8,%rsp
    1fa4:	5b                   	pop    %rbx
    1fa5:	41 5c                	pop    %r12
    1fa7:	41 5d                	pop    %r13
    1fa9:	41 5e                	pop    %r14
    1fab:	41 5f                	pop    %r15
    1fad:	5d                   	pop    %rbp
    1fae:	c3                   	ret
    1faf:	90                   	nop
    1fb0:	89 f1                	mov    %esi,%ecx
    1fb2:	89 f8                	mov    %edi,%eax
    1fb4:	8b 15 e2 50 10 01    	mov    0x11050e2(%rip),%edx        # 110709c <__cxa_finalize@plt+0x1105ffc>
    1fba:	8d 72 01             	lea    0x1(%rdx),%esi
    1fbd:	0f af f2             	imul   %edx,%esi
    1fc0:	40 f6 c6 01          	test   $0x1,%sil
    1fc4:	48 8d 15 27 00 00 00 	lea    0x27(%rip),%rdx        # 1ff2 <__cxa_finalize@plt+0xf52>
    1fcb:	48 8d 35 06 00 00 00 	lea    0x6(%rip),%rsi        # 1fd8 <__cxa_finalize@plt+0xf38>
    1fd2:	48 0f 44 f2          	cmove  %rdx,%rsi
    1fd6:	ff e6                	jmp    *%rsi
    1fd8:	ba 5a 5a a5 a5       	mov    $0xa5a55a5a,%edx
    1fdd:	33 15 bd 50 10 01    	xor    0x11050bd(%rip),%edx        # 11070a0 <__cxa_finalize@plt+0x1106000>
    1fe3:	8d 14 52             	lea    (%rdx,%rdx,2),%edx
    1fe6:	81 c2 1f b3 36 5d    	add    $0x5d36b31f,%edx
    1fec:	89 15 ae 50 10 01    	mov    %edx,0x11050ae(%rip)        # 11070a0 <__cxa_finalize@plt+0x1106000>
    1ff2:	d3 c0                	rol    %cl,%eax
    1ff4:	c3                   	ret
    1ff5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1ffc:	00 00 00 00
    2000:	55                   	push   %rbp
    2001:	41 57                	push   %r15
    2003:	41 56                	push   %r14
    2005:	53                   	push   %rbx
    2006:	50                   	push   %rax
    2007:	89 d3                	mov    %edx,%ebx
    2009:	41 89 f6             	mov    %esi,%r14d
    200c:	89 fd                	mov    %edi,%ebp
    200e:	8b 05 90 50 10 01    	mov    0x1105090(%rip),%eax        # 11070a4 <__cxa_finalize@plt+0x1106004>
    2014:	8d 48 01             	lea    0x1(%rax),%ecx
    2017:	0f af c8             	imul   %eax,%ecx
    201a:	f6 c1 01             	test   $0x1,%cl
    201d:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 204a <__cxa_finalize@plt+0xfaa>
    2024:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2031 <__cxa_finalize@plt+0xf91>
    202b:	48 0f 44 c8          	cmove  %rax,%rcx
    202f:	ff e1                	jmp    *%rcx
    2031:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2036:	33 05 6c 50 10 01    	xor    0x110506c(%rip),%eax        # 11070a8 <__cxa_finalize@plt+0x1106008>
    203c:	8d 04 40             	lea    (%rax,%rax,2),%eax
    203f:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2044:	89 05 5e 50 10 01    	mov    %eax,0x110505e(%rip)        # 11070a8 <__cxa_finalize@plt+0x1106008>
    204a:	8d 73 03             	lea    0x3(%rbx),%esi
    204d:	44 89 f7             	mov    %r14d,%edi
    2050:	e8 5b ff ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2055:	69 cb b9 79 07 00    	imul   $0x779b9,%ebx,%ecx
    205b:	31 e8                	xor    %ebp,%eax
    205d:	31 c8                	xor    %ecx,%eax
    205f:	8d 88 37 1a 00 00    	lea    0x1a37(%rax),%ecx
    2065:	8d 14 03             	lea    (%rbx,%rax,1),%edx
    2068:	81 c2 4f 22 00 00    	add    $0x224f,%edx
    206e:	41 0f b6 f6          	movzbl %r14b,%esi
    2072:	01 c6                	add    %eax,%esi
    2074:	81 c6 a1 39 00 00    	add    $0x39a1,%esi
    207a:	25 ff ff 0f 00       	and    $0xfffff,%eax
    207f:	48 8d 3d 9a 2f 00 00 	lea    0x2f9a(%rip),%rdi        # 5020 <__cxa_finalize@plt+0x3f80>
    2086:	0f b6 04 07          	movzbl (%rdi,%rax,1),%eax
    208a:	81 e1 ff ff 0f 00    	and    $0xfffff,%ecx
    2090:	0f b6 0c 0f          	movzbl (%rdi,%rcx,1),%ecx
    2094:	81 e2 ff ff 0f 00    	and    $0xfffff,%edx
    209a:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
    209e:	81 e6 ff ff 0f 00    	and    $0xfffff,%esi
    20a4:	44 0f b6 3c 37       	movzbl (%rdi,%rsi,1),%r15d
    20a9:	c1 e1 08             	shl    $0x8,%ecx
    20ac:	09 c1                	or     %eax,%ecx
    20ae:	c1 e2 10             	shl    $0x10,%edx
    20b1:	09 ca                	or     %ecx,%edx
    20b3:	41 c1 e7 18          	shl    $0x18,%r15d
    20b7:	41 09 d7             	or     %edx,%r15d
    20ba:	81 c5 a5 a5 a5 a5    	add    $0xa5a5a5a5,%ebp
    20c0:	44 89 f7             	mov    %r14d,%edi
    20c3:	c1 e7 05             	shl    $0x5,%edi
    20c6:	44 01 f7             	add    %r14d,%edi
    20c9:	31 ef                	xor    %ebp,%edi
    20cb:	83 e3 1f             	and    $0x1f,%ebx
    20ce:	89 de                	mov    %ebx,%esi
    20d0:	e8 db fe ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    20d5:	44 31 f8             	xor    %r15d,%eax
    20d8:	48 83 c4 08          	add    $0x8,%rsp
    20dc:	5b                   	pop    %rbx
    20dd:	41 5e                	pop    %r14
    20df:	41 5f                	pop    %r15
    20e1:	5d                   	pop    %rbp
    20e2:	c3                   	ret
    20e3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    20ea:	84 00 00 00 00 00
    20f0:	8b 05 b6 4f 10 01    	mov    0x1104fb6(%rip),%eax        # 11070ac <__cxa_finalize@plt+0x110600c>
    20f6:	8d 48 01             	lea    0x1(%rax),%ecx
    20f9:	0f af c8             	imul   %eax,%ecx
    20fc:	f6 c1 01             	test   $0x1,%cl
    20ff:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 212c <__cxa_finalize@plt+0x108c>
    2106:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2113 <__cxa_finalize@plt+0x1073>
    210d:	48 0f 44 c8          	cmove  %rax,%rcx
    2111:	ff e1                	jmp    *%rcx
    2113:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2118:	33 05 92 4f 10 01    	xor    0x1104f92(%rip),%eax        # 11070b0 <__cxa_finalize@plt+0x1106010>
    211e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2121:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2126:	89 05 84 4f 10 01    	mov    %eax,0x1104f84(%rip)        # 11070b0 <__cxa_finalize@plt+0x1106010>
    212c:	53                   	push   %rbx
    212d:	48 83 ec 10          	sub    $0x10,%rsp
    2131:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
    2135:	8b 5c 24 0c          	mov    0xc(%rsp),%ebx
    2139:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    213d:	be 07 00 00 00       	mov    $0x7,%esi
    2142:	e8 69 fe ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2147:	31 d8                	xor    %ebx,%eax
    2149:	69 4c 24 0c b1 79 37 	imul   $0x9e3779b1,0xc(%rsp),%ecx
    2150:	9e
    2151:	31 c8                	xor    %ecx,%eax
    2153:	89 c1                	mov    %eax,%ecx
    2155:	c1 e9 0b             	shr    $0xb,%ecx
    2158:	31 c8                	xor    %ecx,%eax
    215a:	89 c1                	mov    %eax,%ecx
    215c:	c1 e9 03             	shr    $0x3,%ecx
    215f:	31 c8                	xor    %ecx,%eax
    2161:	f7 d0                	not    %eax
    2163:	83 e0 01             	and    $0x1,%eax
    2166:	48 83 c4 10          	add    $0x10,%rsp
    216a:	5b                   	pop    %rbx
    216b:	c3                   	ret
    216c:	0f 1f 40 00          	nopl   0x0(%rax)
    2170:	55                   	push   %rbp
    2171:	53                   	push   %rbx
    2172:	50                   	push   %rax
    2173:	89 f3                	mov    %esi,%ebx
    2175:	89 fd                	mov    %edi,%ebp
    2177:	8b 05 37 4f 10 01    	mov    0x1104f37(%rip),%eax        # 11070b4 <__cxa_finalize@plt+0x1106014>
    217d:	8d 48 01             	lea    0x1(%rax),%ecx
    2180:	0f af c8             	imul   %eax,%ecx
    2183:	f6 c1 01             	test   $0x1,%cl
    2186:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 21b3 <__cxa_finalize@plt+0x1113>
    218d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 219a <__cxa_finalize@plt+0x10fa>
    2194:	48 0f 44 c8          	cmove  %rax,%rcx
    2198:	ff e1                	jmp    *%rcx
    219a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    219f:	33 05 13 4f 10 01    	xor    0x1104f13(%rip),%eax        # 11070b8 <__cxa_finalize@plt+0x1106018>
    21a5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    21a8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    21ad:	89 05 05 4f 10 01    	mov    %eax,0x1104f05(%rip)        # 11070b8 <__cxa_finalize@plt+0x1106018>
    21b3:	8d 7b 11             	lea    0x11(%rbx),%edi
    21b6:	89 ee                	mov    %ebp,%esi
    21b8:	83 e6 1f             	and    $0x1f,%esi
    21bb:	83 f6 07             	xor    $0x7,%esi
    21be:	e8 ed fd ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    21c3:	31 c5                	xor    %eax,%ebp
    21c5:	81 c5 49 15 af 81    	add    $0x81af1549,%ebp
    21cb:	89 ef                	mov    %ebp,%edi
    21cd:	c1 ef 04             	shr    $0x4,%edi
    21d0:	31 ef                	xor    %ebp,%edi
    21d2:	be 15 00 00 00       	mov    $0x15,%esi
    21d7:	e8 d4 fd ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    21dc:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    21e2:	83 c1 03             	add    $0x3,%ecx
    21e5:	31 c8                	xor    %ecx,%eax
    21e7:	48 83 c4 08          	add    $0x8,%rsp
    21eb:	5b                   	pop    %rbx
    21ec:	5d                   	pop    %rbp
    21ed:	c3                   	ret
    21ee:	66 90                	xchg   %ax,%ax
    21f0:	55                   	push   %rbp
    21f1:	53                   	push   %rbx
    21f2:	50                   	push   %rax
    21f3:	89 f3                	mov    %esi,%ebx
    21f5:	89 fd                	mov    %edi,%ebp
    21f7:	8b 05 bf 4e 10 01    	mov    0x1104ebf(%rip),%eax        # 11070bc <__cxa_finalize@plt+0x110601c>
    21fd:	8d 48 01             	lea    0x1(%rax),%ecx
    2200:	0f af c8             	imul   %eax,%ecx
    2203:	f6 c1 01             	test   $0x1,%cl
    2206:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2233 <__cxa_finalize@plt+0x1193>
    220d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 221a <__cxa_finalize@plt+0x117a>
    2214:	48 0f 44 c8          	cmove  %rax,%rcx
    2218:	ff e1                	jmp    *%rcx
    221a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    221f:	33 05 9b 4e 10 01    	xor    0x1104e9b(%rip),%eax        # 11070c0 <__cxa_finalize@plt+0x1106020>
    2225:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2228:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    222d:	89 05 8d 4e 10 01    	mov    %eax,0x1104e8d(%rip)        # 11070c0 <__cxa_finalize@plt+0x1106020>
    2233:	8d 7b 2d             	lea    0x2d(%rbx),%edi
    2236:	89 ee                	mov    %ebp,%esi
    2238:	83 e6 1f             	and    $0x1f,%esi
    223b:	83 f6 19             	xor    $0x19,%esi
    223e:	e8 6d fd ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2243:	31 c5                	xor    %eax,%ebp
    2245:	81 c5 85 65 c0 cf    	add    $0xcfc06585,%ebp
    224b:	89 ef                	mov    %ebp,%edi
    224d:	c1 ef 06             	shr    $0x6,%edi
    2250:	31 ef                	xor    %ebp,%edi
    2252:	be 11 00 00 00       	mov    $0x11,%esi
    2257:	e8 54 fd ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    225c:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2262:	83 c1 05             	add    $0x5,%ecx
    2265:	31 c8                	xor    %ecx,%eax
    2267:	48 83 c4 08          	add    $0x8,%rsp
    226b:	5b                   	pop    %rbx
    226c:	5d                   	pop    %rbp
    226d:	c3                   	ret
    226e:	66 90                	xchg   %ax,%ax
    2270:	55                   	push   %rbp
    2271:	53                   	push   %rbx
    2272:	50                   	push   %rax
    2273:	89 f3                	mov    %esi,%ebx
    2275:	89 fd                	mov    %edi,%ebp
    2277:	8b 05 47 4e 10 01    	mov    0x1104e47(%rip),%eax        # 11070c4 <__cxa_finalize@plt+0x1106024>
    227d:	8d 48 01             	lea    0x1(%rax),%ecx
    2280:	0f af c8             	imul   %eax,%ecx
    2283:	f6 c1 01             	test   $0x1,%cl
    2286:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 22b3 <__cxa_finalize@plt+0x1213>
    228d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 229a <__cxa_finalize@plt+0x11fa>
    2294:	48 0f 44 c8          	cmove  %rax,%rcx
    2298:	ff e1                	jmp    *%rcx
    229a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    229f:	33 05 23 4e 10 01    	xor    0x1104e23(%rip),%eax        # 11070c8 <__cxa_finalize@plt+0x1106028>
    22a5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    22a8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    22ad:	89 05 15 4e 10 01    	mov    %eax,0x1104e15(%rip)        # 11070c8 <__cxa_finalize@plt+0x1106028>
    22b3:	8d 7b 3b             	lea    0x3b(%rbx),%edi
    22b6:	89 ee                	mov    %ebp,%esi
    22b8:	83 e6 1f             	and    $0x1f,%esi
    22bb:	83 f6 0d             	xor    $0xd,%esi
    22be:	e8 ed fc ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    22c3:	31 c5                	xor    %eax,%ebp
    22c5:	81 c5 a3 0d c9 76    	add    $0x76c90da3,%ebp
    22cb:	89 ef                	mov    %ebp,%edi
    22cd:	c1 ef 03             	shr    $0x3,%edi
    22d0:	31 ef                	xor    %ebp,%edi
    22d2:	be 14 00 00 00       	mov    $0x14,%esi
    22d7:	e8 d4 fc ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    22dc:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    22e2:	83 c1 02             	add    $0x2,%ecx
    22e5:	31 c8                	xor    %ecx,%eax
    22e7:	48 83 c4 08          	add    $0x8,%rsp
    22eb:	5b                   	pop    %rbx
    22ec:	5d                   	pop    %rbp
    22ed:	c3                   	ret
    22ee:	66 90                	xchg   %ax,%ax
    22f0:	55                   	push   %rbp
    22f1:	53                   	push   %rbx
    22f2:	50                   	push   %rax
    22f3:	89 f3                	mov    %esi,%ebx
    22f5:	89 fd                	mov    %edi,%ebp
    22f7:	8b 05 cf 4d 10 01    	mov    0x1104dcf(%rip),%eax        # 11070cc <__cxa_finalize@plt+0x110602c>
    22fd:	8d 48 01             	lea    0x1(%rax),%ecx
    2300:	0f af c8             	imul   %eax,%ecx
    2303:	f6 c1 01             	test   $0x1,%cl
    2306:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2333 <__cxa_finalize@plt+0x1293>
    230d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 231a <__cxa_finalize@plt+0x127a>
    2314:	48 0f 44 c8          	cmove  %rax,%rcx
    2318:	ff e1                	jmp    *%rcx
    231a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    231f:	33 05 ab 4d 10 01    	xor    0x1104dab(%rip),%eax        # 11070d0 <__cxa_finalize@plt+0x1106030>
    2325:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2328:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    232d:	89 05 9d 4d 10 01    	mov    %eax,0x1104d9d(%rip)        # 11070d0 <__cxa_finalize@plt+0x1106030>
    2333:	8d 7b 4f             	lea    0x4f(%rbx),%edi
    2336:	89 ee                	mov    %ebp,%esi
    2338:	83 e6 1f             	and    $0x1f,%esi
    233b:	83 f6 13             	xor    $0x13,%esi
    233e:	e8 6d fc ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2343:	31 c5                	xor    %eax,%ebp
    2345:	81 c5 17 90 1e d3    	add    $0xd31e9017,%ebp
    234b:	89 ef                	mov    %ebp,%edi
    234d:	c1 ef 07             	shr    $0x7,%edi
    2350:	31 ef                	xor    %ebp,%edi
    2352:	be 1a 00 00 00       	mov    $0x1a,%esi
    2357:	e8 54 fc ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    235c:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2362:	83 c1 06             	add    $0x6,%ecx
    2365:	31 c8                	xor    %ecx,%eax
    2367:	48 83 c4 08          	add    $0x8,%rsp
    236b:	5b                   	pop    %rbx
    236c:	5d                   	pop    %rbp
    236d:	c3                   	ret
    236e:	66 90                	xchg   %ax,%ax
    2370:	55                   	push   %rbp
    2371:	53                   	push   %rbx
    2372:	50                   	push   %rax
    2373:	89 f3                	mov    %esi,%ebx
    2375:	89 fd                	mov    %edi,%ebp
    2377:	8b 05 57 4d 10 01    	mov    0x1104d57(%rip),%eax        # 11070d4 <__cxa_finalize@plt+0x1106034>
    237d:	8d 48 01             	lea    0x1(%rax),%ecx
    2380:	0f af c8             	imul   %eax,%ecx
    2383:	f6 c1 01             	test   $0x1,%cl
    2386:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 23b3 <__cxa_finalize@plt+0x1313>
    238d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 239a <__cxa_finalize@plt+0x12fa>
    2394:	48 0f 44 c8          	cmove  %rax,%rcx
    2398:	ff e1                	jmp    *%rcx
    239a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    239f:	33 05 33 4d 10 01    	xor    0x1104d33(%rip),%eax        # 11070d8 <__cxa_finalize@plt+0x1106038>
    23a5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    23a8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    23ad:	89 05 25 4d 10 01    	mov    %eax,0x1104d25(%rip)        # 11070d8 <__cxa_finalize@plt+0x1106038>
    23b3:	8d 7b 5c             	lea    0x5c(%rbx),%edi
    23b6:	89 ee                	mov    %ebp,%esi
    23b8:	f7 d6                	not    %esi
    23ba:	83 e6 1f             	and    $0x1f,%esi
    23bd:	e8 ee fb ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    23c2:	31 c5                	xor    %eax,%ebp
    23c4:	81 c5 7c be ef db    	add    $0xdbefbe7c,%ebp
    23ca:	89 ef                	mov    %ebp,%edi
    23cc:	c1 ef 02             	shr    $0x2,%edi
    23cf:	31 ef                	xor    %ebp,%edi
    23d1:	be 02 00 00 00       	mov    $0x2,%esi
    23d6:	e8 d5 fb ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    23db:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    23e1:	ff c1                	inc    %ecx
    23e3:	31 c8                	xor    %ecx,%eax
    23e5:	48 83 c4 08          	add    $0x8,%rsp
    23e9:	5b                   	pop    %rbx
    23ea:	5d                   	pop    %rbp
    23eb:	c3                   	ret
    23ec:	0f 1f 40 00          	nopl   0x0(%rax)
    23f0:	55                   	push   %rbp
    23f1:	53                   	push   %rbx
    23f2:	50                   	push   %rax
    23f3:	89 f3                	mov    %esi,%ebx
    23f5:	89 fd                	mov    %edi,%ebp
    23f7:	8b 05 df 4c 10 01    	mov    0x1104cdf(%rip),%eax        # 11070dc <__cxa_finalize@plt+0x110603c>
    23fd:	8d 48 01             	lea    0x1(%rax),%ecx
    2400:	0f af c8             	imul   %eax,%ecx
    2403:	f6 c1 01             	test   $0x1,%cl
    2406:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2433 <__cxa_finalize@plt+0x1393>
    240d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 241a <__cxa_finalize@plt+0x137a>
    2414:	48 0f 44 c8          	cmove  %rax,%rcx
    2418:	ff e1                	jmp    *%rcx
    241a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    241f:	33 05 bb 4c 10 01    	xor    0x1104cbb(%rip),%eax        # 11070e0 <__cxa_finalize@plt+0x1106040>
    2425:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2428:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    242d:	89 05 ad 4c 10 01    	mov    %eax,0x1104cad(%rip)        # 11070e0 <__cxa_finalize@plt+0x1106040>
    2433:	8d 7b 67             	lea    0x67(%rbx),%edi
    2436:	89 ee                	mov    %ebp,%esi
    2438:	83 e6 1f             	and    $0x1f,%esi
    243b:	83 f6 09             	xor    $0x9,%esi
    243e:	e8 6d fb ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2443:	31 c5                	xor    %eax,%ebp
    2445:	81 c5 6f f9 51 a8    	add    $0xa851f96f,%ebp
    244b:	89 ef                	mov    %ebp,%edi
    244d:	c1 ef 05             	shr    $0x5,%edi
    2450:	31 ef                	xor    %ebp,%edi
    2452:	be 0a 00 00 00       	mov    $0xa,%esi
    2457:	e8 54 fb ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    245c:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2462:	83 c1 04             	add    $0x4,%ecx
    2465:	31 c8                	xor    %ecx,%eax
    2467:	48 83 c4 08          	add    $0x8,%rsp
    246b:	5b                   	pop    %rbx
    246c:	5d                   	pop    %rbp
    246d:	c3                   	ret
    246e:	66 90                	xchg   %ax,%ax
    2470:	55                   	push   %rbp
    2471:	53                   	push   %rbx
    2472:	50                   	push   %rax
    2473:	89 f3                	mov    %esi,%ebx
    2475:	89 fd                	mov    %edi,%ebp
    2477:	8b 05 67 4c 10 01    	mov    0x1104c67(%rip),%eax        # 11070e4 <__cxa_finalize@plt+0x1106044>
    247d:	8d 48 01             	lea    0x1(%rax),%ecx
    2480:	0f af c8             	imul   %eax,%ecx
    2483:	f6 c1 01             	test   $0x1,%cl
    2486:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 24b3 <__cxa_finalize@plt+0x1413>
    248d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 249a <__cxa_finalize@plt+0x13fa>
    2494:	48 0f 44 c8          	cmove  %rax,%rcx
    2498:	ff e1                	jmp    *%rcx
    249a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    249f:	33 05 43 4c 10 01    	xor    0x1104c43(%rip),%eax        # 11070e8 <__cxa_finalize@plt+0x1106048>
    24a5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    24a8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    24ad:	89 05 35 4c 10 01    	mov    %eax,0x1104c35(%rip)        # 11070e8 <__cxa_finalize@plt+0x1106048>
    24b3:	8d 7b 79             	lea    0x79(%rbx),%edi
    24b6:	89 ee                	mov    %ebp,%esi
    24b8:	83 e6 1f             	and    $0x1f,%esi
    24bb:	83 f6 15             	xor    $0x15,%esi
    24be:	e8 ed fa ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    24c3:	31 c5                	xor    %eax,%ebp
    24c5:	81 c5 71 88 38 c8    	add    $0xc8388871,%ebp
    24cb:	89 ef                	mov    %ebp,%edi
    24cd:	c1 ef 08             	shr    $0x8,%edi
    24d0:	31 ef                	xor    %ebp,%edi
    24d2:	be 0b 00 00 00       	mov    $0xb,%esi
    24d7:	e8 d4 fa ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    24dc:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    24e2:	83 c1 07             	add    $0x7,%ecx
    24e5:	31 c8                	xor    %ecx,%eax
    24e7:	48 83 c4 08          	add    $0x8,%rsp
    24eb:	5b                   	pop    %rbx
    24ec:	5d                   	pop    %rbp
    24ed:	c3                   	ret
    24ee:	66 90                	xchg   %ax,%ax
    24f0:	55                   	push   %rbp
    24f1:	53                   	push   %rbx
    24f2:	50                   	push   %rax
    24f3:	89 f3                	mov    %esi,%ebx
    24f5:	89 fd                	mov    %edi,%ebp
    24f7:	8b 05 ef 4b 10 01    	mov    0x1104bef(%rip),%eax        # 11070ec <__cxa_finalize@plt+0x110604c>
    24fd:	8d 48 01             	lea    0x1(%rax),%ecx
    2500:	0f af c8             	imul   %eax,%ecx
    2503:	f6 c1 01             	test   $0x1,%cl
    2506:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2533 <__cxa_finalize@plt+0x1493>
    250d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 251a <__cxa_finalize@plt+0x147a>
    2514:	48 0f 44 c8          	cmove  %rax,%rcx
    2518:	ff e1                	jmp    *%rcx
    251a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    251f:	33 05 cb 4b 10 01    	xor    0x1104bcb(%rip),%eax        # 11070f0 <__cxa_finalize@plt+0x1106050>
    2525:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2528:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    252d:	89 05 bd 4b 10 01    	mov    %eax,0x1104bbd(%rip)        # 11070f0 <__cxa_finalize@plt+0x1106050>
    2533:	8d bb 83 00 00 00    	lea    0x83(%rbx),%edi
    2539:	89 ee                	mov    %ebp,%esi
    253b:	83 e6 1f             	and    $0x1f,%esi
    253e:	83 f6 1b             	xor    $0x1b,%esi
    2541:	e8 6a fa ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2546:	31 c5                	xor    %eax,%ebp
    2548:	81 c5 ab 49 63 f6    	add    $0xf66349ab,%ebp
    254e:	89 ef                	mov    %ebp,%edi
    2550:	d1 ef                	shr    $1,%edi
    2552:	31 ef                	xor    %ebp,%edi
    2554:	be 18 00 00 00       	mov    $0x18,%esi
    2559:	e8 52 fa ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    255e:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2564:	31 c8                	xor    %ecx,%eax
    2566:	48 83 c4 08          	add    $0x8,%rsp
    256a:	5b                   	pop    %rbx
    256b:	5d                   	pop    %rbp
    256c:	c3                   	ret
    256d:	0f 1f 00             	nopl   (%rax)
    2570:	55                   	push   %rbp
    2571:	53                   	push   %rbx
    2572:	50                   	push   %rax
    2573:	89 f3                	mov    %esi,%ebx
    2575:	89 fd                	mov    %edi,%ebp
    2577:	8b 05 77 4b 10 01    	mov    0x1104b77(%rip),%eax        # 11070f4 <__cxa_finalize@plt+0x1106054>
    257d:	8d 48 01             	lea    0x1(%rax),%ecx
    2580:	0f af c8             	imul   %eax,%ecx
    2583:	f6 c1 01             	test   $0x1,%cl
    2586:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 25b3 <__cxa_finalize@plt+0x1513>
    258d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 259a <__cxa_finalize@plt+0x14fa>
    2594:	48 0f 44 c8          	cmove  %rax,%rcx
    2598:	ff e1                	jmp    *%rcx
    259a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    259f:	33 05 53 4b 10 01    	xor    0x1104b53(%rip),%eax        # 11070f8 <__cxa_finalize@plt+0x1106058>
    25a5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    25a8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    25ad:	89 05 45 4b 10 01    	mov    %eax,0x1104b45(%rip)        # 11070f8 <__cxa_finalize@plt+0x1106058>
    25b3:	8d bb 9d 00 00 00    	lea    0x9d(%rbx),%edi
    25b9:	89 ee                	mov    %ebp,%esi
    25bb:	83 e6 1f             	and    $0x1f,%esi
    25be:	83 f6 03             	xor    $0x3,%esi
    25c1:	e8 ea f9 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    25c6:	31 c5                	xor    %eax,%ebp
    25c8:	81 c5 75 a6 05 08    	add    $0x805a675,%ebp
    25ce:	89 ef                	mov    %ebp,%edi
    25d0:	c1 ef 06             	shr    $0x6,%edi
    25d3:	31 ef                	xor    %ebp,%edi
    25d5:	be 1b 00 00 00       	mov    $0x1b,%esi
    25da:	e8 d1 f9 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    25df:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    25e5:	83 c1 05             	add    $0x5,%ecx
    25e8:	31 c8                	xor    %ecx,%eax
    25ea:	48 83 c4 08          	add    $0x8,%rsp
    25ee:	5b                   	pop    %rbx
    25ef:	5d                   	pop    %rbp
    25f0:	c3                   	ret
    25f1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    25f8:	0f 1f 84 00 00 00 00
    25ff:	00
    2600:	55                   	push   %rbp
    2601:	53                   	push   %rbx
    2602:	50                   	push   %rax
    2603:	89 f3                	mov    %esi,%ebx
    2605:	89 fd                	mov    %edi,%ebp
    2607:	8b 05 ef 4a 10 01    	mov    0x1104aef(%rip),%eax        # 11070fc <__cxa_finalize@plt+0x110605c>
    260d:	8d 48 01             	lea    0x1(%rax),%ecx
    2610:	0f af c8             	imul   %eax,%ecx
    2613:	f6 c1 01             	test   $0x1,%cl
    2616:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2643 <__cxa_finalize@plt+0x15a3>
    261d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 262a <__cxa_finalize@plt+0x158a>
    2624:	48 0f 44 c8          	cmove  %rax,%rcx
    2628:	ff e1                	jmp    *%rcx
    262a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    262f:	33 05 cb 4a 10 01    	xor    0x1104acb(%rip),%eax        # 1107100 <__cxa_finalize@plt+0x1106060>
    2635:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2638:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    263d:	89 05 bd 4a 10 01    	mov    %eax,0x1104abd(%rip)        # 1107100 <__cxa_finalize@plt+0x1106060>
    2643:	8d bb a7 00 00 00    	lea    0xa7(%rbx),%edi
    2649:	89 ee                	mov    %ebp,%esi
    264b:	83 e6 1f             	and    $0x1f,%esi
    264e:	83 f6 0f             	xor    $0xf,%esi
    2651:	e8 5a f9 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2656:	31 c5                	xor    %eax,%ebp
    2658:	81 c5 af 67 30 36    	add    $0x363067af,%ebp
    265e:	89 ef                	mov    %ebp,%edi
    2660:	c1 ef 03             	shr    $0x3,%edi
    2663:	31 ef                	xor    %ebp,%edi
    2665:	be 0a 00 00 00       	mov    $0xa,%esi
    266a:	e8 41 f9 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    266f:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2675:	83 c1 02             	add    $0x2,%ecx
    2678:	31 c8                	xor    %ecx,%eax
    267a:	48 83 c4 08          	add    $0x8,%rsp
    267e:	5b                   	pop    %rbx
    267f:	5d                   	pop    %rbp
    2680:	c3                   	ret
    2681:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    2688:	0f 1f 84 00 00 00 00
    268f:	00
    2690:	55                   	push   %rbp
    2691:	53                   	push   %rbx
    2692:	50                   	push   %rax
    2693:	89 f3                	mov    %esi,%ebx
    2695:	89 fd                	mov    %edi,%ebp
    2697:	8b 05 67 4a 10 01    	mov    0x1104a67(%rip),%eax        # 1107104 <__cxa_finalize@plt+0x1106064>
    269d:	8d 48 01             	lea    0x1(%rax),%ecx
    26a0:	0f af c8             	imul   %eax,%ecx
    26a3:	f6 c1 01             	test   $0x1,%cl
    26a6:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 26d3 <__cxa_finalize@plt+0x1633>
    26ad:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 26ba <__cxa_finalize@plt+0x161a>
    26b4:	48 0f 44 c8          	cmove  %rax,%rcx
    26b8:	ff e1                	jmp    *%rcx
    26ba:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    26bf:	33 05 43 4a 10 01    	xor    0x1104a43(%rip),%eax        # 1107108 <__cxa_finalize@plt+0x1106068>
    26c5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    26c8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    26cd:	89 05 35 4a 10 01    	mov    %eax,0x1104a35(%rip)        # 1107108 <__cxa_finalize@plt+0x1106068>
    26d3:	8d bb b3 00 00 00    	lea    0xb3(%rbx),%edi
    26d9:	89 ee                	mov    %ebp,%esi
    26db:	83 e6 1f             	and    $0x1f,%esi
    26de:	83 f6 11             	xor    $0x11,%esi
    26e1:	e8 ca f8 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    26e6:	31 c5                	xor    %eax,%ebp
    26e8:	81 c5 5b 1c ca a0    	add    $0xa0ca1c5b,%ebp
    26ee:	89 ef                	mov    %ebp,%edi
    26f0:	c1 ef 05             	shr    $0x5,%edi
    26f3:	31 ef                	xor    %ebp,%edi
    26f5:	be 06 00 00 00       	mov    $0x6,%esi
    26fa:	e8 b1 f8 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    26ff:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2705:	83 c1 04             	add    $0x4,%ecx
    2708:	31 c8                	xor    %ecx,%eax
    270a:	48 83 c4 08          	add    $0x8,%rsp
    270e:	5b                   	pop    %rbx
    270f:	5d                   	pop    %rbp
    2710:	c3                   	ret
    2711:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    2718:	0f 1f 84 00 00 00 00
    271f:	00
    2720:	55                   	push   %rbp
    2721:	53                   	push   %rbx
    2722:	50                   	push   %rax
    2723:	89 f3                	mov    %esi,%ebx
    2725:	89 fd                	mov    %edi,%ebp
    2727:	8b 05 df 49 10 01    	mov    0x11049df(%rip),%eax        # 110710c <__cxa_finalize@plt+0x110606c>
    272d:	8d 48 01             	lea    0x1(%rax),%ecx
    2730:	0f af c8             	imul   %eax,%ecx
    2733:	f6 c1 01             	test   $0x1,%cl
    2736:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2763 <__cxa_finalize@plt+0x16c3>
    273d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 274a <__cxa_finalize@plt+0x16aa>
    2744:	48 0f 44 c8          	cmove  %rax,%rcx
    2748:	ff e1                	jmp    *%rcx
    274a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    274f:	33 05 bb 49 10 01    	xor    0x11049bb(%rip),%eax        # 1107110 <__cxa_finalize@plt+0x1106070>
    2755:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2758:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    275d:	89 05 ad 49 10 01    	mov    %eax,0x11049ad(%rip)        # 1107110 <__cxa_finalize@plt+0x1106070>
    2763:	8d bb c5 00 00 00    	lea    0xc5(%rbx),%edi
    2769:	89 ee                	mov    %ebp,%esi
    276b:	83 e6 1f             	and    $0x1f,%esi
    276e:	83 f6 17             	xor    $0x17,%esi
    2771:	e8 3a f8 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2776:	31 c5                	xor    %eax,%ebp
    2778:	81 c5 5d ab b0 c0    	add    $0xc0b0ab5d,%ebp
    277e:	89 ef                	mov    %ebp,%edi
    2780:	c1 ef 02             	shr    $0x2,%edi
    2783:	31 ef                	xor    %ebp,%edi
    2785:	be 13 00 00 00       	mov    $0x13,%esi
    278a:	e8 21 f8 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    278f:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2795:	ff c1                	inc    %ecx
    2797:	31 c8                	xor    %ecx,%eax
    2799:	48 83 c4 08          	add    $0x8,%rsp
    279d:	5b                   	pop    %rbx
    279e:	5d                   	pop    %rbp
    279f:	c3                   	ret
    27a0:	55                   	push   %rbp
    27a1:	53                   	push   %rbx
    27a2:	50                   	push   %rax
    27a3:	89 f3                	mov    %esi,%ebx
    27a5:	89 fd                	mov    %edi,%ebp
    27a7:	8b 05 67 49 10 01    	mov    0x1104967(%rip),%eax        # 1107114 <__cxa_finalize@plt+0x1106074>
    27ad:	8d 48 01             	lea    0x1(%rax),%ecx
    27b0:	0f af c8             	imul   %eax,%ecx
    27b3:	f6 c1 01             	test   $0x1,%cl
    27b6:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 27e3 <__cxa_finalize@plt+0x1743>
    27bd:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 27ca <__cxa_finalize@plt+0x172a>
    27c4:	48 0f 44 c8          	cmove  %rax,%rcx
    27c8:	ff e1                	jmp    *%rcx
    27ca:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    27cf:	33 05 43 49 10 01    	xor    0x1104943(%rip),%eax        # 1107118 <__cxa_finalize@plt+0x1106078>
    27d5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    27d8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    27dd:	89 05 35 49 10 01    	mov    %eax,0x1104935(%rip)        # 1107118 <__cxa_finalize@plt+0x1106078>
    27e3:	8d bb d9 00 00 00    	lea    0xd9(%rbx),%edi
    27e9:	89 ee                	mov    %ebp,%esi
    27eb:	83 e6 1f             	and    $0x1f,%esi
    27ee:	83 f6 1b             	xor    $0x1b,%esi
    27f1:	e8 ba f7 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    27f6:	31 c5                	xor    %eax,%ebp
    27f8:	81 c5 d1 2d 06 1d    	add    $0x1d062dd1,%ebp
    27fe:	89 ef                	mov    %ebp,%edi
    2800:	c1 ef 07             	shr    $0x7,%edi
    2803:	31 ef                	xor    %ebp,%edi
    2805:	be 04 00 00 00       	mov    $0x4,%esi
    280a:	e8 a1 f7 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    280f:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2815:	83 c1 06             	add    $0x6,%ecx
    2818:	31 c8                	xor    %ecx,%eax
    281a:	48 83 c4 08          	add    $0x8,%rsp
    281e:	5b                   	pop    %rbx
    281f:	5d                   	pop    %rbp
    2820:	c3                   	ret
    2821:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    2828:	0f 1f 84 00 00 00 00
    282f:	00
    2830:	55                   	push   %rbp
    2831:	53                   	push   %rbx
    2832:	50                   	push   %rax
    2833:	89 f3                	mov    %esi,%ebx
    2835:	89 fd                	mov    %edi,%ebp
    2837:	8b 05 df 48 10 01    	mov    0x11048df(%rip),%eax        # 110711c <__cxa_finalize@plt+0x110607c>
    283d:	8d 48 01             	lea    0x1(%rax),%ecx
    2840:	0f af c8             	imul   %eax,%ecx
    2843:	f6 c1 01             	test   $0x1,%cl
    2846:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2873 <__cxa_finalize@plt+0x17d3>
    284d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 285a <__cxa_finalize@plt+0x17ba>
    2854:	48 0f 44 c8          	cmove  %rax,%rcx
    2858:	ff e1                	jmp    *%rcx
    285a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    285f:	33 05 bb 48 10 01    	xor    0x11048bb(%rip),%eax        # 1107120 <__cxa_finalize@plt+0x1106080>
    2865:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2868:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    286d:	89 05 ad 48 10 01    	mov    %eax,0x11048ad(%rip)        # 1107120 <__cxa_finalize@plt+0x1106080>
    2873:	8d bb e1 00 00 00    	lea    0xe1(%rbx),%edi
    2879:	89 ee                	mov    %ebp,%esi
    287b:	83 e6 1f             	and    $0x1f,%esi
    287e:	83 f6 01             	xor    $0x1,%esi
    2881:	e8 2a f7 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2886:	31 c5                	xor    %eax,%ebp
    2888:	81 c5 99 fb c1 0e    	add    $0xec1fb99,%ebp
    288e:	89 ef                	mov    %ebp,%edi
    2890:	c1 ef 04             	shr    $0x4,%edi
    2893:	31 ef                	xor    %ebp,%edi
    2895:	be 03 00 00 00       	mov    $0x3,%esi
    289a:	e8 11 f7 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    289f:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    28a5:	83 c1 03             	add    $0x3,%ecx
    28a8:	31 c8                	xor    %ecx,%eax
    28aa:	48 83 c4 08          	add    $0x8,%rsp
    28ae:	5b                   	pop    %rbx
    28af:	5d                   	pop    %rbp
    28b0:	c3                   	ret
    28b1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    28b8:	0f 1f 84 00 00 00 00
    28bf:	00
    28c0:	55                   	push   %rbp
    28c1:	53                   	push   %rbx
    28c2:	50                   	push   %rax
    28c3:	89 f3                	mov    %esi,%ebx
    28c5:	89 fd                	mov    %edi,%ebp
    28c7:	8b 05 57 48 10 01    	mov    0x1104857(%rip),%eax        # 1107124 <__cxa_finalize@plt+0x1106084>
    28cd:	8d 48 01             	lea    0x1(%rax),%ecx
    28d0:	0f af c8             	imul   %eax,%ecx
    28d3:	f6 c1 01             	test   $0x1,%cl
    28d6:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2903 <__cxa_finalize@plt+0x1863>
    28dd:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 28ea <__cxa_finalize@plt+0x184a>
    28e4:	48 0f 44 c8          	cmove  %rax,%rcx
    28e8:	ff e1                	jmp    *%rcx
    28ea:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    28ef:	33 05 33 48 10 01    	xor    0x1104833(%rip),%eax        # 1107128 <__cxa_finalize@plt+0x1106088>
    28f5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    28f8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    28fd:	89 05 25 48 10 01    	mov    %eax,0x1104825(%rip)        # 1107128 <__cxa_finalize@plt+0x1106088>
    2903:	8d bb f7 00 00 00    	lea    0xf7(%rbx),%edi
    2909:	89 ee                	mov    %ebp,%esi
    290b:	83 e6 1f             	and    $0x1f,%esi
    290e:	83 f6 07             	xor    $0x7,%esi
    2911:	e8 9a f6 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2916:	31 c5                	xor    %eax,%ebp
    2918:	81 c5 7f 71 86 a7    	add    $0xa786717f,%ebp
    291e:	89 ef                	mov    %ebp,%edi
    2920:	c1 ef 08             	shr    $0x8,%edi
    2923:	31 ef                	xor    %ebp,%edi
    2925:	be 17 00 00 00       	mov    $0x17,%esi
    292a:	e8 81 f6 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    292f:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    2935:	83 c1 07             	add    $0x7,%ecx
    2938:	31 c8                	xor    %ecx,%eax
    293a:	48 83 c4 08          	add    $0x8,%rsp
    293e:	5b                   	pop    %rbx
    293f:	5d                   	pop    %rbp
    2940:	c3                   	ret
    2941:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    2948:	0f 1f 84 00 00 00 00
    294f:	00
    2950:	55                   	push   %rbp
    2951:	53                   	push   %rbx
    2952:	50                   	push   %rax
    2953:	89 f3                	mov    %esi,%ebx
    2955:	89 fd                	mov    %edi,%ebp
    2957:	8b 05 cf 47 10 01    	mov    0x11047cf(%rip),%eax        # 110712c <__cxa_finalize@plt+0x110608c>
    295d:	8d 48 01             	lea    0x1(%rax),%ecx
    2960:	0f af c8             	imul   %eax,%ecx
    2963:	f6 c1 01             	test   $0x1,%cl
    2966:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2993 <__cxa_finalize@plt+0x18f3>
    296d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 297a <__cxa_finalize@plt+0x18da>
    2974:	48 0f 44 c8          	cmove  %rax,%rcx
    2978:	ff e1                	jmp    *%rcx
    297a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    297f:	33 05 ab 47 10 01    	xor    0x11047ab(%rip),%eax        # 1107130 <__cxa_finalize@plt+0x1106090>
    2985:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2988:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    298d:	89 05 9d 47 10 01    	mov    %eax,0x110479d(%rip)        # 1107130 <__cxa_finalize@plt+0x1106090>
    2993:	8d 7b 1d             	lea    0x1d(%rbx),%edi
    2996:	89 ee                	mov    %ebp,%esi
    2998:	83 e6 1f             	and    $0x1f,%esi
    299b:	83 f6 0b             	xor    $0xb,%esi
    299e:	e8 0d f6 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    29a3:	31 c5                	xor    %eax,%ebp
    29a5:	81 c5 f5 c9 48 ec    	add    $0xec48c9f5,%ebp
    29ab:	89 ef                	mov    %ebp,%edi
    29ad:	d1 ef                	shr    $1,%edi
    29af:	31 ef                	xor    %ebp,%edi
    29b1:	be 16 00 00 00       	mov    $0x16,%esi
    29b6:	e8 f5 f5 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    29bb:	69 cb 3b 9f 5d 04    	imul   $0x45d9f3b,%ebx,%ecx
    29c1:	31 c8                	xor    %ecx,%eax
    29c3:	48 83 c4 08          	add    $0x8,%rsp
    29c7:	5b                   	pop    %rbx
    29c8:	5d                   	pop    %rbp
    29c9:	c3                   	ret
    29ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    29d0:	55                   	push   %rbp
    29d1:	41 57                	push   %r15
    29d3:	41 56                	push   %r14
    29d5:	41 55                	push   %r13
    29d7:	41 54                	push   %r12
    29d9:	53                   	push   %rbx
    29da:	50                   	push   %rax
    29db:	89 f3                	mov    %esi,%ebx
    29dd:	48 89 fd             	mov    %rdi,%rbp
    29e0:	8b 05 4e 47 10 01    	mov    0x110474e(%rip),%eax        # 1107134 <__cxa_finalize@plt+0x1106094>
    29e6:	8d 48 01             	lea    0x1(%rax),%ecx
    29e9:	0f af c8             	imul   %eax,%ecx
    29ec:	f6 c1 01             	test   $0x1,%cl
    29ef:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2a1c <__cxa_finalize@plt+0x197c>
    29f6:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2a03 <__cxa_finalize@plt+0x1963>
    29fd:	48 0f 44 c8          	cmove  %rax,%rcx
    2a01:	ff e1                	jmp    *%rcx
    2a03:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2a08:	33 05 2a 47 10 01    	xor    0x110472a(%rip),%eax        # 1107138 <__cxa_finalize@plt+0x1106098>
    2a0e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2a11:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2a16:	89 05 1c 47 10 01    	mov    %eax,0x110471c(%rip)        # 1107138 <__cxa_finalize@plt+0x1106098>
    2a1c:	0f b7 c3             	movzwl %bx,%eax
    2a1f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    2a23:	81 f3 37 9e 00 00    	xor    $0x9e37,%ebx
    2a29:	45 31 ff             	xor    %r15d,%r15d
    2a2c:	45 31 ed             	xor    %r13d,%r13d
    2a2f:	45 31 e4             	xor    %r12d,%r12d
    2a32:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    2a39:	1f 84 00 00 00 00 00
    2a40:	6b db 6d             	imul   $0x6d,%ebx,%ebx
    2a43:	83 c3 3d             	add    $0x3d,%ebx
    2a46:	44 0f b7 f3          	movzwl %bx,%r14d
    2a4a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
    2a4e:	44 89 fe             	mov    %r15d,%esi
    2a51:	44 89 e2             	mov    %r12d,%edx
    2a54:	e8 97 02 00 00       	call   2cf0 <__cxa_finalize@plt+0x1c50>
    2a59:	41 c1 ee 07          	shr    $0x7,%r14d
    2a5d:	41 8d 4d bb          	lea    -0x45(%r13),%ecx
    2a61:	41 8d 55 03          	lea    0x3(%r13),%edx
    2a65:	49 83 fc 0a          	cmp    $0xa,%r12
    2a69:	0f 43 d1             	cmovae %ecx,%edx
    2a6c:	48 8d 0d ed 27 10 01 	lea    0x11027ed(%rip),%rcx        # 1105260 <__cxa_finalize@plt+0x11041c0>
    2a73:	0f b6 0c 0a          	movzbl (%rdx,%rcx,1),%ecx
    2a77:	0f b6 c0             	movzbl %al,%eax
    2a7a:	44 31 f0             	xor    %r14d,%eax
    2a7d:	31 d8                	xor    %ebx,%eax
    2a7f:	31 c8                	xor    %ecx,%eax
    2a81:	24 0f                	and    $0xf,%al
    2a83:	42 88 44 25 00       	mov    %al,0x0(%rbp,%r12,1)
    2a88:	49 83 fc 0f          	cmp    $0xf,%r12
    2a8c:	48 8d 05 ad ff ff ff 	lea    -0x53(%rip),%rax        # 2a40 <__cxa_finalize@plt+0x19a0>
    2a93:	48 8d 0d 14 00 00 00 	lea    0x14(%rip),%rcx        # 2aae <__cxa_finalize@plt+0x1a0e>
    2a9a:	48 0f 44 c1          	cmove  %rcx,%rax
    2a9e:	49 ff c4             	inc    %r12
    2aa1:	49 83 c5 07          	add    $0x7,%r13
    2aa5:	41 81 c7 11 11 00 00 	add    $0x1111,%r15d
    2aac:	ff e0                	jmp    *%rax
    2aae:	48 83 c4 08          	add    $0x8,%rsp
    2ab2:	5b                   	pop    %rbx
    2ab3:	41 5c                	pop    %r12
    2ab5:	41 5d                	pop    %r13
    2ab7:	41 5e                	pop    %r14
    2ab9:	41 5f                	pop    %r15
    2abb:	5d                   	pop    %rbp
    2abc:	c3                   	ret
    2abd:	0f 1f 00             	nopl   (%rax)
    2ac0:	8b 05 76 46 10 01    	mov    0x1104676(%rip),%eax        # 110713c <__cxa_finalize@plt+0x110609c>
    2ac6:	8d 48 01             	lea    0x1(%rax),%ecx
    2ac9:	0f af c8             	imul   %eax,%ecx
    2acc:	f6 c1 01             	test   $0x1,%cl
    2acf:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2afc <__cxa_finalize@plt+0x1a5c>
    2ad6:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2ae3 <__cxa_finalize@plt+0x1a43>
    2add:	48 0f 44 c8          	cmove  %rax,%rcx
    2ae1:	ff e1                	jmp    *%rcx
    2ae3:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2ae8:	33 05 52 46 10 01    	xor    0x1104652(%rip),%eax        # 1107140 <__cxa_finalize@plt+0x11060a0>
    2aee:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2af1:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2af6:	89 05 44 46 10 01    	mov    %eax,0x1104644(%rip)        # 1107140 <__cxa_finalize@plt+0x11060a0>
    2afc:	55                   	push   %rbp
    2afd:	41 57                	push   %r15
    2aff:	41 56                	push   %r14
    2b01:	53                   	push   %rbx
    2b02:	b8 03 00 00 00       	mov    $0x3,%eax
    2b07:	41 b0 05             	mov    $0x5,%r8b
    2b0a:	45 31 c9             	xor    %r9d,%r9d
    2b0d:	4c 8d 15 4c 27 10 01 	lea    0x110274c(%rip),%r10        # 1105260 <__cxa_finalize@plt+0x11041c0>
    2b14:	0f b7 f6             	movzwl %si,%esi
    2b17:	4c 8d 1d 86 00 00 00 	lea    0x86(%rip),%r11        # 2ba4 <__cxa_finalize@plt+0x1b04>
    2b1e:	48 8d 1d 0b 00 00 00 	lea    0xb(%rip),%rbx        # 2b30 <__cxa_finalize@plt+0x1a90>
    2b25:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    2b2c:	00 00 00 00
    2b30:	45 0f b6 c0          	movzbl %r8b,%r8d
    2b34:	41 6b c8 39          	imul   $0x39,%r8d,%ecx
    2b38:	c1 e9 09             	shr    $0x9,%ecx
    2b3b:	83 e1 f8             	and    $0xfffffff8,%ecx
    2b3e:	8d 0c c9             	lea    (%rcx,%rcx,8),%ecx
    2b41:	44 89 c5             	mov    %r8d,%ebp
    2b44:	40 28 cd             	sub    %cl,%bpl
    2b47:	44 0f b6 f5          	movzbl %bpl,%r14d
    2b4b:	44 89 c9             	mov    %r9d,%ecx
    2b4e:	80 e1 08             	and    $0x8,%cl
    2b51:	89 f5                	mov    %esi,%ebp
    2b53:	d3 ed                	shr    %cl,%ebp
    2b55:	0f b6 4c 02 fd       	movzbl -0x3(%rdx,%rax,1),%ecx
    2b5a:	c0 e1 04             	shl    $0x4,%cl
    2b5d:	41 89 c7             	mov    %eax,%r15d
    2b60:	41 83 e7 0f          	and    $0xf,%r15d
    2b64:	42 0a 0c 3a          	or     (%rdx,%r15,1),%cl
    2b68:	43 32 2c 16          	xor    (%r14,%r10,1),%bpl
    2b6c:	40 30 cd             	xor    %cl,%bpl
    2b6f:	40 0f b6 cd          	movzbl %bpl,%ecx
    2b73:	44 69 f1 ab 00 00 00 	imul   $0xab,%ecx,%r14d
    2b7a:	41 c1 ee 09          	shr    $0x9,%r14d
    2b7e:	43 8d 2c 76          	lea    (%r14,%r14,2),%ebp
    2b82:	40 28 e9             	sub    %bpl,%cl
    2b85:	fe c1                	inc    %cl
    2b87:	48 83 f8 12          	cmp    $0x12,%rax
    2b8b:	49 89 de             	mov    %rbx,%r14
    2b8e:	4d 0f 44 f3          	cmove  %r11,%r14
    2b92:	88 4c 07 fd          	mov    %cl,-0x3(%rdi,%rax,1)
    2b96:	41 83 c1 08          	add    $0x8,%r9d
    2b9a:	48 ff c0             	inc    %rax
    2b9d:	41 80 c0 0b          	add    $0xb,%r8b
    2ba1:	41 ff e6             	jmp    *%r14
    2ba4:	c6 07 01             	movb   $0x1,(%rdi)
    2ba7:	c6 47 05 02          	movb   $0x2,0x5(%rdi)
    2bab:	c6 47 0a 03          	movb   $0x3,0xa(%rdi)
    2baf:	5b                   	pop    %rbx
    2bb0:	41 5e                	pop    %r14
    2bb2:	41 5f                	pop    %r15
    2bb4:	5d                   	pop    %rbp
    2bb5:	c3                   	ret
    2bb6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    2bbd:	00 00 00
    2bc0:	48 89 fe             	mov    %rdi,%rsi
    2bc3:	8b 05 7b 45 10 01    	mov    0x110457b(%rip),%eax        # 1107144 <__cxa_finalize@plt+0x11060a4>
    2bc9:	8d 48 01             	lea    0x1(%rax),%ecx
    2bcc:	0f af c8             	imul   %eax,%ecx
    2bcf:	f6 c1 01             	test   $0x1,%cl
    2bd2:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2bff <__cxa_finalize@plt+0x1b5f>
    2bd9:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2be6 <__cxa_finalize@plt+0x1b46>
    2be0:	48 0f 44 c8          	cmove  %rax,%rcx
    2be4:	ff e1                	jmp    *%rcx
    2be6:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2beb:	33 05 57 45 10 01    	xor    0x1104557(%rip),%eax        # 1107148 <__cxa_finalize@plt+0x11060a8>
    2bf1:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2bf4:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2bf9:	89 05 49 45 10 01    	mov    %eax,0x1104549(%rip)        # 1107148 <__cxa_finalize@plt+0x11060a8>
    2bff:	bf 01 00 00 00       	mov    $0x1,%edi
    2c04:	31 d2                	xor    %edx,%edx
    2c06:	31 c9                	xor    %ecx,%ecx
    2c08:	45 31 c0             	xor    %r8d,%r8d
    2c0b:	e9 60 01 00 00       	jmp    2d70 <__cxa_finalize@plt+0x1cd0>
    2c10:	55                   	push   %rbp
    2c11:	53                   	push   %rbx
    2c12:	50                   	push   %rax
    2c13:	48 89 fb             	mov    %rdi,%rbx
    2c16:	8b 05 30 45 10 01    	mov    0x1104530(%rip),%eax        # 110714c <__cxa_finalize@plt+0x11060ac>
    2c1c:	8d 48 01             	lea    0x1(%rax),%ecx
    2c1f:	0f af c8             	imul   %eax,%ecx
    2c22:	f6 c1 01             	test   $0x1,%cl
    2c25:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2c52 <__cxa_finalize@plt+0x1bb2>
    2c2c:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2c39 <__cxa_finalize@plt+0x1b99>
    2c33:	48 0f 44 c8          	cmove  %rax,%rcx
    2c37:	ff e1                	jmp    *%rcx
    2c39:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2c3e:	33 05 0c 45 10 01    	xor    0x110450c(%rip),%eax        # 1107150 <__cxa_finalize@plt+0x11060b0>
    2c44:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2c47:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2c4c:	89 05 fe 44 10 01    	mov    %eax,0x11044fe(%rip)        # 1107150 <__cxa_finalize@plt+0x11060b0>
    2c52:	31 ed                	xor    %ebp,%ebp
    2c54:	83 fe 03             	cmp    $0x3,%esi
    2c57:	74 5a                	je     2cb3 <__cxa_finalize@plt+0x1c13>
    2c59:	83 fe 02             	cmp    $0x2,%esi
    2c5c:	74 2d                	je     2c8b <__cxa_finalize@plt+0x1beb>
    2c5e:	83 fe 01             	cmp    $0x1,%esi
    2c61:	75 7b                	jne    2cde <__cxa_finalize@plt+0x1c3e>
    2c63:	48 89 df             	mov    %rbx,%rdi
    2c66:	e8 d5 04 00 00       	call   3140 <__cxa_finalize@plt+0x20a0>
    2c6b:	85 c0                	test   %eax,%eax
    2c6d:	48 8d 05 6a 00 00 00 	lea    0x6a(%rip),%rax        # 2cde <__cxa_finalize@plt+0x1c3e>
    2c74:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2c81 <__cxa_finalize@plt+0x1be1>
    2c7b:	48 0f 44 c8          	cmove  %rax,%rcx
    2c7f:	ff e1                	jmp    *%rcx
    2c81:	48 89 df             	mov    %rbx,%rdi
    2c84:	e8 57 05 00 00       	call   31e0 <__cxa_finalize@plt+0x2140>
    2c89:	eb 4e                	jmp    2cd9 <__cxa_finalize@plt+0x1c39>
    2c8b:	48 89 df             	mov    %rbx,%rdi
    2c8e:	e8 3d 06 00 00       	call   32d0 <__cxa_finalize@plt+0x2230>
    2c93:	85 c0                	test   %eax,%eax
    2c95:	48 8d 05 42 00 00 00 	lea    0x42(%rip),%rax        # 2cde <__cxa_finalize@plt+0x1c3e>
    2c9c:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2ca9 <__cxa_finalize@plt+0x1c09>
    2ca3:	48 0f 44 c8          	cmove  %rax,%rcx
    2ca7:	ff e1                	jmp    *%rcx
    2ca9:	48 89 df             	mov    %rbx,%rdi
    2cac:	e8 af 06 00 00       	call   3360 <__cxa_finalize@plt+0x22c0>
    2cb1:	eb 26                	jmp    2cd9 <__cxa_finalize@plt+0x1c39>
    2cb3:	48 89 df             	mov    %rbx,%rdi
    2cb6:	e8 45 08 00 00       	call   3500 <__cxa_finalize@plt+0x2460>
    2cbb:	85 c0                	test   %eax,%eax
    2cbd:	48 8d 05 1a 00 00 00 	lea    0x1a(%rip),%rax        # 2cde <__cxa_finalize@plt+0x1c3e>
    2cc4:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2cd1 <__cxa_finalize@plt+0x1c31>
    2ccb:	48 0f 44 c8          	cmove  %rax,%rcx
    2ccf:	ff e1                	jmp    *%rcx
    2cd1:	48 89 df             	mov    %rbx,%rdi
    2cd4:	e8 a7 08 00 00       	call   3580 <__cxa_finalize@plt+0x24e0>
    2cd9:	bd 01 00 00 00       	mov    $0x1,%ebp
    2cde:	89 e8                	mov    %ebp,%eax
    2ce0:	48 83 c4 08          	add    $0x8,%rsp
    2ce4:	5b                   	pop    %rbx
    2ce5:	5d                   	pop    %rbp
    2ce6:	c3                   	ret
    2ce7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2cee:	00 00
    2cf0:	55                   	push   %rbp
    2cf1:	41 56                	push   %r14
    2cf3:	53                   	push   %rbx
    2cf4:	89 d3                	mov    %edx,%ebx
    2cf6:	89 f5                	mov    %esi,%ebp
    2cf8:	41 89 fe             	mov    %edi,%r14d
    2cfb:	8b 05 53 44 10 01    	mov    0x1104453(%rip),%eax        # 1107154 <__cxa_finalize@plt+0x11060b4>
    2d01:	8d 48 01             	lea    0x1(%rax),%ecx
    2d04:	0f af c8             	imul   %eax,%ecx
    2d07:	f6 c1 01             	test   $0x1,%cl
    2d0a:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2d37 <__cxa_finalize@plt+0x1c97>
    2d11:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2d1e <__cxa_finalize@plt+0x1c7e>
    2d18:	48 0f 44 c8          	cmove  %rax,%rcx
    2d1c:	ff e1                	jmp    *%rcx
    2d1e:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2d23:	33 05 2f 44 10 01    	xor    0x110442f(%rip),%eax        # 1107158 <__cxa_finalize@plt+0x11060b8>
    2d29:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2d2c:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2d31:	89 05 21 44 10 01    	mov    %eax,0x1104421(%rip)        # 1107158 <__cxa_finalize@plt+0x11060b8>
    2d37:	89 de                	mov    %ebx,%esi
    2d39:	83 e6 1f             	and    $0x1f,%esi
    2d3c:	89 ef                	mov    %ebp,%edi
    2d3e:	e8 6d f2 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2d43:	44 89 f6             	mov    %r14d,%esi
    2d46:	41 31 de             	xor    %ebx,%r14d
    2d49:	41 31 c6             	xor    %eax,%r14d
    2d4c:	31 c0                	xor    %eax,%eax
    2d4e:	41 f6 c6 01          	test   $0x1,%r14b
    2d52:	0f 94 c0             	sete   %al
    2d55:	8d 3c 40             	lea    (%rax,%rax,2),%edi
    2d58:	89 ea                	mov    %ebp,%edx
    2d5a:	89 d9                	mov    %ebx,%ecx
    2d5c:	45 31 c0             	xor    %r8d,%r8d
    2d5f:	e8 0c 00 00 00       	call   2d70 <__cxa_finalize@plt+0x1cd0>
    2d64:	5b                   	pop    %rbx
    2d65:	41 5e                	pop    %r14
    2d67:	5d                   	pop    %rbp
    2d68:	c3                   	ret
    2d69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2d70:	8b 05 e6 43 10 01    	mov    0x11043e6(%rip),%eax        # 110715c <__cxa_finalize@plt+0x11060bc>
    2d76:	44 8d 48 01          	lea    0x1(%rax),%r9d
    2d7a:	44 0f af c8          	imul   %eax,%r9d
    2d7e:	41 f6 c1 01          	test   $0x1,%r9b
    2d82:	48 8d 05 27 00 00 00 	lea    0x27(%rip),%rax        # 2db0 <__cxa_finalize@plt+0x1d10>
    2d89:	4c 8d 0d 07 00 00 00 	lea    0x7(%rip),%r9        # 2d97 <__cxa_finalize@plt+0x1cf7>
    2d90:	4c 0f 44 c8          	cmove  %rax,%r9
    2d94:	41 ff e1             	jmp    *%r9
    2d97:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2d9c:	33 05 be 43 10 01    	xor    0x11043be(%rip),%eax        # 1107160 <__cxa_finalize@plt+0x11060c0>
    2da2:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2da5:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2daa:	89 05 b0 43 10 01    	mov    %eax,0x11043b0(%rip)        # 1107160 <__cxa_finalize@plt+0x11060c0>
    2db0:	50                   	push   %rax
    2db1:	31 c0                	xor    %eax,%eax
    2db3:	05 47 52 45 4d       	add    $0x4d455247,%eax
    2db8:	31 c0                	xor    %eax,%eax
    2dba:	83 ff 02             	cmp    $0x2,%edi
    2dbd:	74 25                	je     2de4 <__cxa_finalize@plt+0x1d44>
    2dbf:	83 ff 01             	cmp    $0x1,%edi
    2dc2:	74 14                	je     2dd8 <__cxa_finalize@plt+0x1d38>
    2dc4:	85 ff                	test   %edi,%edi
    2dc6:	75 33                	jne    2dfb <__cxa_finalize@plt+0x1d5b>
    2dc8:	89 f7                	mov    %esi,%edi
    2dca:	89 d6                	mov    %edx,%esi
    2dcc:	89 ca                	mov    %ecx,%edx
    2dce:	e8 3d 00 00 00       	call   2e10 <__cxa_finalize@plt+0x1d70>
    2dd3:	0f b6 c8             	movzbl %al,%ecx
    2dd6:	eb 2c                	jmp    2e04 <__cxa_finalize@plt+0x1d64>
    2dd8:	48 89 f7             	mov    %rsi,%rdi
    2ddb:	e8 80 01 00 00       	call   2f60 <__cxa_finalize@plt+0x1ec0>
    2de0:	89 c1                	mov    %eax,%ecx
    2de2:	eb 20                	jmp    2e04 <__cxa_finalize@plt+0x1d64>
    2de4:	0f b6 c2             	movzbl %dl,%eax
    2de7:	0f b6 d1             	movzbl %cl,%edx
    2dea:	41 0f b7 c8          	movzwl %r8w,%ecx
    2dee:	89 f7                	mov    %esi,%edi
    2df0:	89 c6                	mov    %eax,%esi
    2df2:	e8 f9 01 00 00       	call   2ff0 <__cxa_finalize@plt+0x1f50>
    2df7:	89 c1                	mov    %eax,%ecx
    2df9:	eb 09                	jmp    2e04 <__cxa_finalize@plt+0x1d64>
    2dfb:	48 31 f2             	xor    %rsi,%rdx
    2dfe:	4c 31 c1             	xor    %r8,%rcx
    2e01:	48 31 d1             	xor    %rdx,%rcx
    2e04:	48 89 c8             	mov    %rcx,%rax
    2e07:	59                   	pop    %rcx
    2e08:	c3                   	ret
    2e09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2e10:	55                   	push   %rbp
    2e11:	41 57                	push   %r15
    2e13:	41 56                	push   %r14
    2e15:	41 55                	push   %r13
    2e17:	41 54                	push   %r12
    2e19:	53                   	push   %rbx
    2e1a:	50                   	push   %rax
    2e1b:	89 d3                	mov    %edx,%ebx
    2e1d:	41 89 f6             	mov    %esi,%r14d
    2e20:	41 89 ff             	mov    %edi,%r15d
    2e23:	8b 05 3b 43 10 01    	mov    0x110433b(%rip),%eax        # 1107164 <__cxa_finalize@plt+0x11060c4>
    2e29:	8d 48 01             	lea    0x1(%rax),%ecx
    2e2c:	0f af c8             	imul   %eax,%ecx
    2e2f:	f6 c1 01             	test   $0x1,%cl
    2e32:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2e5f <__cxa_finalize@plt+0x1dbf>
    2e39:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2e46 <__cxa_finalize@plt+0x1da6>
    2e40:	48 0f 44 c8          	cmove  %rax,%rcx
    2e44:	ff e1                	jmp    *%rcx
    2e46:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2e4b:	33 05 17 43 10 01    	xor    0x1104317(%rip),%eax        # 1107168 <__cxa_finalize@plt+0x11060c8>
    2e51:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2e54:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2e59:	89 05 09 43 10 01    	mov    %eax,0x1104309(%rip)        # 1107168 <__cxa_finalize@plt+0x11060c8>
    2e5f:	31 c0                	xor    %eax,%eax
    2e61:	05 47 4d 58 4d       	add    $0x4d584d47,%eax
    2e66:	31 c0                	xor    %eax,%eax
    2e68:	41 69 ef b1 79 37 00 	imul   $0x3779b1,%r15d,%ebp
    2e6f:	41 8d be 3b 9f 5d 04 	lea    0x45d9f3b(%r14),%edi
    2e76:	89 de                	mov    %ebx,%esi
    2e78:	44 31 fe             	xor    %r15d,%esi
    2e7b:	83 e6 1f             	and    $0x1f,%esi
    2e7e:	e8 2d f1 ff ff       	call   1fb0 <__cxa_finalize@plt+0xf10>
    2e83:	44 69 e3 15 7c 4a 00 	imul   $0x4a7c15,%ebx,%r12d
    2e8a:	41 31 ec             	xor    %ebp,%r12d
    2e8d:	41 31 c4             	xor    %eax,%r12d
    2e90:	45 89 e5             	mov    %r12d,%r13d
    2e93:	41 81 e5 ff ff ff 00 	and    $0xffffff,%r13d
    2e9a:	41 81 e7 ff 0f 00 00 	and    $0xfff,%r15d
    2ea1:	43 8d 04 27          	lea    (%r15,%r12,1),%eax
    2ea5:	05 23 f1 01 00       	add    $0x1f123,%eax
    2eaa:	25 ff ff ff 00       	and    $0xffffff,%eax
    2eaf:	44 89 f1             	mov    %r14d,%ecx
    2eb2:	c1 e1 04             	shl    $0x4,%ecx
    2eb5:	44 01 f1             	add    %r14d,%ecx
    2eb8:	44 31 e1             	xor    %r12d,%ecx
    2ebb:	81 e1 ff ff ff 00    	and    $0xffffff,%ecx
    2ec1:	48 81 f1 cc 33 aa 00 	xor    $0xaa33cc,%rcx
    2ec8:	69 d3 83 00 00 00    	imul   $0x83,%ebx,%edx
    2ece:	44 01 e2             	add    %r12d,%edx
    2ed1:	81 c2 f1 d8 02 00    	add    $0x2d8f1,%edx
    2ed7:	81 e2 ff ff ff 00    	and    $0xffffff,%edx
    2edd:	4c 8d 35 3c 21 10 00 	lea    0x10213c(%rip),%r14        # 105020 <__cxa_finalize@plt+0x103f80>
    2ee4:	41 0f b6 3c 06       	movzbl (%r14,%rax,1),%edi
    2ee9:	41 0f b6 2c 0e       	movzbl (%r14,%rcx,1),%ebp
    2eee:	45 0f b6 3c 16       	movzbl (%r14,%rdx,1),%r15d
    2ef3:	89 de                	mov    %ebx,%esi
    2ef5:	83 e6 07             	and    $0x7,%esi
    2ef8:	e8 93 01 00 00       	call   3090 <__cxa_finalize@plt+0x1ff0>
    2efd:	88 44 24 07          	mov    %al,0x7(%rsp)
    2f01:	83 c3 03             	add    $0x3,%ebx
    2f04:	83 e3 07             	and    $0x7,%ebx
    2f07:	89 ef                	mov    %ebp,%edi
    2f09:	89 de                	mov    %ebx,%esi
    2f0b:	e8 80 01 00 00       	call   3090 <__cxa_finalize@plt+0x1ff0>
    2f10:	41 c1 ec 0b          	shr    $0xb,%r12d
    2f14:	47 32 24 2e          	xor    (%r14,%r13,1),%r12b
    2f18:	44 32 64 24 07       	xor    0x7(%rsp),%r12b
    2f1d:	41 30 c4             	xor    %al,%r12b
    2f20:	45 30 fc             	xor    %r15b,%r12b
    2f23:	41 c1 e7 08          	shl    $0x8,%r15d
    2f27:	41 0f b6 dc          	movzbl %r12b,%ebx
    2f2b:	41 09 df             	or     %ebx,%r15d
    2f2e:	41 0f b7 ff          	movzwl %r15w,%edi
    2f32:	e8 a9 01 00 00       	call   30e0 <__cxa_finalize@plt+0x2040>
    2f37:	89 c5                	mov    %eax,%ebp
    2f39:	89 df                	mov    %ebx,%edi
    2f3b:	be 05 00 00 00       	mov    $0x5,%esi
    2f40:	e8 4b 01 00 00       	call   3090 <__cxa_finalize@plt+0x1ff0>
    2f45:	40 30 e8             	xor    %bpl,%al
    2f48:	48 83 c4 08          	add    $0x8,%rsp
    2f4c:	5b                   	pop    %rbx
    2f4d:	41 5c                	pop    %r12
    2f4f:	41 5d                	pop    %r13
    2f51:	41 5e                	pop    %r14
    2f53:	41 5f                	pop    %r15
    2f55:	5d                   	pop    %rbp
    2f56:	c3                   	ret
    2f57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2f5e:	00 00
    2f60:	55                   	push   %rbp
    2f61:	41 56                	push   %r14
    2f63:	53                   	push   %rbx
    2f64:	48 89 fb             	mov    %rdi,%rbx
    2f67:	8b 05 ff 41 10 01    	mov    0x11041ff(%rip),%eax        # 110716c <__cxa_finalize@plt+0x11060cc>
    2f6d:	8d 48 01             	lea    0x1(%rax),%ecx
    2f70:	0f af c8             	imul   %eax,%ecx
    2f73:	f6 c1 01             	test   $0x1,%cl
    2f76:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 2fa3 <__cxa_finalize@plt+0x1f03>
    2f7d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 2f8a <__cxa_finalize@plt+0x1eea>
    2f84:	48 0f 44 c8          	cmove  %rax,%rcx
    2f88:	ff e1                	jmp    *%rcx
    2f8a:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    2f8f:	33 05 db 41 10 01    	xor    0x11041db(%rip),%eax        # 1107170 <__cxa_finalize@plt+0x11060d0>
    2f95:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2f98:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    2f9d:	89 05 cd 41 10 01    	mov    %eax,0x11041cd(%rip)        # 1107170 <__cxa_finalize@plt+0x11060d0>
    2fa3:	31 c0                	xor    %eax,%eax
    2fa5:	05 54 41 54 53       	add    $0x53544154,%eax
    2faa:	31 c0                	xor    %eax,%eax
    2fac:	0f b7 3b             	movzwl (%rbx),%edi
    2faf:	8b ab 10 01 00 00    	mov    0x110(%rbx),%ebp
    2fb5:	89 e9                	mov    %ebp,%ecx
    2fb7:	80 e1 07             	and    $0x7,%cl
    2fba:	41 89 fe             	mov    %edi,%r14d
    2fbd:	41 d3 ee             	shr    %cl,%r14d
    2fc0:	8b b3 0c 01 00 00    	mov    0x10c(%rbx),%esi
    2fc6:	01 ee                	add    %ebp,%esi
    2fc8:	44 33 b3 18 01 00 00 	xor    0x118(%rbx),%r14d
    2fcf:	ba 02 00 00 00       	mov    $0x2,%edx
    2fd4:	e8 77 ee ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    2fd9:	31 e8                	xor    %ebp,%eax
    2fdb:	44 31 f0             	xor    %r14d,%eax
    2fde:	83 e0 0f             	and    $0xf,%eax
    2fe1:	0f b6 84 03 ee 00 00 	movzbl 0xee(%rbx,%rax,1),%eax
    2fe8:	00
    2fe9:	5b                   	pop    %rbx
    2fea:	41 5e                	pop    %r14
    2fec:	5d                   	pop    %rbp
    2fed:	c3                   	ret
    2fee:	66 90                	xchg   %ax,%ax
    2ff0:	55                   	push   %rbp
    2ff1:	53                   	push   %rbx
    2ff2:	50                   	push   %rax
    2ff3:	89 fb                	mov    %edi,%ebx
    2ff5:	8b 05 79 41 10 01    	mov    0x1104179(%rip),%eax        # 1107174 <__cxa_finalize@plt+0x11060d4>
    2ffb:	8d 78 01             	lea    0x1(%rax),%edi
    2ffe:	0f af f8             	imul   %eax,%edi
    3001:	40 f6 c7 01          	test   $0x1,%dil
    3005:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 3032 <__cxa_finalize@plt+0x1f92>
    300c:	48 8d 3d 06 00 00 00 	lea    0x6(%rip),%rdi        # 3019 <__cxa_finalize@plt+0x1f79>
    3013:	48 0f 44 f8          	cmove  %rax,%rdi
    3017:	ff e7                	jmp    *%rdi
    3019:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    301e:	33 05 54 41 10 01    	xor    0x1104154(%rip),%eax        # 1107178 <__cxa_finalize@plt+0x11060d8>
    3024:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3027:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    302c:	89 05 46 41 10 01    	mov    %eax,0x1104146(%rip)        # 1107178 <__cxa_finalize@plt+0x11060d8>
    3032:	31 c0                	xor    %eax,%eax
    3034:	05 48 53 41 48       	add    $0x48415348,%eax
    3039:	31 c0                	xor    %eax,%eax
    303b:	40 0f b6 c6          	movzbl %sil,%eax
    303f:	31 c3                	xor    %eax,%ebx
    3041:	c1 e1 10             	shl    $0x10,%ecx
    3044:	09 d9                	or     %ebx,%ecx
    3046:	0f b6 ea             	movzbl %dl,%ebp
    3049:	89 ee                	mov    %ebp,%esi
    304b:	c1 e6 08             	shl    $0x8,%esi
    304e:	09 c6                	or     %eax,%esi
    3050:	89 cf                	mov    %ecx,%edi
    3052:	ba 09 00 00 00       	mov    $0x9,%edx
    3057:	e8 b4 fd ff ff       	call   2e10 <__cxa_finalize@plt+0x1d70>
    305c:	0f b6 c8             	movzbl %al,%ecx
    305f:	89 c8                	mov    %ecx,%eax
    3061:	83 e0 1f             	and    $0x1f,%eax
    3064:	01 d8                	add    %ebx,%eax
    3066:	69 c0 83 00 00 00    	imul   $0x83,%eax,%eax
    306c:	01 e8                	add    %ebp,%eax
    306e:	89 c2                	mov    %eax,%edx
    3070:	31 ca                	xor    %ecx,%edx
    3072:	81 f2 ff 00 ff 00    	xor    $0xff00ff,%edx
    3078:	21 c8                	and    %ecx,%eax
    307a:	83 e0 0f             	and    $0xf,%eax
    307d:	01 d0                	add    %edx,%eax
    307f:	48 83 c4 08          	add    $0x8,%rsp
    3083:	5b                   	pop    %rbx
    3084:	5d                   	pop    %rbp
    3085:	c3                   	ret
    3086:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    308d:	00 00 00
    3090:	89 f1                	mov    %esi,%ecx
    3092:	8b 05 e4 40 10 01    	mov    0x11040e4(%rip),%eax        # 110717c <__cxa_finalize@plt+0x11060dc>
    3098:	8d 50 01             	lea    0x1(%rax),%edx
    309b:	0f af d0             	imul   %eax,%edx
    309e:	f6 c2 01             	test   $0x1,%dl
    30a1:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 30ce <__cxa_finalize@plt+0x202e>
    30a8:	48 8d 15 06 00 00 00 	lea    0x6(%rip),%rdx        # 30b5 <__cxa_finalize@plt+0x2015>
    30af:	48 0f 44 d0          	cmove  %rax,%rdx
    30b3:	ff e2                	jmp    *%rdx
    30b5:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    30ba:	33 05 c0 40 10 01    	xor    0x11040c0(%rip),%eax        # 1107180 <__cxa_finalize@plt+0x11060e0>
    30c0:	8d 04 40             	lea    (%rax,%rax,2),%eax
    30c3:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    30c8:	89 05 b2 40 10 01    	mov    %eax,0x11040b2(%rip)        # 1107180 <__cxa_finalize@plt+0x11060e0>
    30ce:	40 0f b6 d7          	movzbl %dil,%edx
    30d2:	40 d2 c7             	rol    %cl,%dil
    30d5:	f6 c1 07             	test   $0x7,%cl
    30d8:	40 0f b6 c7          	movzbl %dil,%eax
    30dc:	0f 44 c2             	cmove  %edx,%eax
    30df:	c3                   	ret
    30e0:	8b 05 9e 40 10 01    	mov    0x110409e(%rip),%eax        # 1107184 <__cxa_finalize@plt+0x11060e4>
    30e6:	8d 48 01             	lea    0x1(%rax),%ecx
    30e9:	0f af c8             	imul   %eax,%ecx
    30ec:	f6 c1 01             	test   $0x1,%cl
    30ef:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 311c <__cxa_finalize@plt+0x207c>
    30f6:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3103 <__cxa_finalize@plt+0x2063>
    30fd:	48 0f 44 c8          	cmove  %rax,%rcx
    3101:	ff e1                	jmp    *%rcx
    3103:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3108:	33 05 7a 40 10 01    	xor    0x110407a(%rip),%eax        # 1107188 <__cxa_finalize@plt+0x11060e8>
    310e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3111:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3116:	89 05 6c 40 10 01    	mov    %eax,0x110406c(%rip)        # 1107188 <__cxa_finalize@plt+0x11060e8>
    311c:	8d 04 fd 00 00 00 00 	lea    0x0(,%rdi,8),%eax
    3123:	31 f8                	xor    %edi,%eax
    3125:	0f b7 c8             	movzwl %ax,%ecx
    3128:	c1 e9 05             	shr    $0x5,%ecx
    312b:	31 c1                	xor    %eax,%ecx
    312d:	6b c1 5d             	imul   $0x5d,%ecx,%eax
    3130:	c3                   	ret
    3131:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    3138:	0f 1f 84 00 00 00 00
    313f:	00
    3140:	8b 05 46 40 10 01    	mov    0x1104046(%rip),%eax        # 110718c <__cxa_finalize@plt+0x11060ec>
    3146:	8d 48 01             	lea    0x1(%rax),%ecx
    3149:	0f af c8             	imul   %eax,%ecx
    314c:	f6 c1 01             	test   $0x1,%cl
    314f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 317c <__cxa_finalize@plt+0x20dc>
    3156:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3163 <__cxa_finalize@plt+0x20c3>
    315d:	48 0f 44 c8          	cmove  %rax,%rcx
    3161:	ff e1                	jmp    *%rcx
    3163:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3168:	33 05 22 40 10 01    	xor    0x1104022(%rip),%eax        # 1107190 <__cxa_finalize@plt+0x11060f0>
    316e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3171:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3176:	89 05 14 40 10 01    	mov    %eax,0x1104014(%rip)        # 1107190 <__cxa_finalize@plt+0x11060f0>
    317c:	8b 8f 04 01 00 00    	mov    0x104(%rdi),%ecx
    3182:	83 f9 48             	cmp    $0x48,%ecx
    3185:	48 8d 15 45 00 00 00 	lea    0x45(%rip),%rdx        # 31d1 <__cxa_finalize@plt+0x2131>
    318c:	48 8d 35 08 00 00 00 	lea    0x8(%rip),%rsi        # 319b <__cxa_finalize@plt+0x20fb>
    3193:	48 0f 43 f2          	cmovae %rdx,%rsi
    3197:	31 c0                	xor    %eax,%eax
    3199:	ff e6                	jmp    *%rsi
    319b:	3b 8f 0c 01 00 00    	cmp    0x10c(%rdi),%ecx
    31a1:	48 8d 35 06 00 00 00 	lea    0x6(%rip),%rsi        # 31ae <__cxa_finalize@plt+0x210e>
    31a8:	48 0f 47 f2          	cmova  %rdx,%rsi
    31ac:	ff e6                	jmp    *%rsi
    31ae:	83 f9 03             	cmp    $0x3,%ecx
    31b1:	48 8d 35 0b 00 00 00 	lea    0xb(%rip),%rsi        # 31c3 <__cxa_finalize@plt+0x2123>
    31b8:	48 0f 42 f2          	cmovb  %rdx,%rsi
    31bc:	b8 01 00 00 00       	mov    $0x1,%eax
    31c1:	ff e6                	jmp    *%rsi
    31c3:	83 c1 fd             	add    $0xfffffffd,%ecx
    31c6:	31 c0                	xor    %eax,%eax
    31c8:	39 8f 08 01 00 00    	cmp    %ecx,0x108(%rdi)
    31ce:	0f 97 c0             	seta   %al
    31d1:	c3                   	ret
    31d2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    31d9:	1f 84 00 00 00 00 00
    31e0:	55                   	push   %rbp
    31e1:	41 57                	push   %r15
    31e3:	41 56                	push   %r14
    31e5:	53                   	push   %rbx
    31e6:	50                   	push   %rax
    31e7:	48 89 fb             	mov    %rdi,%rbx
    31ea:	8b 05 a4 3f 10 01    	mov    0x1103fa4(%rip),%eax        # 1107194 <__cxa_finalize@plt+0x11060f4>
    31f0:	8d 48 01             	lea    0x1(%rax),%ecx
    31f3:	0f af c8             	imul   %eax,%ecx
    31f6:	f6 c1 01             	test   $0x1,%cl
    31f9:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 3226 <__cxa_finalize@plt+0x2186>
    3200:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 320d <__cxa_finalize@plt+0x216d>
    3207:	48 0f 44 c8          	cmove  %rax,%rcx
    320b:	ff e1                	jmp    *%rcx
    320d:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3212:	33 05 80 3f 10 01    	xor    0x1103f80(%rip),%eax        # 1107198 <__cxa_finalize@plt+0x11060f8>
    3218:	8d 04 40             	lea    (%rax,%rax,2),%eax
    321b:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3220:	89 05 72 3f 10 01    	mov    %eax,0x1103f72(%rip)        # 1107198 <__cxa_finalize@plt+0x11060f8>
    3226:	44 8b b3 04 01 00 00 	mov    0x104(%rbx),%r14d
    322d:	49 83 fe 03          	cmp    $0x3,%r14
    3231:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # 3245 <__cxa_finalize@plt+0x21a5>
    3238:	48 8d 0d 11 00 00 00 	lea    0x11(%rip),%rcx        # 3250 <__cxa_finalize@plt+0x21b0>
    323f:	48 0f 43 c8          	cmovae %rax,%rcx
    3243:	ff e1                	jmp    *%rcx
    3245:	41 8d 46 fd          	lea    -0x3(%r14),%eax
    3249:	0f b6 6c 03 06       	movzbl 0x6(%rbx,%rax,1),%ebp
    324e:	eb 14                	jmp    3264 <__cxa_finalize@plt+0x21c4>
    3250:	0f b7 33             	movzwl (%rbx),%esi
    3253:	48 8d 93 de 00 00 00 	lea    0xde(%rbx),%rdx
    325a:	44 89 f7             	mov    %r14d,%edi
    325d:	e8 ee 03 00 00       	call   3650 <__cxa_finalize@plt+0x25b0>
    3262:	89 c5                	mov    %eax,%ebp
    3264:	0f b7 3b             	movzwl (%rbx),%edi
    3267:	44 89 f6             	mov    %r14d,%esi
    326a:	ba 01 00 00 00       	mov    $0x1,%edx
    326f:	e8 dc eb ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    3274:	41 89 c7             	mov    %eax,%r15d
    3277:	89 c7                	mov    %eax,%edi
    3279:	44 31 f7             	xor    %r14d,%edi
    327c:	e8 6f ee ff ff       	call   20f0 <__cxa_finalize@plt+0x1050>
    3281:	41 80 e7 0f          	and    $0xf,%r15b
    3285:	41 30 ef             	xor    %bpl,%r15b
    3288:	41 0f b6 cf          	movzbl %r15b,%ecx
    328c:	41 80 f7 0f          	xor    $0xf,%r15b
    3290:	85 c0                	test   %eax,%eax
    3292:	41 0f b6 ef          	movzbl %r15b,%ebp
    3296:	0f 45 e9             	cmovne %ecx,%ebp
    3299:	0f b7 33             	movzwl (%rbx),%esi
    329c:	48 8d 93 de 00 00 00 	lea    0xde(%rbx),%rdx
    32a3:	44 89 f7             	mov    %r14d,%edi
    32a6:	e8 25 04 00 00       	call   36d0 <__cxa_finalize@plt+0x2630>
    32ab:	40 30 e8             	xor    %bpl,%al
    32ae:	42 88 44 33 4e       	mov    %al,0x4e(%rbx,%r14,1)
    32b3:	41 8d 46 01          	lea    0x1(%r14),%eax
    32b7:	89 83 04 01 00 00    	mov    %eax,0x104(%rbx)
    32bd:	48 83 c4 08          	add    $0x8,%rsp
    32c1:	5b                   	pop    %rbx
    32c2:	41 5e                	pop    %r14
    32c4:	41 5f                	pop    %r15
    32c6:	5d                   	pop    %rbp
    32c7:	c3                   	ret
    32c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    32cf:	00
    32d0:	8b 05 c6 3e 10 01    	mov    0x1103ec6(%rip),%eax        # 110719c <__cxa_finalize@plt+0x11060fc>
    32d6:	8d 48 01             	lea    0x1(%rax),%ecx
    32d9:	0f af c8             	imul   %eax,%ecx
    32dc:	f6 c1 01             	test   $0x1,%cl
    32df:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 330c <__cxa_finalize@plt+0x226c>
    32e6:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 32f3 <__cxa_finalize@plt+0x2253>
    32ed:	48 0f 44 c8          	cmove  %rax,%rcx
    32f1:	ff e1                	jmp    *%rcx
    32f3:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    32f8:	33 05 a2 3e 10 01    	xor    0x1103ea2(%rip),%eax        # 11071a0 <__cxa_finalize@plt+0x1106100>
    32fe:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3301:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3306:	89 05 94 3e 10 01    	mov    %eax,0x1103e94(%rip)        # 11071a0 <__cxa_finalize@plt+0x1106100>
    330c:	8b 8f 08 01 00 00    	mov    0x108(%rdi),%ecx
    3312:	83 f9 48             	cmp    $0x48,%ecx
    3315:	48 8d 15 43 00 00 00 	lea    0x43(%rip),%rdx        # 335f <__cxa_finalize@plt+0x22bf>
    331c:	48 8d 35 08 00 00 00 	lea    0x8(%rip),%rsi        # 332b <__cxa_finalize@plt+0x228b>
    3323:	48 0f 43 f2          	cmovae %rdx,%rsi
    3327:	31 c0                	xor    %eax,%eax
    3329:	ff e6                	jmp    *%rsi
    332b:	3b 8f 0c 01 00 00    	cmp    0x10c(%rdi),%ecx
    3331:	48 8d 35 06 00 00 00 	lea    0x6(%rip),%rsi        # 333e <__cxa_finalize@plt+0x229e>
    3338:	48 0f 47 f2          	cmova  %rdx,%rsi
    333c:	ff e6                	jmp    *%rsi
    333e:	85 c9                	test   %ecx,%ecx
    3340:	48 8d 35 0b 00 00 00 	lea    0xb(%rip),%rsi        # 3352 <__cxa_finalize@plt+0x22b2>
    3347:	48 0f 44 f2          	cmove  %rdx,%rsi
    334b:	b8 01 00 00 00       	mov    $0x1,%eax
    3350:	ff e6                	jmp    *%rsi
    3352:	ff c9                	dec    %ecx
    3354:	31 c0                	xor    %eax,%eax
    3356:	39 8f 04 01 00 00    	cmp    %ecx,0x104(%rdi)
    335c:	0f 97 c0             	seta   %al
    335f:	c3                   	ret
    3360:	55                   	push   %rbp
    3361:	41 57                	push   %r15
    3363:	41 56                	push   %r14
    3365:	41 55                	push   %r13
    3367:	41 54                	push   %r12
    3369:	53                   	push   %rbx
    336a:	50                   	push   %rax
    336b:	48 89 fb             	mov    %rdi,%rbx
    336e:	8b 05 30 3e 10 01    	mov    0x1103e30(%rip),%eax        # 11071a4 <__cxa_finalize@plt+0x1106104>
    3374:	8d 48 01             	lea    0x1(%rax),%ecx
    3377:	0f af c8             	imul   %eax,%ecx
    337a:	f6 c1 01             	test   $0x1,%cl
    337d:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 33aa <__cxa_finalize@plt+0x230a>
    3384:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3391 <__cxa_finalize@plt+0x22f1>
    338b:	48 0f 44 c8          	cmove  %rax,%rcx
    338f:	ff e1                	jmp    *%rcx
    3391:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3396:	33 05 0c 3e 10 01    	xor    0x1103e0c(%rip),%eax        # 11071a8 <__cxa_finalize@plt+0x1106108>
    339c:	8d 04 40             	lea    (%rax,%rax,2),%eax
    339f:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    33a4:	89 05 fe 3d 10 01    	mov    %eax,0x1103dfe(%rip)        # 11071a8 <__cxa_finalize@plt+0x1106108>
    33aa:	44 8b b3 08 01 00 00 	mov    0x108(%rbx),%r14d
    33b1:	49 83 fe 03          	cmp    $0x3,%r14
    33b5:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # 33c9 <__cxa_finalize@plt+0x2329>
    33bc:	48 8d 0d 32 00 00 00 	lea    0x32(%rip),%rcx        # 33f5 <__cxa_finalize@plt+0x2355>
    33c3:	48 0f 43 c8          	cmovae %rax,%rcx
    33c7:	ff e1                	jmp    *%rcx
    33c9:	41 8d 46 fd          	lea    -0x3(%r14),%eax
    33cd:	0f b6 44 03 4e       	movzbl 0x4e(%rbx,%rax,1),%eax
    33d2:	41 83 fe 07          	cmp    $0x7,%r14d
    33d6:	48 8d 0d 0d 00 00 00 	lea    0xd(%rip),%rcx        # 33ea <__cxa_finalize@plt+0x234a>
    33dd:	48 8d 15 4b 00 00 00 	lea    0x4b(%rip),%rdx        # 342f <__cxa_finalize@plt+0x238f>
    33e4:	48 0f 43 d1          	cmovae %rcx,%rdx
    33e8:	ff e2                	jmp    *%rdx
    33ea:	41 8d 4e f9          	lea    -0x7(%r14),%ecx
    33ee:	0f b6 54 0b 4e       	movzbl 0x4e(%rbx,%rcx,1),%edx
    33f3:	eb 45                	jmp    343a <__cxa_finalize@plt+0x239a>
    33f5:	0f b7 13             	movzwl (%rbx),%edx
    33f8:	41 8d 4e 01          	lea    0x1(%r14),%ecx
    33fc:	89 d0                	mov    %edx,%eax
    33fe:	d3 e8                	shr    %cl,%eax
    3400:	44 89 f1             	mov    %r14d,%ecx
    3403:	80 c9 04             	or     $0x4,%cl
    3406:	d3 ea                	shr    %cl,%edx
    3408:	4d 85 f6             	test   %r14,%r14
    340b:	48 8d 0d 0d 00 00 00 	lea    0xd(%rip),%rcx        # 341f <__cxa_finalize@plt+0x237f>
    3412:	48 8d 35 21 00 00 00 	lea    0x21(%rip),%rsi        # 343a <__cxa_finalize@plt+0x239a>
    3419:	48 0f 44 f1          	cmove  %rcx,%rsi
    341d:	ff e6                	jmp    *%rsi
    341f:	0f b6 0b             	movzbl (%rbx),%ecx
    3422:	80 f1 a6             	xor    $0xa6,%cl
    3425:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%rsp)
    342c:	00
    342d:	eb 1c                	jmp    344b <__cxa_finalize@plt+0x23ab>
    342f:	0f b7 13             	movzwl (%rbx),%edx
    3432:	44 89 f1             	mov    %r14d,%ecx
    3435:	80 f1 04             	xor    $0x4,%cl
    3438:	d3 ea                	shr    %cl,%edx
    343a:	41 8d 4e ff          	lea    -0x1(%r14),%ecx
    343e:	0f b6 4c 0b 06       	movzbl 0x6(%rbx,%rcx,1),%ecx
    3443:	41 8d 76 01          	lea    0x1(%r14),%esi
    3447:	89 74 24 04          	mov    %esi,0x4(%rsp)
    344b:	4c 8d bb de 00 00 00 	lea    0xde(%rbx),%r15
    3452:	44 0f b7 43 02       	movzwl 0x2(%rbx),%r8d
    3457:	0f b6 e8             	movzbl %al,%ebp
    345a:	44 0f b6 e2          	movzbl %dl,%r12d
    345e:	0f b6 d1             	movzbl %cl,%edx
    3461:	89 ef                	mov    %ebp,%edi
    3463:	44 89 e6             	mov    %r12d,%esi
    3466:	4c 89 f9             	mov    %r15,%rcx
    3469:	e8 b2 07 00 00       	call   3c20 <__cxa_finalize@plt+0x2b80>
    346e:	89 e9                	mov    %ebp,%ecx
    3470:	c1 e1 08             	shl    $0x8,%ecx
    3473:	44 09 e1             	or     %r12d,%ecx
    3476:	66 33 0b             	xor    (%rbx),%cx
    3479:	41 89 c5             	mov    %eax,%r13d
    347c:	0f b7 7b 02          	movzwl 0x2(%rbx),%edi
    3480:	48 8d 53 04          	lea    0x4(%rbx),%rdx
    3484:	0f b7 f1             	movzwl %cx,%esi
    3487:	e8 e4 08 00 00       	call   3d70 <__cxa_finalize@plt+0x2cd0>
    348c:	66 89 43 02          	mov    %ax,0x2(%rbx)
    3490:	41 0f b6 d5          	movzbl %r13b,%edx
    3494:	44 0f b7 c0          	movzwl %ax,%r8d
    3498:	89 ef                	mov    %ebp,%edi
    349a:	44 89 e6             	mov    %r12d,%esi
    349d:	4c 89 f9             	mov    %r15,%rcx
    34a0:	e8 7b 07 00 00       	call   3c20 <__cxa_finalize@plt+0x2b80>
    34a5:	89 c5                	mov    %eax,%ebp
    34a7:	8b 43 04             	mov    0x4(%rbx),%eax
    34aa:	01 c0                	add    %eax,%eax
    34ac:	66 33 43 02          	xor    0x2(%rbx),%ax
    34b0:	0f b7 f8             	movzwl %ax,%edi
    34b3:	e8 28 fc ff ff       	call   30e0 <__cxa_finalize@plt+0x2040>
    34b8:	40 30 e8             	xor    %bpl,%al
    34bb:	42 88 44 33 06       	mov    %al,0x6(%rbx,%r14,1)
    34c0:	8b 03                	mov    (%rbx),%eax
    34c2:	c1 e0 10             	shl    $0x10,%eax
    34c5:	0f b7 7b 02          	movzwl 0x2(%rbx),%edi
    34c9:	09 c7                	or     %eax,%edi
    34cb:	44 89 f6             	mov    %r14d,%esi
    34ce:	ba 08 00 00 00       	mov    $0x8,%edx
    34d3:	e8 78 e9 ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    34d8:	24 1f                	and    $0x1f,%al
    34da:	42 30 44 33 06       	xor    %al,0x6(%rbx,%r14,1)
    34df:	8b 44 24 04          	mov    0x4(%rsp),%eax
    34e3:	89 83 08 01 00 00    	mov    %eax,0x108(%rbx)
    34e9:	48 83 c4 08          	add    $0x8,%rsp
    34ed:	5b                   	pop    %rbx
    34ee:	41 5c                	pop    %r12
    34f0:	41 5d                	pop    %r13
    34f2:	41 5e                	pop    %r14
    34f4:	41 5f                	pop    %r15
    34f6:	5d                   	pop    %rbp
    34f7:	c3                   	ret
    34f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    34ff:	00
    3500:	8b 05 a6 3c 10 01    	mov    0x1103ca6(%rip),%eax        # 11071ac <__cxa_finalize@plt+0x110610c>
    3506:	8d 48 01             	lea    0x1(%rax),%ecx
    3509:	0f af c8             	imul   %eax,%ecx
    350c:	f6 c1 01             	test   $0x1,%cl
    350f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 353c <__cxa_finalize@plt+0x249c>
    3516:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3523 <__cxa_finalize@plt+0x2483>
    351d:	48 0f 44 c8          	cmove  %rax,%rcx
    3521:	ff e1                	jmp    *%rcx
    3523:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3528:	33 05 82 3c 10 01    	xor    0x1103c82(%rip),%eax        # 11071b0 <__cxa_finalize@plt+0x1106110>
    352e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3531:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3536:	89 05 74 3c 10 01    	mov    %eax,0x1103c74(%rip)        # 11071b0 <__cxa_finalize@plt+0x1106110>
    353c:	8b 8f 0c 01 00 00    	mov    0x10c(%rdi),%ecx
    3542:	83 f9 48             	cmp    $0x48,%ecx
    3545:	48 8d 35 0f 00 00 00 	lea    0xf(%rip),%rsi        # 355b <__cxa_finalize@plt+0x24bb>
    354c:	48 8d 15 26 00 00 00 	lea    0x26(%rip),%rdx        # 3579 <__cxa_finalize@plt+0x24d9>
    3553:	48 0f 43 f2          	cmovae %rdx,%rsi
    3557:	31 c0                	xor    %eax,%eax
    3559:	ff e6                	jmp    *%rsi
    355b:	39 8f 04 01 00 00    	cmp    %ecx,0x104(%rdi)
    3561:	48 8d 35 06 00 00 00 	lea    0x6(%rip),%rsi        # 356e <__cxa_finalize@plt+0x24ce>
    3568:	48 0f 47 d6          	cmova  %rsi,%rdx
    356c:	ff e2                	jmp    *%rdx
    356e:	31 c0                	xor    %eax,%eax
    3570:	39 8f 08 01 00 00    	cmp    %ecx,0x108(%rdi)
    3576:	0f 97 c0             	seta   %al
    3579:	c3                   	ret
    357a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3580:	55                   	push   %rbp
    3581:	41 56                	push   %r14
    3583:	53                   	push   %rbx
    3584:	48 89 fb             	mov    %rdi,%rbx
    3587:	8b 05 27 3c 10 01    	mov    0x1103c27(%rip),%eax        # 11071b4 <__cxa_finalize@plt+0x1106114>
    358d:	8d 48 01             	lea    0x1(%rax),%ecx
    3590:	0f af c8             	imul   %eax,%ecx
    3593:	f6 c1 01             	test   $0x1,%cl
    3596:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 35c3 <__cxa_finalize@plt+0x2523>
    359d:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 35aa <__cxa_finalize@plt+0x250a>
    35a4:	48 0f 44 c8          	cmove  %rax,%rcx
    35a8:	ff e1                	jmp    *%rcx
    35aa:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    35af:	33 05 03 3c 10 01    	xor    0x1103c03(%rip),%eax        # 11071b8 <__cxa_finalize@plt+0x1106118>
    35b5:	8d 04 40             	lea    (%rax,%rax,2),%eax
    35b8:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    35bd:	89 05 f5 3b 10 01    	mov    %eax,0x1103bf5(%rip)        # 11071b8 <__cxa_finalize@plt+0x1106118>
    35c3:	44 8b b3 0c 01 00 00 	mov    0x10c(%rbx),%r14d
    35ca:	44 89 f0             	mov    %r14d,%eax
    35cd:	83 e0 0f             	and    $0xf,%eax
    35d0:	0f b6 84 03 de 00 00 	movzbl 0xde(%rbx,%rax,1),%eax
    35d7:	00
    35d8:	42 32 44 33 06       	xor    0x6(%rbx,%r14,1),%al
    35dd:	0f b7 4b 04          	movzwl 0x4(%rbx),%ecx
    35e1:	66 33 4b 02          	xor    0x2(%rbx),%cx
    35e5:	c1 e1 08             	shl    $0x8,%ecx
    35e8:	0f b6 c0             	movzbl %al,%eax
    35eb:	09 c8                	or     %ecx,%eax
    35ed:	0f b7 f8             	movzwl %ax,%edi
    35f0:	e8 eb fa ff ff       	call   30e0 <__cxa_finalize@plt+0x2040>
    35f5:	42 32 44 33 4e       	xor    0x4e(%rbx,%r14,1),%al
    35fa:	32 83 fe 00 00 00    	xor    0xfe(%rbx),%al
    3600:	42 88 84 33 96 00 00 	mov    %al,0x96(%rbx,%r14,1)
    3607:	00
    3608:	8b bb 00 01 00 00    	mov    0x100(%rbx),%edi
    360e:	0f b6 b3 fe 00 00 00 	movzbl 0xfe(%rbx),%esi
    3615:	0f b7 0b             	movzwl (%rbx),%ecx
    3618:	0f b6 e8             	movzbl %al,%ebp
    361b:	89 ea                	mov    %ebp,%edx
    361d:	e8 2e 08 00 00       	call   3e50 <__cxa_finalize@plt+0x2db0>
    3622:	89 83 00 01 00 00    	mov    %eax,0x100(%rbx)
    3628:	48 89 df             	mov    %rbx,%rdi
    362b:	44 89 f6             	mov    %r14d,%esi
    362e:	89 ea                	mov    %ebp,%edx
    3630:	e8 ab 08 00 00       	call   3ee0 <__cxa_finalize@plt+0x2e40>
    3635:	40 88 ab fe 00 00 00 	mov    %bpl,0xfe(%rbx)
    363c:	41 8d 46 01          	lea    0x1(%r14),%eax
    3640:	89 83 0c 01 00 00    	mov    %eax,0x10c(%rbx)
    3646:	5b                   	pop    %rbx
    3647:	41 5e                	pop    %r14
    3649:	5d                   	pop    %rbp
    364a:	c3                   	ret
    364b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    3650:	8b 05 66 3b 10 01    	mov    0x1103b66(%rip),%eax        # 11071bc <__cxa_finalize@plt+0x110611c>
    3656:	8d 48 01             	lea    0x1(%rax),%ecx
    3659:	0f af c8             	imul   %eax,%ecx
    365c:	f6 c1 01             	test   $0x1,%cl
    365f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 368c <__cxa_finalize@plt+0x25ec>
    3666:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3673 <__cxa_finalize@plt+0x25d3>
    366d:	48 0f 44 c8          	cmove  %rax,%rcx
    3671:	ff e1                	jmp    *%rcx
    3673:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3678:	33 05 42 3b 10 01    	xor    0x1103b42(%rip),%eax        # 11071c0 <__cxa_finalize@plt+0x1106120>
    367e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3681:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3686:	89 05 34 3b 10 01    	mov    %eax,0x1103b34(%rip)        # 11071c0 <__cxa_finalize@plt+0x1106120>
    368c:	0f b7 c6             	movzwl %si,%eax
    368f:	8d 0c 7f             	lea    (%rdi,%rdi,2),%ecx
    3692:	80 e1 0f             	and    $0xf,%cl
    3695:	d3 e8                	shr    %cl,%eax
    3697:	89 f9                	mov    %edi,%ecx
    3699:	c1 e1 04             	shl    $0x4,%ecx
    369c:	01 f9                	add    %edi,%ecx
    369e:	31 c1                	xor    %eax,%ecx
    36a0:	8d 47 04             	lea    0x4(%rdi),%eax
    36a3:	83 e0 0f             	and    $0xf,%eax
    36a6:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
    36aa:	c0 e0 04             	shl    $0x4,%al
    36ad:	83 c7 09             	add    $0x9,%edi
    36b0:	83 e7 0f             	and    $0xf,%edi
    36b3:	0a 04 3a             	or     (%rdx,%rdi,1),%al
    36b6:	30 c1                	xor    %al,%cl
    36b8:	0f b6 f9             	movzbl %cl,%edi
    36bb:	48 89 d6             	mov    %rdx,%rsi
    36be:	e9 9d 01 00 00       	jmp    3860 <__cxa_finalize@plt+0x27c0>
    36c3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    36ca:	84 00 00 00 00 00
    36d0:	55                   	push   %rbp
    36d1:	41 57                	push   %r15
    36d3:	41 56                	push   %r14
    36d5:	41 55                	push   %r13
    36d7:	41 54                	push   %r12
    36d9:	53                   	push   %rbx
    36da:	50                   	push   %rax
    36db:	49 89 d4             	mov    %rdx,%r12
    36de:	41 89 ff             	mov    %edi,%r15d
    36e1:	8b 05 dd 3a 10 01    	mov    0x1103add(%rip),%eax        # 11071c4 <__cxa_finalize@plt+0x1106124>
    36e7:	8d 48 01             	lea    0x1(%rax),%ecx
    36ea:	0f af c8             	imul   %eax,%ecx
    36ed:	f6 c1 01             	test   $0x1,%cl
    36f0:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 371d <__cxa_finalize@plt+0x267d>
    36f7:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3704 <__cxa_finalize@plt+0x2664>
    36fe:	48 0f 44 c8          	cmove  %rax,%rcx
    3702:	ff e1                	jmp    *%rcx
    3704:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3709:	33 05 b9 3a 10 01    	xor    0x1103ab9(%rip),%eax        # 11071c8 <__cxa_finalize@plt+0x1106128>
    370f:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3712:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3717:	89 05 ab 3a 10 01    	mov    %eax,0x1103aab(%rip)        # 11071c8 <__cxa_finalize@plt+0x1106128>
    371d:	0f b7 ee             	movzwl %si,%ebp
    3720:	44 89 ff             	mov    %r15d,%edi
    3723:	89 ee                	mov    %ebp,%esi
    3725:	4c 89 e2             	mov    %r12,%rdx
    3728:	e8 93 01 00 00       	call   38c0 <__cxa_finalize@plt+0x2820>
    372d:	49 89 c5             	mov    %rax,%r13
    3730:	49 89 d6             	mov    %rdx,%r14
    3733:	44 89 fb             	mov    %r15d,%ebx
    3736:	44 89 7c 24 04       	mov    %r15d,0x4(%rsp)
    373b:	4c 8d 3d 6e 1b 10 01 	lea    0x1101b6e(%rip),%r15        # 11052b0 <__cxa_finalize@plt+0x1104210>
    3742:	89 ef                	mov    %ebp,%edi
    3744:	8b 74 24 04          	mov    0x4(%rsp),%esi
    3748:	4c 89 e2             	mov    %r12,%rdx
    374b:	31 c9                	xor    %ecx,%ecx
    374d:	e8 9e 03 00 00       	call   3af0 <__cxa_finalize@plt+0x2a50>
    3752:	42 32 04 3b          	xor    (%rbx,%r15,1),%al
    3756:	88 44 24 03          	mov    %al,0x3(%rsp)
    375a:	45 89 ef             	mov    %r13d,%r15d
    375d:	89 ef                	mov    %ebp,%edi
    375f:	44 89 ee             	mov    %r13d,%esi
    3762:	4c 89 e2             	mov    %r12,%rdx
    3765:	b9 01 00 00 00       	mov    $0x1,%ecx
    376a:	e8 81 03 00 00       	call   3af0 <__cxa_finalize@plt+0x2a50>
    376f:	89 c3                	mov    %eax,%ebx
    3771:	48 8d 05 88 1b 10 01 	lea    0x1101b88(%rip),%rax        # 1105300 <__cxa_finalize@plt+0x1104260>
    3778:	41 32 1c 07          	xor    (%r15,%rax,1),%bl
    377c:	49 c1 ed 20          	shr    $0x20,%r13
    3780:	89 ef                	mov    %ebp,%edi
    3782:	44 89 ee             	mov    %r13d,%esi
    3785:	4c 89 e2             	mov    %r12,%rdx
    3788:	b9 02 00 00 00       	mov    $0x2,%ecx
    378d:	e8 5e 03 00 00       	call   3af0 <__cxa_finalize@plt+0x2a50>
    3792:	41 89 c7             	mov    %eax,%r15d
    3795:	48 8d 05 b4 1b 10 01 	lea    0x1101bb4(%rip),%rax        # 1105350 <__cxa_finalize@plt+0x11042b0>
    379c:	45 32 7c 05 00       	xor    0x0(%r13,%rax,1),%r15b
    37a1:	45 89 f5             	mov    %r14d,%r13d
    37a4:	89 ef                	mov    %ebp,%edi
    37a6:	44 89 f6             	mov    %r14d,%esi
    37a9:	4c 89 e2             	mov    %r12,%rdx
    37ac:	b9 03 00 00 00       	mov    $0x3,%ecx
    37b1:	e8 3a 03 00 00       	call   3af0 <__cxa_finalize@plt+0x2a50>
    37b6:	41 89 c4             	mov    %eax,%r12d
    37b9:	48 8d 05 e0 1b 10 01 	lea    0x1101be0(%rip),%rax        # 11053a0 <__cxa_finalize@plt+0x1104300>
    37c0:	45 32 64 05 00       	xor    0x0(%r13,%rax,1),%r12b
    37c5:	4c 89 f0             	mov    %r14,%rax
    37c8:	48 c1 e8 20          	shr    $0x20,%rax
    37cc:	0f b6 f0             	movzbl %al,%esi
    37cf:	0f b6 fb             	movzbl %bl,%edi
    37d2:	e8 b9 f8 ff ff       	call   3090 <__cxa_finalize@plt+0x1ff0>
    37d7:	89 c3                	mov    %eax,%ebx
    37d9:	32 5c 24 03          	xor    0x3(%rsp),%bl
    37dd:	4c 89 f0             	mov    %r14,%rax
    37e0:	48 c1 e8 28          	shr    $0x28,%rax
    37e4:	0f b6 f0             	movzbl %al,%esi
    37e7:	41 0f b6 ff          	movzbl %r15b,%edi
    37eb:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
    37f0:	e8 9b f8 ff ff       	call   3090 <__cxa_finalize@plt+0x1ff0>
    37f5:	28 c3                	sub    %al,%bl
    37f7:	4c 89 f0             	mov    %r14,%rax
    37fa:	48 c1 e8 30          	shr    $0x30,%rax
    37fe:	30 d8                	xor    %bl,%al
    3800:	44 28 e0             	sub    %r12b,%al
    3803:	49 c1 ee 38          	shr    $0x38,%r14
    3807:	41 30 c6             	xor    %al,%r14b
    380a:	41 0f b6 de          	movzbl %r14b,%ebx
    380e:	44 01 fd             	add    %r15d,%ebp
    3811:	01 dd                	add    %ebx,%ebp
    3813:	89 ef                	mov    %ebp,%edi
    3815:	e8 d6 e8 ff ff       	call   20f0 <__cxa_finalize@plt+0x1050>
    381a:	85 c0                	test   %eax,%eax
    381c:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # 3830 <__cxa_finalize@plt+0x2790>
    3823:	48 8d 0d 1a 00 00 00 	lea    0x1a(%rip),%rcx        # 3844 <__cxa_finalize@plt+0x27a4>
    382a:	48 0f 44 c8          	cmove  %rax,%rcx
    382e:	ff e1                	jmp    *%rcx
    3830:	89 df                	mov    %ebx,%edi
    3832:	44 89 fe             	mov    %r15d,%esi
    3835:	ba 06 00 00 00       	mov    $0x6,%edx
    383a:	e8 11 e6 ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    383f:	30 c3                	xor    %al,%bl
    3841:	41 89 de             	mov    %ebx,%r14d
    3844:	44 89 f0             	mov    %r14d,%eax
    3847:	48 83 c4 08          	add    $0x8,%rsp
    384b:	5b                   	pop    %rbx
    384c:	41 5c                	pop    %r12
    384e:	41 5d                	pop    %r13
    3850:	41 5e                	pop    %r14
    3852:	41 5f                	pop    %r15
    3854:	5d                   	pop    %rbp
    3855:	c3                   	ret
    3856:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    385d:	00 00 00
    3860:	8b 05 66 39 10 01    	mov    0x1103966(%rip),%eax        # 11071cc <__cxa_finalize@plt+0x110612c>
    3866:	8d 48 01             	lea    0x1(%rax),%ecx
    3869:	0f af c8             	imul   %eax,%ecx
    386c:	f6 c1 01             	test   $0x1,%cl
    386f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 389c <__cxa_finalize@plt+0x27fc>
    3876:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3883 <__cxa_finalize@plt+0x27e3>
    387d:	48 0f 44 c8          	cmove  %rax,%rcx
    3881:	ff e1                	jmp    *%rcx
    3883:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3888:	33 05 42 39 10 01    	xor    0x1103942(%rip),%eax        # 11071d0 <__cxa_finalize@plt+0x1106130>
    388e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3891:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3896:	89 05 34 39 10 01    	mov    %eax,0x1103934(%rip)        # 11071d0 <__cxa_finalize@plt+0x1106130>
    389c:	40 0f b6 cf          	movzbl %dil,%ecx
    38a0:	89 c8                	mov    %ecx,%eax
    38a2:	c1 e8 04             	shr    $0x4,%eax
    38a5:	0f b6 04 06          	movzbl (%rsi,%rax,1),%eax
    38a9:	83 e1 0f             	and    $0xf,%ecx
    38ac:	c0 e0 04             	shl    $0x4,%al
    38af:	0a 04 0e             	or     (%rsi,%rcx,1),%al
    38b2:	c3                   	ret
    38b3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    38ba:	84 00 00 00 00 00
    38c0:	55                   	push   %rbp
    38c1:	41 57                	push   %r15
    38c3:	41 56                	push   %r14
    38c5:	41 55                	push   %r13
    38c7:	41 54                	push   %r12
    38c9:	53                   	push   %rbx
    38ca:	48 83 ec 18          	sub    $0x18,%rsp
    38ce:	49 89 d7             	mov    %rdx,%r15
    38d1:	89 fb                	mov    %edi,%ebx
    38d3:	8b 05 fb 38 10 01    	mov    0x11038fb(%rip),%eax        # 11071d4 <__cxa_finalize@plt+0x1106134>
    38d9:	8d 48 01             	lea    0x1(%rax),%ecx
    38dc:	0f af c8             	imul   %eax,%ecx
    38df:	f6 c1 01             	test   $0x1,%cl
    38e2:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 390f <__cxa_finalize@plt+0x286f>
    38e9:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 38f6 <__cxa_finalize@plt+0x2856>
    38f0:	48 0f 44 c8          	cmove  %rax,%rcx
    38f4:	ff e1                	jmp    *%rcx
    38f6:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    38fb:	33 05 d7 38 10 01    	xor    0x11038d7(%rip),%eax        # 11071d8 <__cxa_finalize@plt+0x1106138>
    3901:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3904:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3909:	89 05 c9 38 10 01    	mov    %eax,0x11038c9(%rip)        # 11071d8 <__cxa_finalize@plt+0x1106138>
    390f:	44 0f b7 f6          	movzwl %si,%r14d
    3913:	44 89 f0             	mov    %r14d,%eax
    3916:	83 e0 07             	and    $0x7,%eax
    3919:	83 c0 03             	add    $0x3,%eax
    391c:	44 89 f2             	mov    %r14d,%edx
    391f:	c1 ea 08             	shr    $0x8,%edx
    3922:	89 54 24 0c          	mov    %edx,0xc(%rsp)
    3926:	89 d1                	mov    %edx,%ecx
    3928:	83 e1 0f             	and    $0xf,%ecx
    392b:	31 c1                	xor    %eax,%ecx
    392d:	8d 69 03             	lea    0x3(%rcx),%ebp
    3930:	83 f9 03             	cmp    $0x3,%ecx
    3933:	0f 43 e9             	cmovae %ecx,%ebp
    3936:	89 de                	mov    %ebx,%esi
    3938:	83 e6 0f             	and    $0xf,%esi
    393b:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    3940:	44 89 f7             	mov    %r14d,%edi
    3943:	e8 88 02 00 00       	call   3bd0 <__cxa_finalize@plt+0x2b30>
    3948:	83 cd 01             	or     $0x1,%ebp
    394b:	0f af eb             	imul   %ebx,%ebp
    394e:	01 c5                	add    %eax,%ebp
    3950:	83 e5 3f             	and    $0x3f,%ebp
    3953:	44 89 f7             	mov    %r14d,%edi
    3956:	89 de                	mov    %ebx,%esi
    3958:	31 d2                	xor    %edx,%edx
    395a:	e8 91 f3 ff ff       	call   2cf0 <__cxa_finalize@plt+0x1c50>
    395f:	41 89 c5             	mov    %eax,%r13d
    3962:	44 89 f7             	mov    %r14d,%edi
    3965:	81 f7 a5 a5 00 00    	xor    $0xa5a5,%edi
    396b:	8d 73 33             	lea    0x33(%rbx),%esi
    396e:	ba 01 00 00 00       	mov    $0x1,%edx
    3973:	e8 78 f3 ff ff       	call   2cf0 <__cxa_finalize@plt+0x1c50>
    3978:	41 89 c4             	mov    %eax,%r12d
    397b:	44 89 f7             	mov    %r14d,%edi
    397e:	81 f7 3c 3c 00 00    	xor    $0x3c3c,%edi
    3984:	8d 73 77             	lea    0x77(%rbx),%esi
    3987:	ba 02 00 00 00       	mov    $0x2,%edx
    398c:	e8 5f f3 ff ff       	call   2cf0 <__cxa_finalize@plt+0x1c50>
    3991:	44 89 e9             	mov    %r13d,%ecx
    3994:	44 89 ee             	mov    %r13d,%esi
    3997:	80 e1 1f             	and    $0x1f,%cl
    399a:	0f b6 c9             	movzbl %cl,%ecx
    399d:	01 e9                	add    %ebp,%ecx
    399f:	8d 53 01             	lea    0x1(%rbx),%edx
    39a2:	83 e2 0f             	and    $0xf,%edx
    39a5:	41 0f b6 14 17       	movzbl (%r15,%rdx,1),%edx
    39aa:	01 d1                	add    %edx,%ecx
    39ac:	83 c1 11             	add    $0x11,%ecx
    39af:	69 d1 8f 03 00 00    	imul   $0x38f,%ecx,%edx
    39b5:	c1 ea 0d             	shr    $0xd,%edx
    39b8:	83 e2 f8             	and    $0xfffffff8,%edx
    39bb:	8d 14 d2             	lea    (%rdx,%rdx,8),%edx
    39be:	29 d1                	sub    %edx,%ecx
    39c0:	0f b7 c9             	movzwl %cx,%ecx
    39c3:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
    39c7:	45 89 e0             	mov    %r12d,%r8d
    39ca:	44 89 e1             	mov    %r12d,%ecx
    39cd:	80 e1 1f             	and    $0x1f,%cl
    39d0:	0f b6 c9             	movzbl %cl,%ecx
    39d3:	01 e9                	add    %ebp,%ecx
    39d5:	8d 53 05             	lea    0x5(%rbx),%edx
    39d8:	83 e2 0f             	and    $0xf,%edx
    39db:	41 0f b6 14 17       	movzbl (%r15,%rdx,1),%edx
    39e0:	01 ca                	add    %ecx,%edx
    39e2:	83 c2 1d             	add    $0x1d,%edx
    39e5:	69 ca 8f 03 00 00    	imul   $0x38f,%edx,%ecx
    39eb:	c1 e9 0d             	shr    $0xd,%ecx
    39ee:	83 e1 f8             	and    $0xfffffff8,%ecx
    39f1:	8d 0c c9             	lea    (%rcx,%rcx,8),%ecx
    39f4:	29 ca                	sub    %ecx,%edx
    39f6:	89 54 24 04          	mov    %edx,0x4(%rsp)
    39fa:	6b cb 3d             	imul   $0x3d,%ebx,%ecx
    39fd:	44 01 f1             	add    %r14d,%ecx
    3a00:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    3a05:	41 0f b6 14 17       	movzbl (%r15,%rdx,1),%edx
    3a0a:	44 8d 24 51          	lea    (%rcx,%rdx,2),%r12d
    3a0e:	41 00 c4             	add    %al,%r12b
    3a11:	24 1f                	and    $0x1f,%al
    3a13:	0f b6 c0             	movzbl %al,%eax
    3a16:	01 e8                	add    %ebp,%eax
    3a18:	8d 4b 09             	lea    0x9(%rbx),%ecx
    3a1b:	83 e1 0f             	and    $0xf,%ecx
    3a1e:	41 0f b6 0c 0f       	movzbl (%r15,%rcx,1),%ecx
    3a23:	8d 2c 01             	lea    (%rcx,%rax,1),%ebp
    3a26:	83 c5 2b             	add    $0x2b,%ebp
    3a29:	69 c5 8f 03 00 00    	imul   $0x38f,%ebp,%eax
    3a2f:	c1 e8 0d             	shr    $0xd,%eax
    3a32:	83 e0 f8             	and    $0xfffffff8,%eax
    3a35:	8d 04 c0             	lea    (%rax,%rax,8),%eax
    3a38:	29 c5                	sub    %eax,%ebp
    3a3a:	4c 89 f7             	mov    %r14,%rdi
    3a3d:	41 01 de             	add    %ebx,%r14d
    3a40:	8d 43 02             	lea    0x2(%rbx),%eax
    3a43:	83 e0 0f             	and    $0xf,%eax
    3a46:	45 00 ee             	add    %r13b,%r14b
    3a49:	45 02 34 07          	add    (%r15,%rax,1),%r14b
    3a4d:	41 89 fd             	mov    %edi,%r13d
    3a50:	41 c1 ed 03          	shr    $0x3,%r13d
    3a54:	41 01 dd             	add    %ebx,%r13d
    3a57:	8d 43 06             	lea    0x6(%rbx),%eax
    3a5a:	83 e0 0f             	and    $0xf,%eax
    3a5d:	45 00 c5             	add    %r8b,%r13b
    3a60:	45 02 2c 07          	add    (%r15,%rax,1),%r13b
    3a64:	41 80 e6 07          	and    $0x7,%r14b
    3a68:	41 80 e5 07          	and    $0x7,%r13b
    3a6c:	41 80 c4 33          	add    $0x33,%r12b
    3a70:	8d 04 9b             	lea    (%rbx,%rbx,4),%eax
    3a73:	8d 04 c3             	lea    (%rbx,%rax,8),%eax
    3a76:	03 44 24 0c          	add    0xc(%rsp),%eax
    3a7a:	8d 4b 07             	lea    0x7(%rbx),%ecx
    3a7d:	83 e1 0f             	and    $0xf,%ecx
    3a80:	41 0f b6 0c 0f       	movzbl (%r15,%rcx,1),%ecx
    3a85:	44 8d 3c 88          	lea    (%rax,%rcx,4),%r15d
    3a89:	41 00 f7             	add    %sil,%r15b
    3a8c:	41 80 c7 77          	add    $0x77,%r15b
    3a90:	89 de                	mov    %ebx,%esi
    3a92:	ba 03 00 00 00       	mov    $0x3,%edx
    3a97:	e8 b4 e3 ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    3a9c:	83 e0 03             	and    $0x3,%eax
    3a9f:	33 44 24 08          	xor    0x8(%rsp),%eax
    3aa3:	0f b7 4c 24 04       	movzwl 0x4(%rsp),%ecx
    3aa8:	48 c1 e1 20          	shl    $0x20,%rcx
    3aac:	48 09 c8             	or     %rcx,%rax
    3aaf:	41 0f b6 cf          	movzbl %r15b,%ecx
    3ab3:	48 c1 e1 38          	shl    $0x38,%rcx
    3ab7:	41 0f b6 d4          	movzbl %r12b,%edx
    3abb:	48 c1 e2 30          	shl    $0x30,%rdx
    3abf:	48 09 ca             	or     %rcx,%rdx
    3ac2:	41 0f b6 cd          	movzbl %r13b,%ecx
    3ac6:	48 c1 e1 28          	shl    $0x28,%rcx
    3aca:	48 09 d1             	or     %rdx,%rcx
    3acd:	41 0f b6 f6          	movzbl %r14b,%esi
    3ad1:	48 c1 e6 20          	shl    $0x20,%rsi
    3ad5:	48 09 ce             	or     %rcx,%rsi
    3ad8:	0f b7 d5             	movzwl %bp,%edx
    3adb:	48 09 f2             	or     %rsi,%rdx
    3ade:	48 83 c4 18          	add    $0x18,%rsp
    3ae2:	5b                   	pop    %rbx
    3ae3:	41 5c                	pop    %r12
    3ae5:	41 5d                	pop    %r13
    3ae7:	41 5e                	pop    %r14
    3ae9:	41 5f                	pop    %r15
    3aeb:	5d                   	pop    %rbp
    3aec:	c3                   	ret
    3aed:	0f 1f 00             	nopl   (%rax)
    3af0:	55                   	push   %rbp
    3af1:	41 57                	push   %r15
    3af3:	41 56                	push   %r14
    3af5:	41 55                	push   %r13
    3af7:	41 54                	push   %r12
    3af9:	53                   	push   %rbx
    3afa:	50                   	push   %rax
    3afb:	89 cb                	mov    %ecx,%ebx
    3afd:	41 89 f6             	mov    %esi,%r14d
    3b00:	8b 05 d6 36 10 01    	mov    0x11036d6(%rip),%eax        # 11071dc <__cxa_finalize@plt+0x110613c>
    3b06:	8d 48 01             	lea    0x1(%rax),%ecx
    3b09:	0f af c8             	imul   %eax,%ecx
    3b0c:	f6 c1 01             	test   $0x1,%cl
    3b0f:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 3b3c <__cxa_finalize@plt+0x2a9c>
    3b16:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3b23 <__cxa_finalize@plt+0x2a83>
    3b1d:	48 0f 44 c8          	cmove  %rax,%rcx
    3b21:	ff e1                	jmp    *%rcx
    3b23:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3b28:	33 05 b2 36 10 01    	xor    0x11036b2(%rip),%eax        # 11071e0 <__cxa_finalize@plt+0x1106140>
    3b2e:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3b31:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3b36:	89 05 a4 36 10 01    	mov    %eax,0x11036a4(%rip)        # 11071e0 <__cxa_finalize@plt+0x1106140>
    3b3c:	0f b7 ef             	movzwl %di,%ebp
    3b3f:	42 8d 04 33          	lea    (%rbx,%r14,1),%eax
    3b43:	89 c1                	mov    %eax,%ecx
    3b45:	83 e1 07             	and    $0x7,%ecx
    3b48:	89 ee                	mov    %ebp,%esi
    3b4a:	d3 ee                	shr    %cl,%esi
    3b4c:	83 e0 0f             	and    $0xf,%eax
    3b4f:	44 0f b6 2c 02       	movzbl (%rdx,%rax,1),%r13d
    3b54:	41 c0 e5 04          	shl    $0x4,%r13b
    3b58:	42 8d 04 33          	lea    (%rbx,%r14,1),%eax
    3b5c:	83 c0 03             	add    $0x3,%eax
    3b5f:	83 e0 0f             	and    $0xf,%eax
    3b62:	44 0a 2c 02          	or     (%rdx,%rax,1),%r13b
    3b66:	40 0f b6 fe          	movzbl %sil,%edi
    3b6a:	89 ce                	mov    %ecx,%esi
    3b6c:	e8 1f f5 ff ff       	call   3090 <__cxa_finalize@plt+0x1ff0>
    3b71:	88 44 24 07          	mov    %al,0x7(%rsp)
    3b75:	44 89 f0             	mov    %r14d,%eax
    3b78:	c1 e0 05             	shl    $0x5,%eax
    3b7b:	44 29 f0             	sub    %r14d,%eax
    3b7e:	44 6b fb 33          	imul   $0x33,%ebx,%r15d
    3b82:	41 01 c7             	add    %eax,%r15d
    3b85:	69 f3 34 12 00 00    	imul   $0x1234,%ebx,%esi
    3b8b:	44 01 f6             	add    %r14d,%esi
    3b8e:	8d 53 01             	lea    0x1(%rbx),%edx
    3b91:	89 ef                	mov    %ebp,%edi
    3b93:	e8 58 f1 ff ff       	call   2cf0 <__cxa_finalize@plt+0x1c50>
    3b98:	41 89 c4             	mov    %eax,%r12d
    3b9b:	6b f3 61             	imul   $0x61,%ebx,%esi
    3b9e:	44 01 f6             	add    %r14d,%esi
    3ba1:	83 c3 09             	add    $0x9,%ebx
    3ba4:	89 ef                	mov    %ebp,%edi
    3ba6:	89 da                	mov    %ebx,%edx
    3ba8:	e8 a3 e2 ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    3bad:	24 0f                	and    $0xf,%al
    3baf:	44 32 7c 24 07       	xor    0x7(%rsp),%r15b
    3bb4:	45 30 e7             	xor    %r12b,%r15b
    3bb7:	44 30 f8             	xor    %r15b,%al
    3bba:	44 30 e8             	xor    %r13b,%al
    3bbd:	48 83 c4 08          	add    $0x8,%rsp
    3bc1:	5b                   	pop    %rbx
    3bc2:	41 5c                	pop    %r12
    3bc4:	41 5d                	pop    %r13
    3bc6:	41 5e                	pop    %r14
    3bc8:	41 5f                	pop    %r15
    3bca:	5d                   	pop    %rbp
    3bcb:	c3                   	ret
    3bcc:	0f 1f 40 00          	nopl   0x0(%rax)
    3bd0:	89 f1                	mov    %esi,%ecx
    3bd2:	8b 05 0c 36 10 01    	mov    0x110360c(%rip),%eax        # 11071e4 <__cxa_finalize@plt+0x1106144>
    3bd8:	8d 50 01             	lea    0x1(%rax),%edx
    3bdb:	0f af d0             	imul   %eax,%edx
    3bde:	f6 c2 01             	test   $0x1,%dl
    3be1:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 3c0e <__cxa_finalize@plt+0x2b6e>
    3be8:	48 8d 15 06 00 00 00 	lea    0x6(%rip),%rdx        # 3bf5 <__cxa_finalize@plt+0x2b55>
    3bef:	48 0f 44 d0          	cmove  %rax,%rdx
    3bf3:	ff e2                	jmp    *%rdx
    3bf5:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3bfa:	33 05 e8 35 10 01    	xor    0x11035e8(%rip),%eax        # 11071e8 <__cxa_finalize@plt+0x1106148>
    3c00:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3c03:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3c08:	89 05 da 35 10 01    	mov    %eax,0x11035da(%rip)        # 11071e8 <__cxa_finalize@plt+0x1106148>
    3c0e:	89 f8                	mov    %edi,%eax
    3c10:	66 d3 c0             	rol    %cl,%ax
    3c13:	f6 c1 0f             	test   $0xf,%cl
    3c16:	0f 44 c7             	cmove  %edi,%eax
    3c19:	c3                   	ret
    3c1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3c20:	55                   	push   %rbp
    3c21:	41 57                	push   %r15
    3c23:	41 56                	push   %r14
    3c25:	41 55                	push   %r13
    3c27:	41 54                	push   %r12
    3c29:	53                   	push   %rbx
    3c2a:	48 83 ec 18          	sub    $0x18,%rsp
    3c2e:	44 89 c5             	mov    %r8d,%ebp
    3c31:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    3c36:	89 d3                	mov    %edx,%ebx
    3c38:	41 89 f7             	mov    %esi,%r15d
    3c3b:	8b 05 ab 35 10 01    	mov    0x11035ab(%rip),%eax        # 11071ec <__cxa_finalize@plt+0x110614c>
    3c41:	8d 48 01             	lea    0x1(%rax),%ecx
    3c44:	0f af c8             	imul   %eax,%ecx
    3c47:	f6 c1 01             	test   $0x1,%cl
    3c4a:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 3c77 <__cxa_finalize@plt+0x2bd7>
    3c51:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3c5e <__cxa_finalize@plt+0x2bbe>
    3c58:	48 0f 44 c8          	cmove  %rax,%rcx
    3c5c:	ff e1                	jmp    *%rcx
    3c5e:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3c63:	33 05 87 35 10 01    	xor    0x1103587(%rip),%eax        # 11071f0 <__cxa_finalize@plt+0x1106150>
    3c69:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3c6c:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3c71:	89 05 79 35 10 01    	mov    %eax,0x1103579(%rip)        # 11071f0 <__cxa_finalize@plt+0x1106150>
    3c77:	44 0f b6 ef          	movzbl %dil,%r13d
    3c7b:	44 89 ef             	mov    %r13d,%edi
    3c7e:	be 01 00 00 00       	mov    $0x1,%esi
    3c83:	e8 08 f4 ff ff       	call   3090 <__cxa_finalize@plt+0x1ff0>
    3c88:	41 89 c6             	mov    %eax,%r14d
    3c8b:	45 0f b6 e7          	movzbl %r15b,%r12d
    3c8f:	44 89 e7             	mov    %r12d,%edi
    3c92:	be 03 00 00 00       	mov    $0x3,%esi
    3c97:	e8 f4 f3 ff ff       	call   3090 <__cxa_finalize@plt+0x1ff0>
    3c9c:	41 89 c7             	mov    %eax,%r15d
    3c9f:	45 30 f7             	xor    %r14b,%r15b
    3ca2:	44 0f b6 f3          	movzbl %bl,%r14d
    3ca6:	44 89 f7             	mov    %r14d,%edi
    3ca9:	44 89 74 24 14       	mov    %r14d,0x14(%rsp)
    3cae:	be 05 00 00 00       	mov    $0x5,%esi
    3cb3:	e8 d8 f3 ff ff       	call   3090 <__cxa_finalize@plt+0x1ff0>
    3cb8:	44 30 f8             	xor    %r15b,%al
    3cbb:	89 eb                	mov    %ebp,%ebx
    3cbd:	0f b7 eb             	movzwl %bx,%ebp
    3cc0:	0f b6 c0             	movzbl %al,%eax
    3cc3:	41 89 ef             	mov    %ebp,%r15d
    3cc6:	41 c1 ef 08          	shr    $0x8,%r15d
    3cca:	41 31 c7             	xor    %eax,%r15d
    3ccd:	41 c1 e5 08          	shl    $0x8,%r13d
    3cd1:	45 09 e5             	or     %r12d,%r13d
    3cd4:	41 31 ed             	xor    %ebp,%r13d
    3cd7:	44 89 ef             	mov    %r13d,%edi
    3cda:	44 89 f6             	mov    %r14d,%esi
    3cdd:	ba 05 00 00 00       	mov    $0x5,%edx
    3ce2:	e8 09 f0 ff ff       	call   2cf0 <__cxa_finalize@plt+0x1c50>
    3ce7:	44 0f b6 f0          	movzbl %al,%r14d
    3ceb:	45 31 f7             	xor    %r14d,%r15d
    3cee:	41 31 df             	xor    %ebx,%r15d
    3cf1:	45 0f b6 ef          	movzbl %r15b,%r13d
    3cf5:	44 89 ef             	mov    %r13d,%edi
    3cf8:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    3cfd:	e8 5e fb ff ff       	call   3860 <__cxa_finalize@plt+0x27c0>
    3d02:	88 44 24 08          	mov    %al,0x8(%rsp)
    3d06:	45 00 ec             	add    %r13b,%r12b
    3d09:	41 0f b6 fc          	movzbl %r12b,%edi
    3d0d:	be 02 00 00 00       	mov    $0x2,%esi
    3d12:	e8 79 f3 ff ff       	call   3090 <__cxa_finalize@plt+0x1ff0>
    3d17:	41 89 c4             	mov    %eax,%r12d
    3d1a:	44 89 f7             	mov    %r14d,%edi
    3d1d:	be 03 00 00 00       	mov    $0x3,%esi
    3d22:	e8 69 f3 ff ff       	call   3090 <__cxa_finalize@plt+0x1ff0>
    3d27:	41 89 c6             	mov    %eax,%r14d
    3d2a:	45 6b ff 5d          	imul   $0x5d,%r15d,%r15d
    3d2e:	c1 e5 08             	shl    $0x8,%ebp
    3d31:	44 09 ed             	or     %r13d,%ebp
    3d34:	89 ef                	mov    %ebp,%edi
    3d36:	8b 5c 24 14          	mov    0x14(%rsp),%ebx
    3d3a:	89 de                	mov    %ebx,%esi
    3d3c:	ba 0b 00 00 00       	mov    $0xb,%edx
    3d41:	e8 0a e1 ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    3d46:	c0 e8 02             	shr    $0x2,%al
    3d49:	24 1f                	and    $0x1f,%al
    3d4b:	44 32 74 24 08       	xor    0x8(%rsp),%r14b
    3d50:	45 30 e6             	xor    %r12b,%r14b
    3d53:	45 30 fe             	xor    %r15b,%r14b
    3d56:	44 30 f0             	xor    %r14b,%al
    3d59:	30 d8                	xor    %bl,%al
    3d5b:	48 83 c4 18          	add    $0x18,%rsp
    3d5f:	5b                   	pop    %rbx
    3d60:	41 5c                	pop    %r12
    3d62:	41 5d                	pop    %r13
    3d64:	41 5e                	pop    %r14
    3d66:	41 5f                	pop    %r15
    3d68:	5d                   	pop    %rbp
    3d69:	c3                   	ret
    3d6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3d70:	55                   	push   %rbp
    3d71:	41 57                	push   %r15
    3d73:	41 56                	push   %r14
    3d75:	41 54                	push   %r12
    3d77:	53                   	push   %rbx
    3d78:	48 89 d3             	mov    %rdx,%rbx
    3d7b:	8b 05 73 34 10 01    	mov    0x1103473(%rip),%eax        # 11071f4 <__cxa_finalize@plt+0x1106154>
    3d81:	8d 48 01             	lea    0x1(%rax),%ecx
    3d84:	0f af c8             	imul   %eax,%ecx
    3d87:	f6 c1 01             	test   $0x1,%cl
    3d8a:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 3db7 <__cxa_finalize@plt+0x2d17>
    3d91:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3d9e <__cxa_finalize@plt+0x2cfe>
    3d98:	48 0f 44 c8          	cmove  %rax,%rcx
    3d9c:	ff e1                	jmp    *%rcx
    3d9e:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3da3:	33 05 4f 34 10 01    	xor    0x110344f(%rip),%eax        # 11071f8 <__cxa_finalize@plt+0x1106158>
    3da9:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3dac:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3db1:	89 05 41 34 10 01    	mov    %eax,0x1103441(%rip)        # 11071f8 <__cxa_finalize@plt+0x1106158>
    3db7:	89 f8                	mov    %edi,%eax
    3db9:	83 e0 01             	and    $0x1,%eax
    3dbc:	f7 d8                	neg    %eax
    3dbe:	0f b7 d7             	movzwl %di,%edx
    3dc1:	d1 ea                	shr    $1,%edx
    3dc3:	89 d1                	mov    %edx,%ecx
    3dc5:	80 e1 0f             	and    $0xf,%cl
    3dc8:	0f b7 ee             	movzwl %si,%ebp
    3dcb:	41 89 ef             	mov    %ebp,%r15d
    3dce:	41 d3 ef             	shr    %cl,%r15d
    3dd1:	44 0f b7 33          	movzwl (%rbx),%r14d
    3dd5:	45 31 f7             	xor    %r14d,%r15d
    3dd8:	41 21 c7             	and    %eax,%r15d
    3ddb:	41 31 d7             	xor    %edx,%r15d
    3dde:	45 0f b7 e7          	movzwl %r15w,%r12d
    3de2:	41 c1 ec 03          	shr    $0x3,%r12d
    3de6:	44 89 fe             	mov    %r15d,%esi
    3de9:	83 e6 07             	and    $0x7,%esi
    3dec:	89 ef                	mov    %ebp,%edi
    3dee:	e8 dd fd ff ff       	call   3bd0 <__cxa_finalize@plt+0x2b30>
    3df3:	44 31 e0             	xor    %r12d,%eax
    3df6:	44 31 f0             	xor    %r14d,%eax
    3df9:	0f b7 f8             	movzwl %ax,%edi
    3dfc:	be 01 00 00 00       	mov    $0x1,%esi
    3e01:	e8 ca fd ff ff       	call   3bd0 <__cxa_finalize@plt+0x2b30>
    3e06:	41 89 c6             	mov    %eax,%r14d
    3e09:	66 89 03             	mov    %ax,(%rbx)
    3e0c:	44 89 fe             	mov    %r15d,%esi
    3e0f:	83 e6 0f             	and    $0xf,%esi
    3e12:	89 ef                	mov    %ebp,%edi
    3e14:	e8 b7 fd ff ff       	call   3bd0 <__cxa_finalize@plt+0x2b30>
    3e19:	89 c3                	mov    %eax,%ebx
    3e1b:	44 31 fb             	xor    %r15d,%ebx
    3e1e:	66 83 fb 01          	cmp    $0x1,%bx
    3e22:	83 d3 00             	adc    $0x0,%ebx
    3e25:	0f b7 c3             	movzwl %bx,%eax
    3e28:	c1 e5 10             	shl    $0x10,%ebp
    3e2b:	09 c5                	or     %eax,%ebp
    3e2d:	41 0f b7 f6          	movzwl %r14w,%esi
    3e31:	89 ef                	mov    %ebp,%edi
    3e33:	ba 05 00 00 00       	mov    $0x5,%edx
    3e38:	e8 13 e0 ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    3e3d:	0f b6 c0             	movzbl %al,%eax
    3e40:	31 d8                	xor    %ebx,%eax
    3e42:	5b                   	pop    %rbx
    3e43:	41 5c                	pop    %r12
    3e45:	41 5e                	pop    %r14
    3e47:	41 5f                	pop    %r15
    3e49:	5d                   	pop    %rbp
    3e4a:	c3                   	ret
    3e4b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    3e50:	53                   	push   %rbx
    3e51:	8b 05 a5 33 10 01    	mov    0x11033a5(%rip),%eax        # 11071fc <__cxa_finalize@plt+0x110615c>
    3e57:	44 8d 40 01          	lea    0x1(%rax),%r8d
    3e5b:	44 0f af c0          	imul   %eax,%r8d
    3e5f:	41 f6 c0 01          	test   $0x1,%r8b
    3e63:	48 8d 05 27 00 00 00 	lea    0x27(%rip),%rax        # 3e91 <__cxa_finalize@plt+0x2df1>
    3e6a:	4c 8d 05 07 00 00 00 	lea    0x7(%rip),%r8        # 3e78 <__cxa_finalize@plt+0x2dd8>
    3e71:	4c 0f 44 c0          	cmove  %rax,%r8
    3e75:	41 ff e0             	jmp    *%r8
    3e78:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3e7d:	33 05 7d 33 10 01    	xor    0x110337d(%rip),%eax        # 1107200 <__cxa_finalize@plt+0x1106160>
    3e83:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3e86:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3e8b:	89 05 6f 33 10 01    	mov    %eax,0x110336f(%rip)        # 1107200 <__cxa_finalize@plt+0x1106160>
    3e91:	31 c0                	xor    %eax,%eax
    3e93:	05 48 4c 41 56       	add    $0x56414c48,%eax
    3e98:	31 c0                	xor    %eax,%eax
    3e9a:	89 f8                	mov    %edi,%eax
    3e9c:	c1 e8 10             	shr    $0x10,%eax
    3e9f:	41 89 cb             	mov    %ecx,%r11d
    3ea2:	41 31 fb             	xor    %edi,%r11d
    3ea5:	41 31 c3             	xor    %eax,%r11d
    3ea8:	41 83 e3 01          	and    $0x1,%r11d
    3eac:	48 8d 1d 1d 2f 10 01 	lea    0x1102f1d(%rip),%rbx        # 1106dd0 <__cxa_finalize@plt+0x1105d30>
    3eb3:	89 f8                	mov    %edi,%eax
    3eb5:	44 0f b6 d6          	movzbl %sil,%r10d
    3eb9:	44 0f b6 ca          	movzbl %dl,%r9d
    3ebd:	44 0f b7 c1          	movzwl %cx,%r8d
    3ec1:	bf 02 00 00 00       	mov    $0x2,%edi
    3ec6:	48 89 c6             	mov    %rax,%rsi
    3ec9:	4c 89 d2             	mov    %r10,%rdx
    3ecc:	4c 89 c9             	mov    %r9,%rcx
    3ecf:	48 89 d8             	mov    %rbx,%rax
    3ed2:	5b                   	pop    %rbx
    3ed3:	42 ff 24 d8          	jmp    *(%rax,%r11,8)
    3ed7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    3ede:	00 00
    3ee0:	55                   	push   %rbp
    3ee1:	41 57                	push   %r15
    3ee3:	41 56                	push   %r14
    3ee5:	41 55                	push   %r13
    3ee7:	41 54                	push   %r12
    3ee9:	53                   	push   %rbx
    3eea:	50                   	push   %rax
    3eeb:	41 89 f7             	mov    %esi,%r15d
    3eee:	48 89 fb             	mov    %rdi,%rbx
    3ef1:	8b 05 0d 33 10 01    	mov    0x110330d(%rip),%eax        # 1107204 <__cxa_finalize@plt+0x1106164>
    3ef7:	8d 48 01             	lea    0x1(%rax),%ecx
    3efa:	0f af c8             	imul   %eax,%ecx
    3efd:	f6 c1 01             	test   $0x1,%cl
    3f00:	48 8d 05 26 00 00 00 	lea    0x26(%rip),%rax        # 3f2d <__cxa_finalize@plt+0x2e8d>
    3f07:	48 8d 0d 06 00 00 00 	lea    0x6(%rip),%rcx        # 3f14 <__cxa_finalize@plt+0x2e74>
    3f0e:	48 0f 44 c8          	cmove  %rax,%rcx
    3f12:	ff e1                	jmp    *%rcx
    3f14:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    3f19:	33 05 e9 32 10 01    	xor    0x11032e9(%rip),%eax        # 1107208 <__cxa_finalize@plt+0x1106168>
    3f1f:	8d 04 40             	lea    (%rax,%rax,2),%eax
    3f22:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    3f27:	89 05 db 32 10 01    	mov    %eax,0x11032db(%rip)        # 1107208 <__cxa_finalize@plt+0x1106168>
    3f2d:	31 c0                	xor    %eax,%eax
    3f2f:	05 45 45 46 53       	add    $0x53464545,%eax
    3f34:	31 c0                	xor    %eax,%eax
    3f36:	41 83 ff 05          	cmp    $0x5,%r15d
    3f3a:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # 3f4e <__cxa_finalize@plt+0x2eae>
    3f41:	48 8d 0d 11 00 00 00 	lea    0x11(%rip),%rcx        # 3f59 <__cxa_finalize@plt+0x2eb9>
    3f48:	48 0f 43 c8          	cmovae %rax,%rcx
    3f4c:	ff e1                	jmp    *%rcx
    3f4e:	41 8d 47 fb          	lea    -0x5(%r15),%eax
    3f52:	0f b6 44 03 06       	movzbl 0x6(%rbx,%rax,1),%eax
    3f57:	eb 09                	jmp    3f62 <__cxa_finalize@plt+0x2ec2>
    3f59:	0f b7 03             	movzwl (%rbx),%eax
    3f5c:	41 8d 4f 03          	lea    0x3(%r15),%ecx
    3f60:	d3 e8                	shr    %cl,%eax
    3f62:	8b 0b                	mov    (%rbx),%ecx
    3f64:	c1 e1 10             	shl    $0x10,%ecx
    3f67:	4c 8d 63 04          	lea    0x4(%rbx),%r12
    3f6b:	0f b7 7b 04          	movzwl 0x4(%rbx),%edi
    3f6f:	09 cf                	or     %ecx,%edi
    3f71:	44 0f b6 ea          	movzbl %dl,%r13d
    3f75:	43 8d 0c 2f          	lea    (%r15,%r13,1),%ecx
    3f79:	44 0f b6 f0          	movzbl %al,%r14d
    3f7d:	48 89 0c 24          	mov    %rcx,(%rsp)
    3f81:	42 8d 34 31          	lea    (%rcx,%r14,1),%esi
    3f85:	ba 0e 00 00 00       	mov    $0xe,%edx
    3f8a:	e8 61 ed ff ff       	call   2cf0 <__cxa_finalize@plt+0x1c50>
    3f8f:	41 69 ce 77 5a 00 00 	imul   $0x5a77,%r14d,%ecx
    3f96:	0f b6 c0             	movzbl %al,%eax
    3f99:	89 c2                	mov    %eax,%edx
    3f9b:	c1 e2 08             	shl    $0x8,%edx
    3f9e:	09 c2                	or     %eax,%edx
    3fa0:	31 ca                	xor    %ecx,%edx
    3fa2:	66 33 13             	xor    (%rbx),%dx
    3fa5:	66 89 13             	mov    %dx,(%rbx)
    3fa8:	48 8d 6b 06          	lea    0x6(%rbx),%rbp
    3fac:	45 89 fe             	mov    %r15d,%r14d
    3faf:	42 0f b6 4c 33 06    	movzbl 0x6(%rbx,%r14,1),%ecx
    3fb5:	c1 e1 02             	shl    $0x2,%ecx
    3fb8:	31 c1                	xor    %eax,%ecx
    3fba:	31 d1                	xor    %edx,%ecx
    3fbc:	41 83 e7 07          	and    $0x7,%r15d
    3fc0:	41 ff c7             	inc    %r15d
    3fc3:	0f b7 f9             	movzwl %cx,%edi
    3fc6:	44 89 fe             	mov    %r15d,%esi
    3fc9:	e8 02 fc ff ff       	call   3bd0 <__cxa_finalize@plt+0x2b30>
    3fce:	44 89 e9             	mov    %r13d,%ecx
    3fd1:	c1 e1 08             	shl    $0x8,%ecx
    3fd4:	66 03 4b 04          	add    0x4(%rbx),%cx
    3fd8:	66 31 c1             	xor    %ax,%cx
    3fdb:	66 89 0b             	mov    %cx,(%rbx)
    3fde:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # 3ff2 <__cxa_finalize@plt+0x2f52>
    3fe5:	48 8d 0d 0b 00 00 00 	lea    0xb(%rip),%rcx        # 3ff7 <__cxa_finalize@plt+0x2f57>
    3fec:	48 0f 44 c8          	cmove  %rax,%rcx
    3ff0:	ff e1                	jmp    *%rcx
    3ff2:	66 c7 03 01 00       	movw   $0x1,(%rbx)
    3ff7:	42 0f b6 44 35 00    	movzbl 0x0(%rbp,%r14,1),%eax
    3ffd:	69 c0 37 13 00 00    	imul   $0x1337,%eax,%eax
    4003:	41 0f b7 cd          	movzwl %r13w,%ecx
    4007:	c1 e1 05             	shl    $0x5,%ecx
    400a:	31 c1                	xor    %eax,%ecx
    400c:	66 41 33 0c 24       	xor    (%r12),%cx
    4011:	66 41 89 0c 24       	mov    %cx,(%r12)
    4016:	0f b7 f9             	movzwl %cx,%edi
    4019:	be 03 00 00 00       	mov    $0x3,%esi
    401e:	e8 ad fb ff ff       	call   3bd0 <__cxa_finalize@plt+0x2b30>
    4023:	66 41 89 04 24       	mov    %ax,(%r12)
    4028:	8b 0b                	mov    (%rbx),%ecx
    402a:	c1 e1 10             	shl    $0x10,%ecx
    402d:	0f b7 f8             	movzwl %ax,%edi
    4030:	09 cf                	or     %ecx,%edi
    4032:	4c 8b 34 24          	mov    (%rsp),%r14
    4036:	44 89 f6             	mov    %r14d,%esi
    4039:	ba 0c 00 00 00       	mov    $0xc,%edx
    403e:	e8 ad ec ff ff       	call   2cf0 <__cxa_finalize@plt+0x1c50>
    4043:	0f b6 c0             	movzbl %al,%eax
    4046:	89 c1                	mov    %eax,%ecx
    4048:	c1 e1 08             	shl    $0x8,%ecx
    404b:	66 31 0b             	xor    %cx,(%rbx)
    404e:	09 c1                	or     %eax,%ecx
    4050:	66 41 33 0c 24       	xor    (%r12),%cx
    4055:	66 41 89 0c 24       	mov    %cx,(%r12)
    405a:	8b 03                	mov    (%rbx),%eax
    405c:	c1 e0 10             	shl    $0x10,%eax
    405f:	0f b7 f9             	movzwl %cx,%edi
    4062:	09 c7                	or     %eax,%edi
    4064:	44 89 f6             	mov    %r14d,%esi
    4067:	ba 0d 00 00 00       	mov    $0xd,%edx
    406c:	e8 df dd ff ff       	call   1e50 <__cxa_finalize@plt+0xdb0>
    4071:	0f b6 c0             	movzbl %al,%eax
    4074:	66 41 31 04 24       	xor    %ax,(%r12)
    4079:	48 83 c4 08          	add    $0x8,%rsp
    407d:	5b                   	pop    %rbx
    407e:	41 5c                	pop    %r12
    4080:	41 5d                	pop    %r13
    4082:	41 5e                	pop    %r14
    4084:	41 5f                	pop    %r15
    4086:	5d                   	pop    %rbp
    4087:	c3                   	ret
    4088:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    408f:	00
    4090:	8b 05 76 31 10 01    	mov    0x1103176(%rip),%eax        # 110720c <__cxa_finalize@plt+0x110616c>
    4096:	44 8d 48 01          	lea    0x1(%rax),%r9d
    409a:	44 0f af c8          	imul   %eax,%r9d
    409e:	41 f6 c1 01          	test   $0x1,%r9b
    40a2:	48 8d 05 27 00 00 00 	lea    0x27(%rip),%rax        # 40d0 <__cxa_finalize@plt+0x3030>
    40a9:	4c 8d 0d 07 00 00 00 	lea    0x7(%rip),%r9        # 40b7 <__cxa_finalize@plt+0x3017>
    40b0:	4c 0f 44 c8          	cmove  %rax,%r9
    40b4:	41 ff e1             	jmp    *%r9
    40b7:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    40bc:	33 05 4e 31 10 01    	xor    0x110314e(%rip),%eax        # 1107210 <__cxa_finalize@plt+0x1106170>
    40c2:	8d 04 40             	lea    (%rax,%rax,2),%eax
    40c5:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    40ca:	89 05 40 31 10 01    	mov    %eax,0x1103140(%rip)        # 1107210 <__cxa_finalize@plt+0x1106170>
    40d0:	e9 9b ec ff ff       	jmp    2d70 <__cxa_finalize@plt+0x1cd0>
    40d5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    40dc:	00 00 00 00
    40e0:	8b 05 2e 31 10 01    	mov    0x110312e(%rip),%eax        # 1107214 <__cxa_finalize@plt+0x1106174>
    40e6:	44 8d 48 01          	lea    0x1(%rax),%r9d
    40ea:	44 0f af c8          	imul   %eax,%r9d
    40ee:	41 f6 c1 01          	test   $0x1,%r9b
    40f2:	48 8d 05 27 00 00 00 	lea    0x27(%rip),%rax        # 4120 <__cxa_finalize@plt+0x3080>
    40f9:	4c 8d 0d 07 00 00 00 	lea    0x7(%rip),%r9        # 4107 <__cxa_finalize@plt+0x3067>
    4100:	4c 0f 44 c8          	cmove  %rax,%r9
    4104:	41 ff e1             	jmp    *%r9
    4107:	b8 5a 5a a5 a5       	mov    $0xa5a55a5a,%eax
    410c:	33 05 06 31 10 01    	xor    0x1103106(%rip),%eax        # 1107218 <__cxa_finalize@plt+0x1106178>
    4112:	8d 04 40             	lea    (%rax,%rax,2),%eax
    4115:	05 1f b3 36 5d       	add    $0x5d36b31f,%eax
    411a:	89 05 f8 30 10 01    	mov    %eax,0x11030f8(%rip)        # 1107218 <__cxa_finalize@plt+0x1106178>
    4120:	e9 4b ec ff ff       	jmp    2d70 <__cxa_finalize@plt+0x1cd0>

Disassembly of section .fini:

0000000000004128 <.fini>:
    4128:	f3 0f 1e fa          	endbr64
    412c:	48 83 ec 08          	sub    $0x8,%rsp
    4130:	48 83 c4 08          	add    $0x8,%rsp
    4134:	c3                   	ret
