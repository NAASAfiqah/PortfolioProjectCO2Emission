


Select*
From PortfolioProjectCO2Emission..FossilFuelByNation

--ARRANGE DATA BY COUNTRY
Select*
From PortfolioProjectCO2Emission..FossilFuelByNation
Order by Country

--ARRANGE DATA BY YEAR

Select*
From PortfolioProjectCO2Emission..FossilFuelByNation
Order by Year

--Searching for 2014

Select*
From PortfolioProjectCO2Emission..FossilFuelByNation
Where Year like '%2014%'
Order by Country

--To PERCENTAGE OF SOLID FUEL PER TOTAL

Select Year, Country, Total, [solid fuel], ([solid fuel]/Total) as PercentageofFossilFuelUsed
From PortfolioProjectCO2Emission..FossilFuelByNation
Where [solid fuel]<>0 
Order by Country

Select Year, Country, Total, [solid fuel], ([solid fuel]/Total)*100 as PercentageofFossilFuelUsed
From PortfolioProjectCO2Emission..FossilFuelByNation
Where [solid fuel]<>0 
Order by Country

--LOOKING AT MAX SOLID FUEL USED 

Select Country, Total, MAX([solid fuel]) as HighestSolidFuel, MAX(([solid fuel]/Total))*100 as HighestPercentageofFossilFuelUsed
From PortfolioProjectCO2Emission..FossilFuelByNation
Where [solid fuel]<>0 
Group by Country, Total
Order by HighestPercentageofFossilFuelUsed desc

--To PERCENT LIQUID FUEL PER TOTAL

Select Year, Country, Total,[Liquid fuel], ([Liquid fuel]/Total)*100 as PercentageofLiquidFuelUsed
From PortfolioProjectCO2Emission..FossilFuelByNation
Where [Liquid fuel]<>0 
Order by Country

--LOOKING AT MAX LIQUID FUEL USED

Select Country, Total, MAX([Liquid fuel]) as HighestLiquidFuel, MAX(([Liquid fuel]/Total))*100 as HighestPercentageofLiquidFuelUsed
From PortfolioProjectCO2Emission..FossilFuelByNation
Where [Liquid fuel]<>0 
Group by Country, Total
Order by HighestPercentageofLiquidFuelUsed desc

--To PERCENT GAS FUEL PER TOTAL

Select Year, Country, Total,[gas fuel], ([gas fuel]/Total)*100 as PercentageofGasFuelUsed
From PortfolioProjectCO2Emission..FossilFuelByNation
Where [gas fuel]<>0 
Order by Country

--LOOKING AT THE HIGHEST PERCENTAGE OF GAS FUEL USED 

Select country, Total, MAX([gas fuel]) as HighestGasFuel, MAX(([gas fuel]/Total))*100 as HighestPercentageofGasFuelUsed
From PortfolioProjectCO2Emission..FossilFuelByNation
Where [gas fuel]<>0
Group by country, Total
Order by HighestPercentageofGasFuelUsed desc

--Trying to Join PercentageofFossilFuelUsed, PercentageofLiquidFuelUsed and PercentageofGasFuelUsed

Select FossilFuelByNation.Year,  FossilFuelByNation.Country, FossilFuelByNation.Total, 
FossilFuelByNation.[Solid Fuel], ([solid fuel]/.FossilFuelByNation.Total)*100 PercentageofFossilFuelUsed,
[Liquid Fuel].[Liquid Fuel],([Liquid fuel].[Liquid Fuel]/.FossilFuelByNation.Total)*100 as PercentageofLiquidFuelUsed,
FossilFuelByNation.[Gas Fuel],  ([gas fuel]/FossilFuelByNation.Total)*100 as PercentageofGasFuelUsed 
From PortfolioProjectCO2Emission..FossilFuelByNation
	Join PortfolioProjectCO2Emission..[Liquid Fuel]
	on ([solid fuel]/.FossilFuelByNation.Total)*100= ([Liquid fuel].[Liquid Fuel]/.FossilFuelByNation.Total)*100
	and FossilFuelByNation.[Solid Fuel]= [Liquid Fuel].[Liquid Fuel]
Where [solid fuel]<>0
Order by Year

--Trying to Join PercentageofFossilFuelUsed, PercentageofLiquidFuelUsed and PercentageofGasFuelUsed selecting 2014

Select FossilFuelByNation.Year,  FossilFuelByNation.Country, FossilFuelByNation.Total, 
FossilFuelByNation.[Solid Fuel], ([solid fuel]/FossilFuelByNation.Total)*100 PercentageofFossilFuelUsed,
[Liquid Fuel].[Liquid Fuel],([Liquid fuel].[Liquid Fuel]/FossilFuelByNation.Total)*100 as PercentageofLiquidFuelUsed,
FossilFuelByNation.[Gas Fuel],  ([gas fuel]/FossilFuelByNation.Total)*100 as PercentageofGasFuelUsed 
From PortfolioProjectCO2Emission..FossilFuelByNation
	Join PortfolioProjectCO2Emission..[Liquid Fuel]
	on ([solid fuel]/FossilFuelByNation.Total)*100= ([Liquid fuel].[Liquid Fuel]/FossilFuelByNation.Total)*100
	and FossilFuelByNation.[Solid Fuel]= [Liquid Fuel].[Liquid Fuel]
Where FossilFuelByNation.Year like '%2014%'

--TO SUM

Select country, Total, SUM([gas fuel]) as TotalGasFuel
From PortfolioProjectCO2Emission..FossilFuelByNation
--Where [gas fuel]<>0
Group by country, Total
Order by Country

--LOOKING AT THE HIGHEST TOTAL FUEL USED

Select country, Total, MAX([gas fuel]) as TotalGasFuel
From PortfolioProjectCO2Emission..FossilFuelByNation
Group By country, Total
Order by TotalGasFuel desc
