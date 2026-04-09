PlatinumRx Data Analyst Assignment
👨‍💻 Author

Medapati Manmohan Reddy

📌 Objective

The objective of this assignment is to demonstrate practical data analysis skills using SQL, Spreadsheet tools, and Python by solving real-world business problems.

🧩 Tech Stack Used
SQL (MySQL)
Microsoft Excel / Google Sheets
Python 3
🗄️ SQL IMPLEMENTATION
🔹 Part A: Hotel Management System
✔️ Approach
Created relational tables: users, bookings, items, booking_commercials
Established relationships using foreign keys
Used JOIN operations to combine data across tables
✔️ Solutions
1. Last booked room per user
Used ROW_NUMBER() window function
Partitioned by user_id and ordered by booking_date DESC
Selected latest booking (rn = 1)
2. Total billing amount (Nov 2021)
Joined booking_commercials with items

Calculated total using:

item_rate × item_quantity
Filtered using date condition (2021-11)
Grouped by booking_id
3. Bills greater than 1000 (Oct 2021)
Aggregated total bill amount
Used HAVING clause to filter values > 1000
4. Most & least ordered item per month
Grouped data by item_id and month
Used RANK() window function:
DESC → most ordered
ASC → least ordered
5. Second highest bill per month
Calculated total bill per month
Used DENSE_RANK() to identify rank = 2
🔹 Part B: Clinic Management System
✔️ Approach
Created tables: clinics, customer, clinic_sales, expenses
Combined revenue and expense data to derive business insights
✔️ Solutions
1. Revenue by sales channel
Used GROUP BY sales_channel
Calculated total revenue using SUM(amount)
2. Top 10 customers
Grouped by uid
Ordered results by total spending in descending order
Limited output to top 10
3. Monthly revenue, expense, profit
Created separate CTEs:
Revenue from clinic_sales
Expense from expenses
Joined both datasets

Calculated:

Profit = Revenue - Expense
Classified as:
Profitable
Not Profitable
4. Most profitable clinic per city
Calculated profit per clinic
Used RANK() partitioned by city
5. Second least profitable clinic per state
Used DENSE_RANK() ordered ascending
Selected rank = 2
📊 SPREADSHEET IMPLEMENTATION
✔️ Data Preparation
Created two sheets:
ticket
feedbacks
✔️ 1. Populate ticket_created_at
Approach:
Used cms_id as the common key
Applied VLOOKUP:
=VLOOKUP(A2, ticket!E:B, 2, FALSE)
✔️ 2. Ticket Analysis
Same Day Logic:
=IF(INT(created_at)=INT(closed_at),"Yes","No")
Same Hour Logic:
=IF(AND(INT(created_at)=INT(closed_at),
HOUR(created_at)=HOUR(closed_at)),"Yes","No")
✔️ Summary Creation
Used COUNTIFS to calculate:
Same day closures
Same hour closures
Generated outlet-wise analysis
🐍 PYTHON IMPLEMENTATION
✔️ 1. Time Conversion
Approach:

Used integer division:

hours = minutes // 60
minutes = minutes % 60
Constructed readable output string

✔️ 2. Remove Duplicates
Approach:
Iterated through string using loop
Maintained result string
Added character only if not already present

🚀 KEY HIGHLIGHTS
Used window functions for advanced SQL analysis
Applied real-world business logic (profit, ranking)
Built structured Excel analysis with formulas
Implemented clean Python logic using loops
Organized project in a modular and readable format
