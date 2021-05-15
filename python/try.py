import json
#write a json
objects={"mememem": "uwuuuuu", "nssbc=c": "ccsdvsdvs" , "cdcavav": "vsdvsdvsdv"}
fname="1"
out=open("new.json",'w');
outt=open("neww.json",'w');
out.write('{'+ '"' + fname + '"' +':[');

#outt.write(json.dumps(objects)) #works ok
for key,value in objects.items():
	out.write('{'+'"' + "title" +'"' + ':' + '"' + key + '"' +',' + '"' + "content"+ '"' + ':' + '"' + value + '"' +'},')
out.write('{"' + "title" + '":' + '"' +"end"+' ",' + '"' + "content"+ '":' + '"' + "end" + '"}]}')
