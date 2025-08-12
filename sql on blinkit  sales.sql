use blinkit;
ALTER TABLE blin
CHANGE `Outlet Establishment Year` `Outlet_Establishment_Year` int;

ALTER TABLE blin
CHANGE `Item Type` `Item_Type` varchar(100);

ALTER TABLE blin
CHANGE `Outlet Location Type` `Outlet_Location_Type` varchar(100);

update blin
set Item_Fat_Content =
case 
when Item_Fat_Content in ('LF', 'low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end;

select * from blin;

select distinct(Item_Fat_Content) from blin;

select cast(sum(Sales) / 1000000 AS  Decimal(10,2) ) as total_sales
from blin;

select cast(avg(sales) as decimal(10,0)) as avg_sales
from blin;

select count(*) from blin;

select cast(sum(Sales) / 1000000 AS  Decimal(10,2) ) as total_sales
from blin
where  Outlet_Establishment_Year= 2022;

select cast(avg(sales) as decimal(10,0)) as avg_sales
from blin
where  Outlet_Establishment_Year= 2022;

select count(*) from blin
where  Outlet_Establishment_Year= 2022;

select cast(avg(Rating) as decimal(10,2)) as avg_rating
from blin
where  Outlet_Establishment_Year= 2022;

select Item_Fat_Content,
 cast(sum(Sales)/1000 as decimal(10,2))  as total_sales,
 cast(avg(sales) as decimal(10,0)) as avg_sales,
 cast(avg(Rating) as decimal(10,2)) as avg_rating,
 count(*) as no_of_items
from blin
group by Item_Fat_Content;

select Item_Type,
 cast(sum(Sales)as decimal(10,2))  as total_sales,
 cast(avg(sales) as decimal(10,0)) as avg_sales,
 cast(avg(Rating) as decimal(10,2)) as avg_rating,
 count(*) as no_of_items
from blin
group by Item_Type
order by total_sales desc
limit 5;

select Outlet_Location_Type, Item_Fat_Content,
 cast(sum(Sales)as decimal(10,2))  as total_sales,
 cast(avg(sales) as decimal(10,0)) as avg_sales,
 cast(avg(Rating) as decimal(10,2)) as avg_rating,
 count(*) as no_of_items
from blin
group by Outlet_Location_Type, Item_Fat_Content
order by total_sales asc;

select Outlet_Establishment_Year,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    cast(avg(sales) as decimal(10,2)) as avg_sales,
    count(*) as no_of_items,
    cast(avg(rating) as decimal(10,2)) as avg_rating
    from blin
    group by Outlet_Establishment_Year
    order by total_sales asc;
    
alter table blin
change `Outlet Size` `Outlet_Size` varchar(50);

select outlet_size,
     CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
     cast(sum(sales) * 100 / sum(sum(sales)) over() as decimal(10,2)) as sales_percentage
     from blin
     group by outlet_size
     order by total_sales asc;
     
alter table blin
change `Outlet Location Type` `Outlet_Location_Type` varchar(50);
     
select Outlet_Location_Type,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    cast(avg(sales) as decimal(10,2)) as avg_sales,
    count(*) as no_of_items,
    cast(avg(rating) as decimal(10,2)) as avg_rating
    from blin
    group by Outlet_Location_Type
    order by total_sales asc;
    
alter table blin
change `Outlet Type` `Outlet_Type` varchar(50);


    select Outlet_Type,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    cast(avg(sales) as decimal(10,2)) as avg_sales,
    cast(sum(sales) * 100 / sum(sum(sales)) over() as decimal(10,2)) as sales_percentage,
    count(*) as no_of_items,
    cast(avg(rating) as decimal(10,2)) as avg_rating
    from blin
    group by outlet_Type
    order by total_sales asc;