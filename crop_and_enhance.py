import cv2
import numpy as np

# Load variance.png
img = cv2.imread('variance.png', cv2.IMREAD_GRAYSCALE)

# Crop to the center where the text is
h, w = img.shape
# The text is mostly in the middle horizontally, and slightly below the middle vertically.
# Let's crop a box containing the text.
crop = img[h//2-100:h//2+100, 50:w-50]

# Apply thresholding
_, thresh = cv2.threshold(crop, 150, 255, cv2.THRESH_BINARY_INV)

# Also try adaptive thresholding
adaptive = cv2.adaptiveThreshold(crop, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)

# Save the results
cv2.imwrite('thresh.png', thresh)
cv2.imwrite('adaptive.png', adaptive)
cv2.imwrite('crop.png', crop)

print("Saved enhancements.")
