
[General]
Version=1

[Preferences]
Username=
Password=2097
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=PRODUCT
Count=10..20

[Record]
Name=PRODID
Type=NUMBER
Size=
Data=Random(11, 999)
Master=

[Record]
Name=PRODNAME
Type=VARCHAR2
Size=20
Data=List(Sugar, salt, turmeric, chicken soup, paprika, black-pepper, chicken-breast, eggs, potatoes, shawarma, tomato, cucumber, pickles, hummus, tahini, ketchup, chicken, steak, eggplant)
Master=

[Record]
Name=PRODPRICE
Type=NUMBER
Size=
Data=Random(0, 150)
Master=

[Record]
Name=PRODAMOUNT
Type=NUMBER
Size=
Data=Random(0, 100)
Master=

[Record]
Name=PROVID
Type=NUMBER
Size=
Data=List(select provID from Providers)
Master=

