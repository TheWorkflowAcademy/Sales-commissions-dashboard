# Sales Commissions Dashboard
Create dashboards according to any business's criteria that update regularly in Analytics and avoid the extra monthly or quarterly work of manually calculating commissions.

## What do I need to do before creating the Query in Analytics?
This sample code is built off of the Invoice module in Zoho Books. However, it can be generalized to Zoho CRM as well. For each step described below for Books, think about the parallel steps to build the same report with CRM data.

A couple things to think about: do all salespeople have the same commission rate and are all items commissionable? If not, you must create a custom field in the "Users" section of Books to specify each salesperson's commission rate. Also, in the "Items" section, create a custom field to mark if each item or service is commissionable or not. 

Additionally, in each record module (invoices, sales orders, etc.) you will have to add a custom lookup field to the Users module to relate each record to a specific salesperson. But, in CRM, this would just be the record owner. Then, ensure the Zoho Finance suite (or Zoho CRM) is synced to Analytics.

### SQL Code explanation
It is pretty straightforward. Most table names in Zoho are generalized and if not the same, should be similar. The key components are the total sales amount and that it be filterable by Salesperson (record owner in CRM). Bonus information would be the date of the sale and if individual items can be marked commissionable or not.

This code creates a list (base table of `Invoice Items`) of all items invoiced that are commissionable and draws in information from the Users (the salespeople of the business), Invoices, and Items tables. (Here we use the Invoices table because we want to filter by if is has been paid for already, but almost any module with a total dollar amount could theoretically work) A simple mathematical calculation gives the amount of commissions attributed to the salesperson for each item.

This report itself is not ideal but is a means to an end; it is not in summary format. So, you can run another query on top of it to aggregate totals and sort by salesperson, or you can simply just use the charts or tables within Zoho Analytics to create nice-looking reports! This can also be modified in many ways. Total sales by salesperson, filter by certain big-ticket items, calculate a manager's commissions (if his/hers depend on the sales of an entire team), etc. The possibilities are endless.
