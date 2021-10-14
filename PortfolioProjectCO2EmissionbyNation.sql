


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
