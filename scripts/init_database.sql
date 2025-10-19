/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

-- Switch to the 'master' database to manage databases
USE master;
GO

-- 🔄 Drop and recreate the 'DataWarehouse' database
-- This ensures a clean slate by removing the existing database if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force disconnect all users and rollback active transactions
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    -- Drop the existing database
    DROP DATABASE DataWarehouse;
END;
GO

-- 🆕 Create a fresh 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created database
USE DataWarehouse;
GO

-- 🗂 Create schema layers for data processing stages
-- Bronze: Raw or ingested data
CREATE SCHEMA bronze;
GO

-- Silver: Cleaned, transformed, and enriched data
CREATE SCHEMA silver;
GO

-- Gold: Final, curated data ready for analytics and reporting
CREATE SCHEMA gold;
GO
