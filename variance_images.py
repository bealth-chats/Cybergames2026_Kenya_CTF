import glob
from PIL import Image
import numpy as np

files = glob.glob('extracted_images/*.png')
print(f"Loaded {len(files)} files")
all_imgs = [np.array(Image.open(f), dtype=np.float64) for f in files]

var_img = np.var(all_imgs, axis=0)

min_val = np.min(var_img)
max_val = np.max(var_img)
print(f"Variance image float range: {min_val} to {max_val}")

stretched = (var_img - min_val) / (max_val - min_val) * 255.0
stretched = stretched.astype(np.uint8)

Image.fromarray(stretched).save('variance.png')
print("Saved variance.png")

std_img = np.std(all_imgs, axis=0)
min_val = np.min(std_img)
max_val = np.max(std_img)
print(f"Std image float range: {min_val} to {max_val}")
stretched_std = (std_img - min_val) / (max_val - min_val) * 255.0
stretched_std = stretched_std.astype(np.uint8)
Image.fromarray(stretched_std).save('std.png')
print("Saved std.png")
