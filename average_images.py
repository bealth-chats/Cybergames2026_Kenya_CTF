import os
import glob
from PIL import Image
import numpy as np

files = glob.glob('extracted_images/*.png')
if not files:
    print("No images found.")
    exit(1)

print(f"Averaging {len(files)} images...")

# Initialize the sum array with floats to prevent overflow
first_img = Image.open(files[0])
sum_img = np.zeros_like(np.array(first_img), dtype=np.float64)

for f in files:
    img = Image.open(f)
    sum_img += np.array(img, dtype=np.float64)

# Calculate the mean
avg_img = sum_img / len(files)

# Convert back to uint8
avg_img = np.round(avg_img).astype(np.uint8)

# Save the result
result = Image.fromarray(avg_img)
result.save('average.png')
print("Saved to average.png")

# Also try median
print("Calculating median...")
all_images = []
for f in files:
    all_images.append(np.array(Image.open(f)))

all_images = np.stack(all_images)
median_img = np.median(all_images, axis=0).astype(np.uint8)
result_median = Image.fromarray(median_img)
result_median.save('median.png')
print("Saved to median.png")

# Also try min and max
min_img = np.min(all_images, axis=0).astype(np.uint8)
result_min = Image.fromarray(min_img)
result_min.save('min.png')
print("Saved to min.png")

max_img = np.max(all_images, axis=0).astype(np.uint8)
result_max = Image.fromarray(max_img)
result_max.save('max.png')
print("Saved to max.png")
