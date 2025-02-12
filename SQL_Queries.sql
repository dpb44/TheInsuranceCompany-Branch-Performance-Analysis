-- creating a database for insurance analytics
create database insurance_analytics;
-- using the database
use insurance_analytics;
-- using the import table wizard all the relavant tables were included into the database

-- ------------------------------------------------------------------------------------------------------------------
-- Pre-processing of data columns

-- Renaming and selecting data types appropriately to create keys
select * from brokerage_data;
alter table brokerage_data modify employee_id varchar(10);
alter table brokerage_data modify policy_start_date date;
alter table brokerage_data modify policy_end_date date;
set sql_safe_updates = 0;
update brokerage_data set income_due_date=null where income_due_date = "";
alter table brokerage_data modify income_due_date date;
alter table brokerage_data modify last_updated_date date;
alter table brokerage_data modify class_id varchar(10);
alter table brokerage_data modify brokerage_id varchar(10);

desc budget_data;
alter table budget_data modify employee_id varchar(10);

desc employee_data;
alter table employee_data modify employee_id varchar(10);

desc fees_data;
alter table fees_data modify employee_id varchar(10);
alter table fees_data modify class_id varchar(10);
alter table fees_data modify fee_id varchar(10);
alter table fees_data modify income_due_date date;

desc income_class_data;
alter table income_class_data modify class_id varchar(10);

desc invoice_data;
alter table invoice_data modify employee_id varchar(10);
alter table invoice_data modify class_id varchar(10);
alter table invoice_data modify invoice_id varchar(10);
alter table invoice_data modify income_due_date date;
alter table invoice_data modify invoice_date date;

desc meeting_data;
alter table meeting_data modify employee_id varchar(10);
alter table meeting_data modify meeting_date date;
alter table meeting_data modify meeting_id varchar(10);

desc opportunity_data;
alter table opportunity_data modify employee_id varchar(10);
alter table opportunity_data modify closing_date date;
alter table opportunity_data modify opportunity_id varchar(20);


-- making the primary keys
alter table employee_data add primary key (employee_id);
alter table income_class_data add primary key (class_id);
alter table brokerage_data add primary key (brokerage_id);
alter table fees_data add primary key (fee_id);
alter table invoice_data add primary key (invoice_id);
alter table meeting_data add primary key (meeting_id);
alter table opportunity_data add primary key (opportunity_id);


-- foreign keys
alter table budget_data add foreign key (employee_id) references employee_data(employee_id);
alter table brokerage_data add foreign key (employee_id) references employee_data(employee_id);
alter table fees_data add foreign key (employee_id) references employee_data(employee_id);
alter table invoice_data add foreign key (employee_id) references employee_data(employee_id);
alter table meeting_data add foreign key (employee_id) references employee_data(employee_id);
alter table opportunity_data add foreign key (employee_id) references employee_data(employee_id);

desc brokerage_data;
select * from income_class_data;
insert into income_class_data values ("C-4", Null);
set sql_safe_updates = 0;
update brokerage_data set class_id = "C-4" where class_id= "";
update invoice_data set class_id = "C-4" where class_id= "";
set sql_safe_updates = 1;
alter table brokerage_data add foreign key (class_id) references income_class_data(class_id);
alter table fees_data add foreign key (class_id) references income_class_data(class_id);
alter table invoice_data add foreign key (class_id) references income_class_data(class_id);

-- -----------------------------------------------------------------------------------------------
-- KPIs

-- KPI 1
-- No of Invoice by Accnt Exec
select
	e.emp_name as account_executive,
    count(i.invoice_id) as total_invoices
from
	employee_data as e join
    invoice_data as i on
    e.employee_id = i.employee_id
group by
	e.emp_name
order by 
	total_invoices desc;

-- KPI 2
-- Yearly meeting count
select
	year(meeting_date) as year,
    count(meeting_id) as meeting_count
from
    meeting_data
group by
	year(meeting_date);


-- KPI 3


-- Creating View with all the data
drop view kpi_totals;
create view kpi_totals as
select
	-- Targets
	(select sum(cross_sell_budget) from budget_data) as cross_sell_target,
    (select sum(new_budget) from budget_data) as new_target,
    (select sum(renewal_budget) from budget_data) as renewal_target,
    
    -- Achievements
    (select
		sum(brokerage_amount) from
        brokerage_data
        where class_id = "C-1") as br_cross_sell_achieved,
	(select
		sum(fee_amount) from
        fees_data
        where class_id = "C-1") as f_cross_sell_achieved,
	(select
		sum(brokerage_amount) from
        brokerage_data
        where class_id = "C-3") as br_new_achieved,
	(select
		sum(fee_amount) from
        fees_data
        where class_id = "C-3") as f_new_achieved,
	(select
		sum(brokerage_amount) from
        brokerage_data
        where class_id = "C-2") as br_renewal_achieved,
	(select
		sum(fee_amount) from
        fees_data
        where class_id = "C-2") as f_renewal_achieved,
        
	-- Invoiced Values
    (select
		sum(i.invoice_amount) from
        invoice_data as i where
        i.class_id = "C-1") as cross_sell_invoiced,
	(select
		sum(i.invoice_amount) from
        invoice_data as i where
        i.class_id = "C-3") as new_invoiced,
	(select
		sum(i.invoice_amount) from
        invoice_data as i where
        i.class_id = "C-2") as renewal_invoiced;

-- Crating a function show the amounts in the millions form
SET GLOBAL log_bin_trust_function_creators = 1; 
-- CREATE DEFINER=`root`@`localhost` FUNCTION `in_millions`(amount double) RETURNS varchar(10) CHARSET utf8mb4
-- BEGIN
-- RETURN concat(round(amount/ 1000000,2), "M");
-- END

-- displaying the KPIs accordingly from the view

-- KPI 3.1
-- Cross Sell: Target, Achieved and Invoice
select
	in_millions(cross_sell_target) as cross_sell_target,
    in_millions(br_cross_sell_achieved + f_cross_sell_achieved ) as cross_sell_achieved,
    in_millions(cross_sell_invoiced) as cross_sell_invoiced
    from kpi_totals;

-- KPI 3.2
-- New: Target, Achieved and Invoice
select
	in_millions(new_target) as new_target,
    in_millions(br_new_achieved + f_new_achieved ) as new_achieved,
    in_millions(new_invoiced) as new_invoiced
    from kpi_totals;
    
-- KPI 3.3
-- Renewal: Target, Achieved and Invoice
select
	in_millions(renewal_target) as renewal_target,
    in_millions(br_renewal_achieved + f_renewal_achieved ) as renewal_achieved,
    in_millions(renewal_invoiced) as renewal_invoiced
    from kpi_totals;
	
    
-- KPI 4
-- Stage funnel by revenue
desc opportunity_data;
select
	stage, sum(revenue_amount) as total_revenue
from 
	opportunity_data
group by
	stage
order by
	total_revenue desc;
    

-- KPI 5
-- Number of meetings by account executive
select
	e.emp_name as account_executive,
    count(m.meeting_id) as total_meetings
from
	employee_data as e join
    meeting_data as m on
    e.employee_id = m.employee_id
group by
	e.emp_name
order by
	total_meetings desc;

-- KPI 6
-- Top 10 Open Oppurtunities
desc opportunity_data;
select 
	rank() over (order by revenue_amount desc) as opp_rank, 
    opportunity_name,
    revenue_amount as total_revenue
from opportunity_data
where stage in ("Propose Solution", "Qualify Opportunity")
order by total_revenue desc
limit 10;

-- Bonus KPI
-- Conversion ratio
 select
	count(case when stage = "Negotiate" then 1 end) as closed_won,
    count(opportunity_id) as total_opportunities,
    concat(round(count(case when stage = "Negotiate" then 1 end) / count(opportunity_id) *100, 2),"%") as conversion_ratio
from
	opportunity_data;
