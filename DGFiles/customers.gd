
[General]
Version=1

[Preferences]
Username=
Password=2768
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=CUSTOMERS
Count=410

[Record]
Name=CUSTPHONENUMBER
Type=VARCHAR2
Size=20
Data='0' + Random(11, 99) '-' Random(1111111, 9999999)
Master=

[Record]
Name=CUSTNAME
Type=VARCHAR2
Size=20
Data=FirstName'-'LastName
Master=

[Record]
Name=CUSTADDRESS
Type=VARCHAR2
Size=20
Data=City ',' Address1
Master=

[Record]
Name=CUSTID
Type=NUMBER
Size=
Data=Random(111111111, 999999999)
Master=

