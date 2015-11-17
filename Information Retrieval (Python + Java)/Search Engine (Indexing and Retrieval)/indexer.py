__author__ = 'Atif'

import json
import os.path

global index
global inputFile

def main():
 inputFile = input('Please enter the corpus file name    \n')
 #inputFile="tccorpus.txt"
 print('Generating index file index.out..............')
 parsedCorpus = parser(inputFile)
 index = generateIndexList(parsedCorpus)
 if os.path.isfile('index.out'):
     os.remove('index.out')
     print('Error: index.out already exists. Program has deleted existing index.out file. Please run the program again')
 else:
    with open('index.out', 'w') as file:
        json.dump(index, file)
    print('Successfully created the index file "index.out"')


# Function to break the file data based on docid and load into dictionary
def parser(inputFile):
  corpusParsedDict = {}
  r1=[]
  with open(inputFile) as fin:
    blankJoin = ''.join(fin.readlines())
  rows = blankJoin.split('#')[1:]
  for row in rows:
    r = row.split()
    r1.append(r[0])                                  # Split the document id from rest of the items before removing digits
    for j in r:
      if(not j.isdigit()):                           # loop to remove the pure digits from the token set
         r1.append(j);
      corpusParsedDict[r1[0]] = r1[1:]                # add only character to the dictionary with keys as document id
    r1.clear()
  return corpusParsedDict

# Function to generate IndexList based on the document id and tokens
def generateIndexList(parsedCorpus):
    tokens = {}
    index = {}
    documentId = parsedCorpus.keys()
    for id in documentId:                                   #loop over all the document id in corpus
        for token in parsedCorpus.get(id):                  #For each document id, generate token of items and generate index
            if token in index:
                if id in index.get(token):
                   index[token][id] =  index[token][id] + 1
                else:
                    index[token][id] = 1
            else:
                termfreq ={}
                termfreq[id] =1
                index[token] = termfreq

        tokens[id] = len(parsedCorpus[id])
    return index, tokens
main()
