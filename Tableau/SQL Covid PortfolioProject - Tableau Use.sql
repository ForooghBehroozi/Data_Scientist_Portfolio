Select *
From PortfolioProject..CovidDeaths$
Where continent is not null
Order by 3,4



--1.
-- Showing Death percentage in the world
Select SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths,
    case
        when SUM(new_cases) = 0 and SUM(new_deaths) <> 0 then NULL
		when SUM(new_cases) = 0 and SUM(new_deaths) = 0 then 0
        else SUM(new_deaths) * 100.0 / SUM(new_cases)
    end as DeathPercentage
From PortfolioProject..CovidDeaths$
Where continent IS NOT NULL
Order by 1,2



-- 2.
-- Showing Death percentage in different continents

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths$
Where continent is null
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
Group by location
Order by TotalDeathCount desc



--3.
-- Showing the percentage of infected people in different countries

Select location, population, MAX(cast(total_cases as int)) as HighInfectionCount
, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths$
Group by location, population
Order by PercentPopulationInfected desc




--4.
--Showing the percentage of cummulative infected people in different countries during the time
Select location, population, date, MAX(cast(total_cases as int)) as HighInfectionCount
, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths$
Group by location, population, date
Order by PercentPopulationInfected desc




