# Let's read the hint carefully:
# "Yeah exactly! That's the right path. The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table, and the NFSR does a nonlinear feedback step using that same table, they feed into each other which is the 'state coupling' part."
# Wait, look at what the LCG constants are:
# multiply by 0x6d, add 0x3d
# Wait! In 121: 1730 is where LCG could be?
# Where is `multiply by 0x6d`? `imul $0x6d` or `imul $109`?
# In 312d we have `imul $0x5d, %ecx, %eax`. That's 0x5d.
# Wait, where is `multiply by 0x6d` in the code?
# And "The filter/output function is where the 1MB S-box comes in instead of Grain's standard boolean functions."
# "You've got it, just trace how the two registers combine to generate each output byte and you're at the flag."
# "the flag literally spells out the two key components once you know what to look for."
# Wait! "spells out the two key components"
# "two key components": LFSR and NFSR? No!
# What if the two key components are the LCG constants?
# What if the two key components are the two registers: LFSR and NFSR?
# But if it's not exactly Grain-128a, what is it?
