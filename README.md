PlatinumRx Data Analyst Assignment
Author

Medapati Manmohan Reddy

Objective

This assignment demonstrates my ability to solve real-world data problems using SQL, Excel, and Python.

Tech Stack
SQL (MySQL)
Excel
Python
SQL

Hotel Management System
Last booked room per user
Used ROW_NUMBER() to sort bookings by date and select the latest booking for each user.
Total billing (Nov 2021)
Joined booking and item tables and calculated total amount using:
item_rate × quantity.
Bills greater than 1000
Used GROUP BY and filtered results using HAVING.
Most & least ordered items
Grouped data by month and used RANK() to find highest and lowest ordered items.
Second highest bill per month
Used DENSE_RANK() to identify the second highest billing value.

Clinic Management System
Revenue by sales channel
Used GROUP BY to calculate total revenue per channel.
Top 10 customers
Summed total spending per customer and sorted in descending order.
Monthly profit analysis
Calculated:
Profit = Revenue - Expense
and classified as profitable or not.
Most profitable clinic per city
Used RANK() to find top clinic in each city.
Second least profitable clinic per state
Used DENSE_RANK() to find second lowest profit.

Spreadsheet
Populate ticket_created_at
Used VLOOKUP with cms_id as key to fetch created_at from ticket sheet.
Same day closure
Compared dates using INT() function.
Same hour closure
Compared both date and hour using HOUR().
Summary analysis
Used COUNTIFS to calculate outlet-wise counts.

Python
Time conversion
Converted minutes into hours and minutes using:
Division (//)
Modulus (%)
Remove duplicates
Used loop to build a string and added characters only if not already present.
