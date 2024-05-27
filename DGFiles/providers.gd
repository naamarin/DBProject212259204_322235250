
[General]
Version=1

[Preferences]
Username=
Password=2134
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=PROVIDERS
Count=400

[Record]
Name=PROVNAME
Type=VARCHAR2
Size=20
Data=FirstName'-'LastName
Master=

[Record]
Name=PROVPHONENUMBER
Type=VARCHAR2
Size=20
Data='0' + Random(11, 99) '-' Random(1111111, 9999999)
Master=

[Record]
Name=PROVID
Type=NUMBER
Size=
Data=Random(111111111, 999999999)
Master=

