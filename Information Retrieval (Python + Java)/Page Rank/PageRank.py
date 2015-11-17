__author__ = 'Atif'
import math
from datetime import datetime
global set_inlinks
global set_inlinks_count
global set_outlinks_count
global set_inlinks_count
global source
global sink
global set_sink
global PR
global pages
global newPR

def main():
    set_inlinks={}
    set_outlinks={}
    set_outlinks_count={}
    set_inlinks_count={}
    set_sink=[]
    set_source=[]
    pages=[]
    file = "inlinks.txt"

    #Create the inlinks dictionary
    with open(file) as fin:
     rows = (line.split() for line in fin)
     set_inlinks = {row[0]:row[1:] for row in rows}

    #For loop to remove trailing spaces and duplicates form inlinks
    for k,v in set_inlinks.items():
        for i in v:
            if i not in set_inlinks and len(i)!=0:
                set_inlinks[i]=None
        set_inlinks[k] = list(set(i.strip() for i in v))

    for key,value in set_inlinks.items():
       pages.append(key)
       for i in value:
         pages.append(i)

       if value!=[]:
         for val1 in value:
          if val1 not in set_outlinks:
              set_outlinks[val1]=[]
          if val1 in set_outlinks:
            set_outlinks[val1].append(key)
          if key not in set_outlinks:
             set_outlinks.setdefault(key,[])

       else:
        if key not in set_outlinks:
         set_outlinks.setdefault(key,[])

    #Populate inlink count for each document ID
    for k1,v1 in set_inlinks.items():
        set_inlinks[k1] = list(set_inlinks[k1])
        set_inlinks_count[k1] = len(set(set_inlinks[k1]))
        if v1==[] or v1 is None:
            set_source.append(k1)

    #Populate the out link count for each document ID and populate the sink set
    for k,v in set_outlinks.items():
        if v==[]:
          set_sink.append(k)
        set_outlinks_count[k] = len(list(set(set_outlinks[k])))

    #Clear the dictionary for outlink to save memory
    set_outlinks.clear()

    #Remove duplicate entries from pages
    pages = list(set(pages))

    #call to the pagerank function
    pagerank(pages,set_sink,set_inlinks,set_inlinks_count,set_source,set_outlinks_count)

#Defition of page rank
def pagerank(pages,set_sink,set_inlinks,set_inlinks_count,set_source,set_outlinks_count):
   PR={}
   N=len(pages)
   init_pr=1/N
   iter=4
   m=0
   n=0
   d=0.85
   z=0
   new_perpelixity=0
   newPR={}

   #Initialize the page rank dictionary with initial value
   for p in pages:
       newPR[p]=0.0
       PR[p]= init_pr

   #pages = list(set(pages))

   #Call to function to calculate
   old_perplexity=calc_perplexity(PR)

   #Calculate the new page rank values
   while m < iter:
     sinkPR=0
     for p in set_sink:
        sinkPR = sinkPR + PR[p]

     for p in pages:
       newPR[p]= ((1-d) / N)
       newPR[p] = newPR[p] + ((d*sinkPR)/N)

       if set_inlinks[p] is not None:
        for q in set_inlinks.get(p):
         if set_outlinks_count[q]!=0:
          newPR[p]= newPR[p] + (d * PR[q]/(set_outlinks_count[q]))

     for p in pages:
         PR[p]=newPR[p]

     new_perpelixity = calc_perplexity(PR)
     if math.fabs(old_perplexity - new_perpelixity) <1:
         m=m+1
     old_perplexity =new_perpelixity
   display(PR,set_inlinks_count,set_inlinks,set_sink,set_source,pages)

   print("Writing output page ranks to file output.txt")
   for k,v in PR.items():
      with open('Output.txt', 'a', encoding='utf-8') as file:
        file.write(str(k) + " : " + str(v) + " ")
   print("Output is available in file in same directory")


def calc_perplexity(PR):
    e=0.0
    for v in PR.values():
      e= e + (v * (math.log(v) / math.log(2)) )
    return (math.pow(2, -e));


#Function to display the results
def display(PR,set_inlinks_count,set_inlinks,set_sink,set_source,pages):
    init_pr=1/(len(pages))
    PR_Count=[]
    i=0
    print("Top 50 Documents by Page Rank are :")
    for k,v in sorted(PR.items(),key=lambda x:x[1],reverse=True):
        print(str(k)+ " :"+ str(v))
        i=i+1
        if(i==50):
            break

    print("-------------------------------------------------------------------------------------------------------------------")
    i=0
    print("Top 50 Documents by in-link Counts are :")
    for k,v in sorted(set_inlinks_count.items(),key=lambda x:x[1],reverse=True):
       print(str(k) + " : "+ str(v))
       i=i+1
       if(i==50):
          break

    print("-------------------------------------------------------------------------------------------------------------------")

    print("The total number of pages: "+str(len(pages)))
    print("The toal number of sources: " + str(len(set_source)))
    print("The proportion of pages with no in-links: " + str(len(set_source)/len(pages)))

    print("-------------------------------------------------------------------------------------------------------------------")

    print("The total number of pages: "+str(len(pages)))
    print("The toal number of sink: " + str(len(set_sink)))
    print("The proportion of pages with no out-links: " + str(len(set_sink)/len(pages)))

    print("-------------------------------------------------------------------------------------------------------------------")

    for k,v in PR.items():
        if v < init_pr:
            PR_Count.append(v)

    print("The proportion of pages whose PageRank is less than their initial: " + str(len(PR_Count)/len(pages)))


init_time = datetime.now()
print("Average run time of this code is 1 minute 12 seconds")
print("-------------------------------------------------------------------------------------------------------------------")
main()
time_elapsed = datetime.now() - init_time

print("-------------------------------------------------------------------------------------------------------------------")
print("Total time elapsed in running the code: " + str(divmod(time_elapsed.total_seconds(),60)))
