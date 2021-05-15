#!/usr/bin/env python
# coding: utf-8

# In[349]:


import random


# In[350]:


text = "What the fuck did you just fucking say about me, you little bitch?"


# In[351]:


def capi_sentence(sentence):
    new_sentence = ""
    number = 0 #Dummy number for tracking

    for letter in sentence.lower():
        if len(new_sentence)<2: #Creates the first two letter
            random_number = random.randint(0,1) #This randomly decides if the letter should be upper or lowercase
            if random_number==0:
                new_sentence += letter.upper()
            else:
                new_sentence += letter
        else:
            if (new_sentence[number-2].isupper() and new_sentence[number-1].isupper() or new_sentence[number-2].islower() and new_sentence[number-1].islower())==True:
                #Checks if the two letters before are both upper or lowercase
                if new_sentence[number-1].isupper(): #Makes the next letter the opposite of the letter before
                    new_sentence += letter.lower()
                else:
                    new_sentence += letter.upper()
            else:
                random_number = random.randint(0,1)
                if random_number==0:
                    new_sentence += letter.upper()
                else:
                    new_sentence += letter
                
        number += 1 #Add one more to the tracking
     
    print(new_sentence)


# In[352]:


capi_sentence(text)

