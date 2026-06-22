
--KPI’s REQUIREMENT
--We need to analyze key indicators for our pizza sales data to gain insights into our business performance. 
--Specifically, we want to calculate the following metrics:

--1.	Total Revenue: The sum of the total price of all pizza orders.
	
		SELECT SUM(total_price) AS Total_Revenue 
		FROM pizza_sales;

--2.	Average Order Value: The average amount spent per order, 
--		calculated by dividing the total revenue by the total number of orders.

		SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
		FROM pizza_sales

--3.	Total Pizzas Sold: The sum of the quantities of all pizzas sold.

		SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

--4.	Total Orders: The total number of orders placed.
		
		SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales


	--B. Daily Trend for Total Orders
	SELECT DATENAME(weekday, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
	FROM pizza_sales
	GROUP BY DATENAME(weekday, order_date)

	--C. Monthly Trend for Orders
	select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
	from pizza_sales
	GROUP BY DATENAME(MONTH, order_date)

	--D. % of Sales by Pizza Category
	SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
ROUND(SUM(total_price) * 100.0 /(SELECT SUM(total_price) FROM pizza_sales), 2) AS PCT
			FROM pizza_sales
	GROUP BY pizza_category

	--E. % of Sales by Pizza Size
	SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
 ROUND(SUM(total_price) * 100.0 /(SELECT SUM(total_price) FROM pizza_sales),2)	FROM pizza_sales
	GROUP BY pizza_size
	ORDER BY pizza_size

--	F. Total Pizzas Sold by Pizza Category
	SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
	FROM pizza_sales
	WHERE MONTH(order_date) = 2
	GROUP BY pizza_category
	ORDER BY Total_Quantity_Sold DESC

	--G. Top 5 Pizzas by Revenue
	SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Revenue DESC

	--H. Bottom 5 Pizzas by Revenue
	SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Revenue ASC

	--J. Bottom 5 Pizzas by Quantity
	SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Pizza_Sold ASC



	--K. Top 5 Pizzas by Total Orders
	SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Orders DESC

	--L. Bottom 5 Pizzas by Total Orders
	SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Orders ASC





/*Business Recommendations:**

1. Prioritize high-revenue pizzas by increasing their visibility through targeted promotions, bundles, and strategic placement on the menu.

2. Identify and optimize underperforming pizzas by revising pricing, improving quality, or discontinuing low-demand items to streamline operations.

3. Leverage daily and monthly sales trends to optimize staffing, inventory management, and run targeted campaigns during low-demand periods.

4. Increase average order value by introducing combo deals, upselling add-ons (extra toppings, beverages), and offering discounts on minimum order thresholds.

5. Focus on high-performing pizza sizes and categories to align inventory and marketing strategies with customer preferences.

6. Implement customer retention strategies such as loyalty programs, personalized offers, and discounts to increase repeat purchases and long-term revenue.
*/
