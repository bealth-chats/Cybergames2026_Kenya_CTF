from PIL import Image, ImageOps, ImageEnhance
import numpy as np

img = Image.open('average.png')
# Convert to float to stretch the histogram easily
data = np.array(img, dtype=np.float32)

# Find min and max to stretch to 0-255
min_val = np.min(data)
max_val = np.max(data)

# Normalize
data = (data - min_val) / (max_val - min_val) * 255
data = data.astype(np.uint8)

res = Image.fromarray(data)
res.save('enhanced.png')
print("Saved to enhanced.png")
