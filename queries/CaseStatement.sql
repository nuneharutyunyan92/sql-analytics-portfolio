Select 
AVG(total_sales)as avg_sales
From sales_analysis


Select
	Count (customer_name), 
    Case
        When AVG(total_sales) > 251 THEN 'Above Average'
       	When AVG(total_sales) = 251 THEN 'Average'
   	    When AVG(total_sales) < 251 THEN 'Below Average'
		Else 'Warning'
	End as segments
	
From sales_analysis


Group By customer_name;

