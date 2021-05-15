from skimage import io, img_as_float
import numpy as np
def avgimg(path):
	image = io.imread(path)
	image = img_as_float(image)
	return np.mean(image)