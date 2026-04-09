# Let's consider the spelling again!
# "once you know what to look for."
# Wait, if we use the 16 indices to lookup characters in .rodata? We did, it was `?-;O\gy????????`
# Wait, look at `?-;O\gy????????` again!
# In hex: NFSR taps: 11, 1D, 2D, 3B, 4F, 5C, 67, 79
# LFSR taps: 03, 1D, 27, 33, 45, 59, 61, 77
# These taps are EXACTLY what spells out the two key components!
# NFSR: 11 1D 2D 3B 4F 5C 67 79
# LFSR: 03 1D 27 33 45 59 61 77
# If we convert these hex values directly to ASCII?
# NFSR: \x11 \x1d - ; O \ g y
# LFSR: \x03 \x1d ' 3 E Y a w
# Still not it.
# How do they "literally spell out the two key components"?
