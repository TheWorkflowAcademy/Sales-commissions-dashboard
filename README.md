# Sales Commissions Dashboard
Create dashboards according to any business's criteria that update daily in Analytics to avoid having to go back monthly or quarterly and manually calculate salespersons' commissions.

## What do I need to do before creating the Query in Analytics?
You must create a custom field in the "Users" section of Books to put in each salesperson's commission rate. Also, in the "Items" section, create a custom field to mark if each item, service, etc. is commissionable or not. Then, ensure the Zoho Finance suite is synced to Analytics.

### SQL Code explanation
It is pretty straightforward. Also, most of the table names in Zoho are generalized and if not the same, should be similar. 

This code creates a list (base table of `Invoice Items`) of all items invoiced that are commissionable and draws in information from the Users (the salespeople of the business), Invoices, and Items tables. A simple mathematical calculation gives the amount of commissions attributed to the salesperson for each item.

This report itself is not ideal; it is not in summary format. So, you can run another query on top of it to aggregate totals and sort by salesperson, or you can simply just use the charts or tables within Zoho Analytics to create nice-looking reports! This can also be modified in many ways. Total sales by salesperson, filter by certain big-ticket items, calculate a manager's commissions (if his/hers depend on the sales of an entire team), etc. The possibilities are endless
