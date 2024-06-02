
[General]
Version=1

[Preferences]
Username=
Password=2076
Database=
DateFormat=dd-mm-yyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NAAMA
Name=ORDERS
Count=400

[Record]
Name=ORDERID
Type=NUMBER
Size=
Data=Random(11111,99999)
Master=

[Record]
Name=ORDERPRICE
Type=NUMBER
Size=
Data=Components.Price
Master=

[Record]
Name=ORDERSTATUS
Type=VARCHAR2
Size=20
Data=List(Received, in-preparation, Ready, Sent, Delivered)
Master=

[Record]
Name=ORDERDATE
Type=DATE
Size=
Data=Random(1/1/2024, 27/5/2024)
Master=

[Record]
Name=CUSTID
Type=NUMBER
Size=
Data=List(select custID from customers)
Master=

