import os
import glob
from PIL import Image
import numpy as np

files = glob.glob('extracted_images/*.png')
print(f"Total files: {len(files)}")

if files:
    img = Image.open(files[0])
    data = np.array(img)
    print(f"Shape: {data.shape}")
    print(f"Min: {np.min(data)}, Max: {np.max(data)}, Mean: {np.mean(data)}")
