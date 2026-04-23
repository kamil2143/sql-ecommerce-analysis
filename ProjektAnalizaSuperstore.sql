/* PROJEKT: Kompleksowa Analiza Sprzedaży i Rentowności E-commerce
ZBIÓR DANYCH: Superstore Dataset
CEL: Identyfikacja wąskich gardeł zyskowności oraz analiza zachowań klientów.
AUTOR: Kamil
*/

SELECT *
FROM superstore;

-- Wypisanie kategorii wraz z liczbą sprzedaży oraz zyskiem --
SELECT Category,
ROUND(SUM(Sales),2) AS Calkowite_wydatki,
ROUND(SUM(Profit),2) AS Calkowity_profit
From superstore
GROUP BY Category
ORDER BY Calkowite_wydatki desc;

-- Wypisanie miast, które są na minusie --
SELECT City,
ROUND(SUM(Profit),2) AS Zysk
FROM superstore
GROUP BY City
HAVING Zysk < 0
ORDER BY Zysk asc;

-- Nadawanie kategorii zamowieniom i zliczenie ich --
WITH Kategorie_zamowien AS (
SELECT `Order ID`, Sales, Profit,
CASE
	WHEN Sales > 500 THEN 'Duże zamówienie'
	WHEN Sales > 100 THEN 'Średnie zamówienie'
	ELSE 'Małe zamówienie'
END AS Wielkosc_zamowienia
FROM superstore
)
SELECT Wielkosc_zamowienia,
COUNT(DISTINCT `Order ID`) AS Liczba_zamowien,
ROUND(SUM(Profit), 2) AS Calkowity_zysk
FROM Kategorie_zamowien
GROUP BY Wielkosc_zamowienia
ORDER BY Calkowity_zysk DESC;


-- Analiza zależności: Czy wysokie rabaty mogą niszczyć zysk? --
-- To zapytanie pomaga ocenić, czy promocje są efektywne biznesowo --
SELECT
Category,
ROUND(AVG(Discount)*100, 2) AS Sredni_rabat_procent,
ROUND(Sum(Profit), 2) AS Suma_zyskow
FROM superstore
GROUP BY Category
ORDER BY Sredni_rabat_procent DESC;

-- Analiza wyboru rodzaju dostawy --
SELECT `Ship Mode`,
COUNT(*) AS liczba_dostaw
FROM superstore
GROUP BY `Ship Mode`
ORDER BY liczba_dostaw DESC;

-- Wybranie 5 klientow, którzy złożyli najwięcej zamówień --
SELECT `Customer Name`,
COUNT(DISTINCT(`Order ID`)) AS Liczba_zamowien
FROM superstore
GROUP BY `Customer Name`
ORDER BY Liczba_zamowien DESC
LIMIT 5;

-- Analiza według stanów: liczba zamówień, średnia wartość zamówienia i zyskowność --
SELECT State,
COUNT(DISTINCT `Order ID`) AS Liczba_zamowien,
ROUND(SUM(Sales),2) AS Suma_sprzedazy,
ROUND(SUM(Profit),2) AS Zysk_calkowity,
ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS Srednia_wartosc_zamowienia
FROM superstore
GROUP BY State
ORDER BY Zysk_calkowity DESC
LIMIT 10;

-- Analiza kwartalna - Liczba zamówień, wartość sprzedaży oraz zyski --
SELECT 
YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Rok,
QUARTER(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Kwartal,
COUNT(DISTINCT `Order ID`) AS Liczba_zamowien,
ROUND(SUM(Sales),1) AS Suma_sprzedazy,
ROUND(SUM(Profit),1) AS Zysk
FROM superstore
GROUP BY Rok, Kwartal
ORDER BY Rok DESC, Kwartal DESC;