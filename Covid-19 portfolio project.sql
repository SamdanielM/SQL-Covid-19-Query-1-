--View ['covid 19 death$']
select *
from ['covid 19 death$']

--view ['covid 19 recovery$']
select *
from ['covid 19 recovery$']


 --select data is being used
select [Country/Region],Population,TotalCases,TotalDeaths
from ['covid 19 death$']
order by [Country/Region]

--Total Cases vs Total death 
select [Country/Region],Population,TotalCases,TotalDeaths,(TotalCases/TotalDeaths)*100 as Death_Percentage
from ['covid 19 death$']
where TotalCases is not null
order by 1,2

--Population vs Total death 
select [Country/Region],Population,TotalCases,TotalDeaths,(Population-TotalDeaths)as People_Alive
from ['covid 19 death$']
order by TotalCases desc

--Percentage of Population Got in Covid
select [Country/Region],Population,TotalCases,(TotalCases/Population)*100 as People_Got_Covid
from ['covid 19 death$']
where TotalCases is not null
order by 1,2

--Countires with Highest Infection Rate compared to Population
select [Country/Region],Population,max(TotalCases) as Highest_Infection_Count,max((TotalCases/Population))*100 as Precentage_Population_Infected
from ['covid 19 death$']
where TotalCases is not null
group by [Country/Region],Population
order by 1,2

--Countires with Highest Death per Population
select Continent,max(TotalDeaths) as TotalDeathsCount
from ['covid 19 death$']
where Continent is not null
Group by Continent
order by TotalDeathsCount desc

--GLOBAL NUMBERS
select Continent, sum (NewCases) as newcases
from ['covid 19 death$']
where NewCases is not null
Group by Continent
order by 1,2

--TOTAL POPULATION vs  RECOVERY
select ['covid 19 death$'].[Country/Region],['covid 19 death$'].Population,['covid 19 death$'].[Serious,Critical], ['covid 19 recovery$'].NewRecovered
from ['covid 19 death$']
join ['covid 19 recovery$']
on ['covid 19 death$'].[Country/Region]= ['covid 19 recovery$'].[Country/Region]
and ['covid 19 death$'].Population= ['covid 19 recovery$'].Population
where NewRecovered  is not null
order by NewRecovered desc