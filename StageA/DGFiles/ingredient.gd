
[General]
Version=1

[Preferences]
Username=
Password=2910
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=INGREDIENTS
Count=390

[Record]
Name=INGREDAMOUNT
Type=NUMBER
Size=
Data=Random(1,200)
Master=

[Record]
Name=PRODID
Type=NUMBER
Size=
Data=List(select prodid from product)
Master=

[Record]
Name=MEALID
Type=NUMBER
Size=
Data=List(select mealid from meal)
Master=

