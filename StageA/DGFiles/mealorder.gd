
[General]
Version=1

[Preferences]
Username=
Password=2212
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=MEALORDER
Count=400

[Record]
Name=MEALAMOUNT
Type=NUMBER
Size=
Data=Random(1,10)
Master=

[Record]
Name=MEALID
Type=NUMBER
Size=
Data=List(select mealID from meal)
Master=

[Record]
Name=ORDERID
Type=NUMBER
Size=
Data=List(select orderID from orders)
Master=

