import glob
from PIL import Image
import numpy as np

files = glob.glob('extracted_images/*.png')
print(f"Loaded {len(files)} files")
all_imgs = [np.array(Image.open(f), dtype=np.float64) for f in files]

mean_img = np.mean(all_imgs, axis=0)

min_val = np.min(mean_img)
max_val = np.max(mean_img)
print(f"Mean image float range: {min_val} to {max_val}")

stretched = (mean_img - min_val) / (max_val - min_val) * 255.0
stretched = stretched.astype(np.uint8)

Image.fromarray(stretched).save('better_average.png')
print("Saved better_average.png")
