select* from vw_employeesalary_tbl
-- Total number of staff--
select count ( staffid) as [Total Employee] from vw_employeesalary_tbl

---calculate department having 3 or more employee--
select department,count( staffid) as [Total Employee]from vw_employeesalary_tbl
group by Department 
having count(distinct staffid)>=3 
order by [Total Employee] desc

----How many employee use each payment method(cash or transfer)--
select payment_method,count ( staffid) as [Total Employee] from vw_employeesalary_tbl
group by Payment_Method

--- What is the Average salary by each department--
select department, avg(salary) as [Average Salary] from vw_employeesalary_tbl
group by Department 

---Top 3 Highest paid employee
select top 3 staffid, firstname,salary as salary from vw_employeesalary_tbl
group by salary,firstName,staffid
order by salary desc 

---Second highest paid employee--
select top 1 staffid,firstname,salary as [second highest salary] from vw_employeesalary_tbl
where salary < (select max (salary) from salary )
order by salary desc

---DSA TRANSACTION ANALYSIS

Select 'DSA_Mall_Ikeja' as Branch,firstname as [First Name],lastname as [Last Name],customer_gender as [Gender],
Transactiondate as [Date],[Address],transaction_amount as [Transaction Amount] from DSA_Mall_Ikeja
union 
Select 'DSA_Mall_Lekki' as Branch,firstname as [First Name],lastname as [Last Name],customer_gender as [Gender],
Transactiondate as [Date],[Address],transaction_amount as [Transaction Amount] from DSA_Mall_Lekki
union 
Select 'DSA_Mall_Marina' as Branch,firstname as [First Name],lastname as [Last Name],customer_gender as [Gender],
Transactiondate as [Date],[Address],transaction_amount as [Transaction Amount] from DSA_Mall_Marina

---Create view ---

create view vw_DSA_Mall_Transaction
as
Select 'DSA_Mall_Ikeja' as Branch,firstname as [First Name],lastname as [Last Name],customer_gender as [Gender],
Transactiondate as [Date],[Address],transaction_amount as [Transaction Amount] from DSA_Mall_Ikeja
union 
Select 'DSA_Mall_Lekki' as Branch,firstname as [First Name],lastname as [Last Name],customer_gender as [Gender],
Transactiondate as [Date],[Address],transaction_amount as [Transaction Amount] from DSA_Mall_Lekki
union 
Select 'DSA_Mall_Marina' as Branch,firstname as [First Name],lastname as [Last Name],customer_gender as [Gender],
Transactiondate as [Date],[Address],transaction_amount as [Transaction Amount] from DSA_Mall_Marina

--- calculate total sales by branch--
select Branch, sum ([Transaction amount])as [total sales] from vw_DSA_Mall_Transaction
group by branch
order by [total sales] asc

--Total sales by gender and Branch--
select Gender, branch,sum([Transaction Amount]) as [Total Sales] from vw_DSA_Mall_Transaction
group by Gender,branch

-- total Sales
select sum([transaction Amount])as [Total sales] from vw_DSA_Mall_Transaction

--average Sales--
select avg([transaction Amount])as [Average sales] from vw_DSA_Mall_Transaction

--- top 5 customer
select top 5 [first Name],[last name],[transaction amount] from vw_DSA_Mall_Transaction
order by [Transaction Amount] desc