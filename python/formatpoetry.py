import re
import json
import os
  
# Get the list of all files and directories
path = "//home//muku//Desktop//tulips"
dir_list = os.listdir(path)
print(len(dir_list))
filterr=re.compile(r'.txt')
#-------------------------------------------------
objects={}
out=open("tulips" +".json",'w')
#---------------------------------------------------
start=re.compile(r'(Mon|Tues|Thurs|Fri|Satur|Sun|Wednes)day,')
end=re.compile(r'Posted by')
ignore=re.compile(r'.(jpeg|JPEG|gif|GIF|png|PNG|jpg|JPG)\]')
#--------------------------------------------

def parsefile(fname):
	index=0
	paragraph=""
	running=True
	titlestr="";#datewise
	inp=open(fname, 'r')
	lines=inp.readlines()
	inp.close()
	while index<len(lines) and running:
		line= lines[index]
		if end.search(line)!=None:
			running=False
		elif start.search(line)!=None:
			titlestr=line.strip();
			print(titlestr)
			index=index+1
			paragraph=""
			while index<len(lines) and running:
				line= lines[index]
				if end.search(line)!=None:
					running=False
					objects[titlestr]=paragraph
				elif not(ignore.search(line)!=None or len(line.strip())==0):
					lineF=""
					for i in range(len(line)):
						if line[i]=='"':
							lineF+='\\"'
						else:
							lineF+=line[i]
					paragraph=paragraph+lineF.strip()+" "
					index=index+1 
				else:
					index=index+1
			runnin=False
			print(paragraph)
		else:
			index=index+1
			

for f in dir_list:
	if filterr.search(f)!=None:
		print(f)
		parsefile(f)
		print("DONE")

out.write( '{'+'"' + "data" +'"' + ':'+'[' )
for key,value in objects.items():
	out.write('{'+'"' + "title" +'"' + ':' + '"' + key + '"' +',' + '"' + "content"+ '"' + ':' + '"' + value + '"' +'},')
	
out.write('{'+'"' + "title" +'"' + ':' + '"' + "end" + '"' +',' + '"' + "content"+ '"' + ':' + '"' +"null" + '"' +'}' +']}')
out.close()
print("YAY")