
[General]
Version=1

[Preferences]
Username=
Password=2811
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=WORKERORDER
Count=400

[Record]
Name=WORKERID
Type=NUMBER
Size=
Data=List(select workerid from workers)
Master=

[Record]
Name=ORDERID
Type=NUMBER
Size=
Data=List(select orderid from orders)
Master=

