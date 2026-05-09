import easyocr
import cv2

reader = easyocr.Reader(['en'])
result = reader.readtext('eclipse-protocol/droppers/cat.png')
for (bbox, text, prob) in result:
    print(f"Text: {text}, Probability: {prob}")
