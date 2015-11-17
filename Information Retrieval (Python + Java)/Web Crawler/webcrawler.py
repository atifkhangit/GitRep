__author__ = 'Atif'
import requests
import re
from bs4 import BeautifulSoup
import time

def main():
    global seed
    global keyphrase
    print('Please enter the seed url')
    seed = input()

    print('Please enter the key phrase or hit enter to leave blank')
    keyphrase =input()

    global url_master
    global url_keyphrase
    global url_keyphrase1
    global url_nokeyphrase1
    global visited_url
    global limit
    global depth
    global cnt
    global url_nokyephrase
    url_keyphrase=[]
    url_nokeyphrase =[]
    url_master=[]
    visited_url =[]
    href=[]
    url_nokyephrase1=[]
    url_kyephrase1=[]
    limit = 1000
    depth = 1
    seed_source  = requests.get(seed)
    seed_text = seed_source.text
    soup = BeautifulSoup(seed_text)
    for link in soup.findAll('a',href=re.compile('^/wiki/')):
      href.append((link.get('href')))
    href = exclude_link(href)
    url_master = attach_prefix(href)
    url_master=list(set(url_master))
    url_nokeyphrase =url_master[:]
    url_keyphrase =url_master[:]
    if len(keyphrase) >1:
     crawl_keyphrase(url_keyphrase,keyphrase,depth)
     for k in url_keyphrase:
      with open('KeyPhrase_Result.txt', 'a', encoding='utf-8') as file:
        file.write(str(k) + '\n')
    else:
     crawl_nokeyphrase(url_nokeyphrase,depth)
     for k in url_nokeyphrase:
      with open('NonKeyPhrase_Result.txt', 'a', encoding='utf-8') as file:
       file.write(str(k) + '\n')

global url_temp2
url_temp2=[]
url_temp3 =[]
url_temp4 =[]
url_nokeyphrase1 =[]
keyphrase_match =''
url_keyphrase1 =[]

def crawl_keyphrase(url_keyphrase,keyphrase,depth):
    while len(url_keyphrase1) <= 1000 and depth<=5:
        for i in url_keyphrase:
          keyphrase_match = search_keyphrase(i,keyphrase)
          if i not in visited_url and depth <=5 and len(keyphrase_match)>1:
            visited_url.append(i)
            time.sleep(1)
            url_temp3.extend(list(crawler(i)))
            url_temp4 = list(set(url_temp3))
            depth = depth + 1
        if len(url_temp4)>1:
         for j in url_temp4:
          if j not in url_keyphrase:
           url_keyphrase.append(j)
         url_keyphrase = list(set(url_keyphrase))
         url_keyphrase1.extend(url_keyphrase)
        depth=1
        crawl_keyphrase(url_keyphrase,keyphrase,depth)


def search_keyphrase(i,keyphrase):
    url_source  = requests.get(i)
    url_text = url_source.text
    soup = BeautifulSoup(url_text)
    find_keyphrase= soup.body.findAll(text=re.compile(keyphrase))
    return find_keyphrase


def crawl_nokeyphrase(url_nokeyphrase,depth):
    while len(url_nokeyphrase1) <= 1000 and depth <=5:
      for i in url_nokeyphrase:
         if i not in visited_url and depth <=5:
           visited_url.append(i)
           time.sleep(1)
           url_temp3.extend(list(crawler(i)))
           url_temp4 = list(set(url_temp3))
           depth = depth + 1
      if len(url_temp4)>1:
       for j in url_temp4:
        if j not in url_nokeyphrase and len(url_nokeyphrase) <1000:
         url_nokeyphrase.append(j)
       url_nokeyphrase = list(set(url_nokeyphrase))
       url_nokeyphrase1.extend(url_nokeyphrase)
      depth=1
      crawl_nokeyphrase(url_nokeyphrase,depth)


def exclude_link(href):
    filtered_link = []
    for i in href:
     if ':' not in i and '/wiki/Main_Page' not in i and '/wiki/Hugh_of_Saint-Cher' not in i and '#' not in i:
      filtered_link.append(i)
    return filtered_link

def attach_prefix(href):
    complete_link=[]
    string = 'http://en.wikipedia.org'
    complete_link= [string+ i for i in href]
    #print(complete_link)
    return complete_link


def crawler(i):
         href=[]
         url_temp=[]
         url_temp1=[]
         url_source  = requests.get(i)
         url_text = url_source.text
         soup = BeautifulSoup(url_text)
         for link in soup.findAll('a',href=re.compile('^/wiki/')):
              href.append(link.get('href'))
              href = exclude_link(href)
              url_temp = attach_prefix(href)
         url_temp1 =list(set(url_temp))
         return url_temp1

main()
