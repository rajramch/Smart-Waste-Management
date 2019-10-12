#!/usr/bin/env python
import MySQLdb
import urllib2
import time

db = MySQLdb.connect(host="169.254.174.29",    # your host, usually localhost
                     user="rasp1",         # your username
                     passwd="pi",  # your password
                     db="swm")        # name of the data base


cur = db.cursor()
while 1:
    response = urllib2.urlopen("http://10.3.141.89")
    page_source = response.read()
    id = page_source.split('|')[0]
    distance = page_source.split('|')[1]
    intdist = int(distance)
    if (19-intdist)<0:
        level=0
    else:
        level = str((100.0*(float)(18-intdist))/18.0)
    try:
        cur.execute("""UPDATE bins set bins_cap_fill = %s where bins_id = %s""",(level, id))
        db.commit()
        print "Data Commited"
        print level
        print intdist
    
    except:
        print "Rollback"
    time.sleep(10)        

db.close()

