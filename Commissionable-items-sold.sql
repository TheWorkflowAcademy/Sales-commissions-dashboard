SELECT
		 I."Item Name" AS "Item Name",
		 I."Sub Total (BCY)" AS "Sub Total",
		 II."Invoice Number" AS "Invoice Number",
     /* or some other unique identifier that the business might want to track */
		 II."Invoice Date" AS 'Invoice Date',
		 II."Last Payment Date" AS "Payment Date",
     /* much of this data is actually really useful for other reports we can make, i.e. how long 
     payments take to come in after being invoiced */
		 II."Invoice Status" AS "Invoice Status",
		 IIII."Commission Rate" AS "Commission Rate",
		 III."Commissionable?" AS 'Commissionable?',
     /* the unique fields to this Query are the Commission Rate and Commissionable? fields, need to be added to Books */
		 I."Sub Total (BCY)" * IIII."Commission Rate" / 100 AS 'Commmission',
		 IIII."UserName" AS "Salesperson"
FROM  "Invoice Items" I
LEFT JOIN "Invoices" II ON I."Invoice ID"  = II."Invoice ID" 
LEFT JOIN "Items" III ON I."Product ID"  = III."Item ID" 
LEFT JOIN "Users" IIII ON IIII."User ID"  = II."Rep"  
/* simple joining of tables via the right connection fields */
WHERE	 III."Commissionable?"  LIKE 'Yes'
 AND	(II."Invoice Status"  LIKE 'Closed'
 OR	II."Invoice Status"  LIKE 'PartiallyPaid')
 /* we only want Commissionable items, and invoices Partially Paid or Closed */
