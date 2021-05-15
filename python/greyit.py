import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

def rgb2gray(rgb):
	return np.dot(rgb[...,:3], [0.2989, 0.5870, 0.1140])

img = mpimg.imread(r"/home/muku/Desktop/coding/python/th.jpeg")   
gray = rgb2gray(img)
print(gray)
plt.imshow(gray, cmap=plt.get_cmap('gray'))
plt.show()