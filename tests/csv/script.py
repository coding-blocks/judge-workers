# sums up all the values from each csv and finds diff
import csv
with open('user.csv', newline='') as user:
  with open('ref.csv', newline='') as ref:
    userReader = csv.reader(user)
    refReader = csv.reader(ref)

    userInput = []
    refInput = []
    for v in userReader: 
      userInput.append(sum([ int(x) for x in v ]))
    for v in refReader:
      refInput.append(sum([ int(x) for x in v ]))
    
    y = 0
    for i in range(0, len(userInput)):
      y += userInput[i] - refInput[i]
    
    print (y)