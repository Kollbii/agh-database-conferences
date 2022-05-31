# agh-database-conferences
University project for DB course in Transact-SQL

### DB diagram
![Diagram](assets/Database_Model.png)

### Views 

1. ShowConferences done

1. ShowWorkshops done

1. ShowParticipants done; pokazuje participantid, imie, nazwizko, workshopid, temat ws, i czas startu

1. ShowPaymentDetails not working; planowałam pokazac paymentid, cene, nazwe conf i temat ws, imie i nazwisko uczestnika -> tu problemem moze byc ze nie musi byc zawsze ws i tutaj umiera

1. ShowCustomers not working; tak samo, wyniemmie wystepuje imie+nazwisko i companyname i moglby byc null ale to chyba jest problemem -> proba ifnull

1. PaymetsStatistics done; mowiac szczerze nie wiem czy nie pomieszałam z showpaymentdetails ale nie jest opisane wiec zgaduje; tutaj jest paymentid, totalprice, ispaid,iscanceled, iswh, wsid, historyid, ammount, i daty

1. FreeSeatsWorkshops nope; tutaj probowałam ale mi nie wyszlo 

1. ShowPrice done; ale upewnijcie sie ze o to wam chodzilo

1. MostActiveCustomer done; na podstawie waszych rozwiazan 

1. MostActiveCustomerPrivatePaymentSum te ponizej wy robiliscie wiec zakładam ze dobrze, bo wyniki wychodza 

1. MostActiveCustomerCompanyPaymentSum

1. MostActiveCustomerPrivateWorkshopAttendee
