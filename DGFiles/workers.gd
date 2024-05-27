
[General]
Version=1

[Preferences]
Username=
Password=2765
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=WORKERS
Count=400

[Record]
Name=WORKERID
Type=NUMBER
Size=
Data=Random(111111111, 999999999)
Master=

[Record]
Name=WORKNAME
Type=VARCHAR2
Size=20
Data=FirstName'-'LastName
Master=

[Record]
Name=WORKERJOBTITLE
Type=VARCHAR2
Size=20
Data=List(Chef, Sous-chef, Dishwasher, Director,Cleaner,Delivery-guy)
Master=

[Record]
Name=WORKERSALARY
Type=NUMBER
Size=
Data=Random(5000, 10000)
Master=

[Record]
Name=WORKERBIRTHDATE
Type=DATE
Size=
Data=Random(1/1/1950, 1/1/2016)
Master=

