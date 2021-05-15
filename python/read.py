import pyttsx3
import PyPDF2

from tkinter import Tk
from tkinter.filedialog import askopenfilename

Tk().withdraw() # we don't want a full GUI, so keep the root window from appearing
filelocation = askopenfilename() # open the dialog GUI
book=open(filelocation,"rb")
pdfReader=PyPDF2.PdfFileReader(book)
pages=pdfReader.numPages
speaker=pyttsx3.init()
for num in range(pages):
	page=pdfReader.getPage(num)
	txt=page.extractText()
	speaker.say(text)
	speaker.runAndWait()