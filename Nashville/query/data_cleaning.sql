-- SHOULD NOT ALTER ORIGINAL DATABASE IN REAL LIFE SCENARIO
-- USE TEMP TABLE OR VIEWS

SELECT *
FROM Portfolio..housing_data;

-- 1. Standardize SaleDate's Date Format
SELECT SaleDate, CONVERT(DATE, SaleDate)
FROM Portfolio..housing_data;

--ALTER TABLE Portfolio..housing_data
--DROP COLUMN StandardSaleDate;

ALTER TABLE Portfolio..housing_data
ADD StandardSaleDate DATE;

UPDATE Portfolio..housing_data
SET StandardSaleDate = CONVERT(DATE, SaleDate);

SELECT * 
FROM Portfolio..housing_data;


-- 2. Populate (fill n/a) PropertyAddress
SELECT * 
FROM Portfolio..housing_data
WHERE PropertyAddress IS NULL;

SELECT A.ParcelID, A.PropertyAddress, B.ParcelID, B.PropertyAddress, ISNULL(A.PropertyAddress, B.PropertyAddress) AS NewAddress
FROM Portfolio..housing_data AS A
JOIN Portfolio..housing_data AS B
ON A.ParcelID = B.ParcelID
AND A.UniqueID <> B.UniqueID
WHERE A.PropertyAddress IS NULL;

UPDATE A
SET PropertyAddress = ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM Portfolio..housing_data AS A
JOIN Portfolio..housing_data AS B
ON A.ParcelID = B.ParcelID
AND A.UniqueID <> B.UniqueID
WHERE A.PropertyAddress IS NULL;

-- 3. Splitting Addresses Into Multiple Fields
SELECT PropertyAddress
FROM Portfolio..housing_data;

SELECT SUBSTRING(PropertyAddress, 1 , CHARINDEX(',', PropertyAddress) - 1) AS PropertyStreetAddress,
		RIGHT(PropertyAddress, LEN(PropertyAddress) - CHARINDEX(',', PropertyAddress) - 1) AS PropertyCity
FROM Portfolio..housing_data;

SELECT PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3) AS OwnerStreeAddress,
		PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2) AS OwnerCity,
		PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1) AS OwnerState
FROM Portfolio..housing_data;

ALTER TABLE Portfolio..housing_data
ADD PropertyStreetAddress NVARCHAR(255),
	PropertyCity NVARCHAR(255),
	OwnerStreetAddress NVARCHAR(255),
	OwnerCity NVARCHAR(255),
	OwnerState NVARCHAR(255);

UPDATE Portfolio..housing_data
SET PropertyStreetAddress = SUBSTRING(PropertyAddress, 1 , CHARINDEX(',', PropertyAddress) - 1),
	PropertyCity = RIGHT(PropertyAddress, LEN(PropertyAddress) - CHARINDEX(',', PropertyAddress) - 1),
	OwnerStreetAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
	OwnerCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
	OwnerState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1);

SELECT * 
FROM Portfolio..housing_data;

-- 4. Changing Value In "Sold as Vacant" Field
SELECT SoldAsVacant, COUNT(SoldAsVacant)
FROM Portfolio..housing_data
GROUP BY SoldAsVacant;

SELECT CASE WHEN SoldAsVacant = 'N' THEN 'No'
		WHEN SoldAsVacant = 'Y' THEN 'Yes'
		ELSE SoldAsVacant
		END AS temp, SoldAsVacant
FROM Portfolio..housing_data

UPDATE Portfolio..housing_data
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'N' THEN 'No'
		WHEN SoldAsVacant = 'Y' THEN 'Yes'
		ELSE SoldAsVacant
		END;

SELECT SoldAsVacant, COUNT(SoldAsVacant)
FROM Portfolio..housing_data
GROUP BY SoldAsVacant;


-- 5. Remove Duplicate

WITH CTE AS (
SELECT *, ROW_NUMBER() OVER(
		PARTITION BY ParcelID, 
					 PropertyAddress, 
					 SalePrice,
					 SaleDate,
					 LegalReference
					 ORDER BY UniqueID) AS RowNum
FROM Portfolio..housing_data)

DELETE 
FROM CTE
WHERE RowNum > 1;

WITH CTE AS (
SELECT *, ROW_NUMBER() OVER(
		PARTITION BY ParcelID, 
					 PropertyAddress, 
					 SalePrice,
					 SaleDate,
					 LegalReference
					 ORDER BY UniqueID) AS RowNum
FROM Portfolio..housing_data)

SELECT *
FROM CTE
WHERE RowNum > 1;

-- 6. Drop Columns

SELECT * 
FROM Portfolio..housing_data;

ALTER TABLE Portfolio..housing_data
DROP COLUMN PropertyAddress, SaleDate, OwnerAddress,TaxDistrict;
