
import numpy as np 
import matplotlib.pyplot as plt 
  
#setting the axes projection as polar 
#plt.axes(projection = 'polar') 

  
# creating an array containing the 
# radian values 
#rads = np.arange(0, (2 * np.pi), 0.01) 
num=int(input("How dense"))
# plotting the circle 
prime=False
def getprimes(nums):
	prime=False
	primes=[]
	for num in nums:
		for check in range(2,int(num**0.5)+2):
			if num%check==0:
				prime=False
				break
			else:
				prime=True
		if prime: primes.append(num)
	return primes
primes=getprimes(range(1,num+1))
print(primes)
		
for num in primes: 
	plt.polar(num, num ,"g.") 
  # display the Polar plot 
plt.axis("off")
plt.savefig("lossless.svg")
plt.show() 
