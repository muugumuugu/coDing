import json

#inpt files should have jsons with array as data for the only  property that is named a  digit.
files=['new.json','neww.json']
result ='{'+ '"' "data" + '"' +':[';

def merge_JsonFiles(filename):
	res=""
	for f1 in filename:
		with open(f1, 'r') as infile:
			res+=infile.readline()[6:-3] + ","
	return res[:-1]

res=merge_JsonFiles(files)
result+=res + ']'+ '}'
out=open('combinedFinal.json', 'w')
#y=json.dump(result);
out.write(result);

