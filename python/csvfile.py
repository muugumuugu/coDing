
import csv 

songlist=[]
# opening the CSV file 
with open("/home/muku/Music/down.csv", mode ='r')as file: 
    
	# reading the CSV file 
	csvFile = csv.reader(file) 
	
	# displaying the contents of the CSV file 
	for line in csvFile: 
		if len(line[0]):
			name=line[0]
			artist=line[1]
			album=line[2]
			songlist.append(name + " " + artist)
			
print(songlist)
			