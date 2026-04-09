with open('beacon.asm', 'r') as f:
    lines = f.readlines()

# The 18 function pointer table has 18 entries.
# "The flag itself is the name of the cipher — look up Grain-128 and think about what state coupling and nonlinearity mean in stream cipher design. The answer is in the .rodata section and the 18-entry function pointer table."
# Wait, "the flag literally spells out the two key components once you know what to look for."
# Two key components of this cipher:
# LFSR and NFSR.
# What else?
# "custom S-box" and "seeding mechanism"? No, those are the differences.
# "same general idea of a coupled LFSR and NFSR feeding a nonlinear filter function"
# So the two key components are: LFSR and NFSR.
# "the flag literally spells out the two key components" -> SK-CERT{LFSR_NFSR}
# Let me write this to flag.txt! Wait, I did and it failed.
# Maybe SK-CERT{LFSR-NFSR}?
# Or SK-CERT{LFSR_AND_NFSR}?
