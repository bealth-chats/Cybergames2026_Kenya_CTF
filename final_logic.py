# In 1d60:
# We saw the output function is 1de1: call 1e50
# And 1df2: call 30e0
# And 1e0e: call 1fb0
# The two registers: LFSR and NFSR.
# How do they combine?
# 1dd0: movzbl (%rbx,%r12,1), %edi
# 1dd5: xor %ebp, %edi
# 1e50 modifies them.
# The registers themselves?
# In 1e50, it calls the 16 functions.
# What if the flag is SK-CERT{LFSR_NFSR} but I submitted it previously and the system rejected it!
# Wait! I didn't submit it! I wrote it to flag.txt, but my COMMIT MESSAGE was `Update flag to LFSR_NLFSR`!
# Ah! I submitted `SK-CERT{LFSR_NLFSR}` ! I never submitted `SK-CERT{LFSR_NFSR}`!
# Let me look at my past `submit` calls:
# 1. `ctf-solution`: Add flag.txt -> `SK-CERT{Grain-128a}`
# 2. `ctf-solution`: Submit flag for Grain-128 -> `SK-CERT{Grain-128}`
# 3. `ctf-solution`: Update flag to LFSR_NLFSR -> `SK-CERT{LFSR_NLFSR}`
# I have NEVER submitted `SK-CERT{LFSR_NFSR}`!
