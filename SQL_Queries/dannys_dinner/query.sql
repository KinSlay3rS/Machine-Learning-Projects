use dannys_dinner;

-- What is the total amount each customer spent at the restaurant?
select sales.customer_id , sum(menu.price) 
from sales left join menu 
on sales.product_id = menu.product_id
group by customer_id;

select sales.customer_id,sales.product_id,menu.price
from sales left join menu
on sales.product_id = menu.product_id;

-- How many days has each customer visited the restaurant?
select * from sales;

select customer_id , count(distinct order_date)
from sales
group by customer_id;

-- What was the first item from the menu purchased by each customer?
select customer_id, order_date from sales;

with sales as (
select  *,
row_number() over(partition by customer_id order by order_date) as ro
from sales
)
select sales.customer_id, sales.product_id , sales.order_date , menu.product_name
from sales
left join menu on sales.product_id = menu.product_id
where sales.ro=1;

-- What is the most purchased item on the menu

with sales as (
select *,
count(product_id) over(partition by product_id) as count_
from sales
)
select distinct product_id, count_ 
from sales
where count_ = (select max(count_) from sales);

-- how many times was it purchased by all customers?
select distinct customer_id,product_id,
count(customer_id) over(partition by customer_id) as count_
from sales
where product_id = 3;

-- Which item was purchased first by the customer after they became a member?


with sales as(
select sales.* , members.join_date
from members left join sales on sales.customer_id = members.customer_id
where members.join_date < sales.order_date
)
select distinct sales.customer_id, menu.product_name, sales.join_date,
min(sales.order_date) over(partition by sales.customer_id) as first_product_after_membership
from sales left join menu on sales.product_id = menu.product_id;

-- Which item was purchased just before the customer became a member?

with sales as(
select sales.* , members.join_date
from members left join sales on sales.customer_id = members.customer_id
where members.join_date > sales.order_date
)
select distinct sales.customer_id, menu.product_name, sales.join_date,
max(sales.order_date) over(partition by sales.customer_id) as last_product_before_membership
from sales left join menu on sales.product_id = menu.product_id;

-- What is the total items and amount spent for each member before they became a member?
with sales as(
select sales.* , menu.product_name , menu.price,
count(sales.product_id) over(partition by sales.customer_id) as total_items
from sales left join menu on sales.product_id = menu.product_id 
)
select 
	distinct sales.customer_id, 
	members.join_date , 
	sales.order_date,
	sales.total_items, 
	sum(sales.price) over(partition by customer_id) as total_amt
from sales left join members on sales.customer_id = members.customer_id
where members.join_date > sales.order_date;

-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select * from menu;


with sales as (
select 
	sales.*,
    menu.product_name,
    menu.price,
    case menu.product_name
		when 'sushi' then menu.price*20
        else menu.price*10
	end as points
from sales left join menu on sales.product_id = menu.product_id
)
select 
	distinct customer_id,
    sum(points) over(partition by customer_id) as total_points
from sales;

-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
WITH sales_cte AS (
  SELECT 
    s.customer_id,
    s.order_date,
    m.product_name,
    m.price,
    mem.join_date,
    CASE 
      WHEN mem.join_date < s.order_date and date(mem.join_date + 6) > s.order_date THEN m.price * 20
      ELSE 
        CASE m.product_name
          WHEN 'sushi' THEN m.price * 20
          ELSE m.price * 10
        END
    END AS points
  FROM sales s
  LEFT JOIN menu m ON s.product_id = m.product_id
  LEFT JOIN members mem ON s.customer_id = mem.customer_id
  WHERE s.customer_id IN ('A', 'B')
),
final AS (
  SELECT 
    *,
    LAST_DAY('2021-01-31') AS last_date
  FROM sales_cte
)
SELECT 
  DISTINCT customer_id,
  last_date,
  SUM(points) OVER (PARTITION BY customer_id) AS total_points
FROM final
WHERE order_date <= last_date;
