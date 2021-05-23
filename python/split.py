import os
home_dir = os.path.expanduser('~')
from pathlib import Path
#===============================================================
def parse(fname,delimeter):
	postlst=[];
	prefix=fname[:-4]
	suffix=fname[-4:]
	print(prefix)
	print(suffix)
	blog=open(fname,'r')
	blob=blog.readlines()
	post="";
	for i in range(len(blob)):
		if blob[i].strip()==delimeter:
			postlst.append(post);
			post="";
		else:
			post=post+blob[i]
	postlst.append(post)
	blog.close();
	export(prefix,suffix,postlst)

#===================================================================
def export(prefix,suffix,postlst):
	for i in range(len(postlst)):
		post=postlst[i];
		fn = Path(home_dir +"/Desktop/bgs/txts/"+prefix+str(i)+suffix)
		print(fn)
		fn.touch(exist_ok=True)  # will create file, if it exists will do nothing
		newfile=open(fn,'w')
		newfile.write(post)
		newfile.close()
	print("done")
#===========================================================

fn=input("Enter fileName with three letter extension: ")
delim=input("Enter delimeter: ")
parse(fn,delim)