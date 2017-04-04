import pandas as pd
import json
import os
import csv

dates = pd.date_range('20160401', '20160520')
dates05 = pd.date_range('20160501','20160520')
step = []
name = []

user_name = 'A0'
num = 1

for x in range(1,99):
    i = 0
    if os.path.exists('sokulee/A0'+str(x)) == True:
        if os.path.exists('sokulee/A0'+ str(x) + '/A0' + str(x) + '_' + '20160401' + '_steps.json') == True:
            for date in dates:
                fname = 'sokulee/A0'+ str(x) + '/A0' + str(x) + '_' + date.strftime('%Y%m%d') + '_steps.json'
                try: f = open(fname)
                except IOError as e:
                    print(str(e))
                else:
                    date_data = json.loads(f.read())
                    if (list(date_data.keys()) == ['errors', 'success'] or list(date_data.keys()) == ['success','errors']) == False :
                        i = i + int(date_data['activities-steps'][0]['value'])
        else :
            for date in dates05:
                fname = 'sokulee/A0'+ str(x) + '/A0' + str(x) + '_' + date.strftime('%Y%m%d') + '_steps.json'
                try: f = open(fname)
                except IOError as e:
                    print(str(e))
                else:
                    date_data = json.loads(f.read())
                    if (list(date_data.keys()) == ['errors', 'success'] or list(date_data.keys()) == ['success','errors']) == False :
                        i = i + int(date_data['activities-steps'][0]['value'])
        name.append(user_name + str(x))
        step.append(i)


with open('step.csv','w',newline='\n') as csvfile:
    fieldnames = ['name','total_steps']
    writer = csv.DictWriter(csvfile,fieldnames=fieldnames)
    writer.writeheader()
    for x in range(0,68):
        writer.writerow({'name' : str(name[x]), 'total_steps' : str(step[x])})
