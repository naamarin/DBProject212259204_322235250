
[General]
Version=1

[Preferences]
Username=
Password=2793
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=MEAL
Count=10..20

[Record]
Name=MEALID
Type=NUMBER
Size=
Data=Random(111,999)
Master=

[Record]
Name=MEALNAME
Type=VARCHAR2
Size=
Data=List(Schnitzel, shawarma, chicken-skewer, entrecote-skewer, kebab-skewer, chicken, steak, kebab, chips, salad, water, cola, beer)
Master=

[Record]
Name=MEALPRICE
Type=NUMBER
Size=
Data=Random(15, 150)
Master=

