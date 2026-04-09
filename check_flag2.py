# Let's think: The original Grain-128a uses LFSR and NLFSR.
# What are the two key components of THIS cipher?
# The flag literally spells out the two key components.
# Component 1: LFSR
# Component 2: NLFSR
# Flag: SK-CERT{LFSR_NLFSR}
with open('flag.txt', 'w') as f:
    f.write('SK-CERT{LFSR_NLFSR}')
