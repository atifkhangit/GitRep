__author__ = 'Atif'

import json
from math import log

global k1
global k2
global b
global qf
global r
global R
global limit
global query_id

k1=1.2
k2=100
b=0.75
qf=1
R=0
r=0

def main():
    queryresult =[]
    index =input('Enter the index file name (eg: index.out) \n')
    queries=input('Enter the queries file name (eg:queries.txt) \n')
    limit =int(input('Enter the maximum number of documents (eg:100) \n'))
    print('Please wait program running................')
    query_id = 1
    i=0
    rank=1

    parsedqueries = parser(queries)          #parse the query file and generate query tokens list
    with open(index) as indexfile:           # load the index.out file
        indexdata = json.load(indexfile)
    indexlist= indexdata[0]
    tokenlist = indexdata[1]

    for querytermslist in parsedqueries:      #For each individual query list from parsed query set.. execute query
        executionresult = queryexecute(indexlist,tokenlist,querytermslist)
        queryresult.append(executionresult)

    print('Printing results.eval..........')
    for r in queryresult:
        finalresult = sorted(r.items(), key=lambda x:x[1],reverse=True)      # Sort the results in descending order
        rank = 1
        for i in finalresult[:limit]:                                        # Limit the number of records to the limit set in input
            docid=i[0]
            bm25=i[1]
            outputstring = (query_id, docid, rank, bm25)
            print ('{:>3}\tQ0\t{:>4}\t{:>2}\t{:>12}\tATIFKHAN'.format(*outputstring))
            rank = rank + 1
        query_id = query_id + 1

#Function to parse query file and generate querytokens
def parser(queries):
    qterms=[]
    qterms.clear()
    with open(queries) as qfile:
        rows = (line.split() for line in qfile)
        for row in rows:
            qterms.append(row)
    return qterms

#Function to execute queries and generate the BM25 score
def queryexecute(indexlist,tokenlist,querytermslist):
    resultset={}
    documentdictionary={}
    N = len(tokenlist)
    for queryterm in querytermslist:                   #Get each individual query token in list of parsed queries
        if queryterm in indexlist:
            documentdictionary = indexlist[queryterm]
            for documentid, frequency in documentdictionary.items():
                n=len(documentdictionary)
                f=frequency
                dl = tokenlist[documentid]
                avdl = avgDocLength(tokenlist)
                bm25score = calcScore(qf,n,f,r,N,dl,avdl)  # Calculate the BM25 Score
                if documentid in resultset:
                    a = resultset.get(documentid)
                    a = a + bm25score
                    resultset[documentid] = a
                else:
                     resultset[documentid] = bm25score
    return resultset

#Function to calculate BM25 Score
def calcScore(qf,n,f,r,N,dl,avdl):
    K = k1 * ((1 - b) + b * (float(dl) / float(avdl)))
    part1 = log(((r + 0.5) / (R - r + 0.5)) / ((n - r + 0.5) / (N - n - R + r + 0.5)))
    part2 = ((k1 + 1) * f) / (K + f)
    part3 = ((k2 + 1) * qf) / (k2 + qf)
    score = part1 * part2 * part3
    return score

#Function to calculate average document length
def avgDocLength(tokenlist):
    length = 0
    for t in tokenlist.values():
        length =  length + t
    avglength= float(length) / float(len(tokenlist))
    return avglength

main()