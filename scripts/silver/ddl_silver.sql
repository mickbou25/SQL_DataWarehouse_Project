/*
===============================================================================
DDL Script: Create silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

-- Drop and recreate customer information table in CRM schema
IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_cust_info;
GO

CREATE TABLE silver.crm_cust_info (
    cst_id              INT,             -- Unique customer ID
    cst_key             NVARCHAR(50),    -- External or business key
    cst_firstname       NVARCHAR(50),    -- First name
    cst_lastname        NVARCHAR(50),    -- Last name
    cst_marital_status  NVARCHAR(50),    -- Marital status (e.g., Single, Married)
    cst_gndr            NVARCHAR(50),    -- Gender
    cst_create_date     DATE             -- Date customer record was created
);
GO

-- Drop and recreate product information table in CRM schema
IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_info;
GO

CREATE TABLE silver.crm_prd_info (
    prd_id       INT,             -- Unique product ID
    prd_key      NVARCHAR(50),    -- External or business key
    prd_nm       NVARCHAR(50),    -- Product name
    prd_cost     INT,             -- Product cost (in cents or dollars)
    prd_line     NVARCHAR(50),    -- Product line/category
    prd_start_dt DATETIME,        -- Product availability start date
    prd_end_dt   DATETIME         -- Product availability end date
);
GO

-- Drop and recreate sales details table in CRM schema
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;
GO

CREATE TABLE silver.crm_sales_details (
    sls_ord_num  NVARCHAR(50),    -- Sales order number
    sls_prd_key  NVARCHAR(50),    -- Product key (foreign key to crm_prd_info)
    sls_cust_id  INT,             -- Customer ID (foreign key to crm_cust_info)
    sls_order_dt INT,             -- Order date (consider changing to DATE or DATETIME)
    sls_ship_dt  INT,             -- Shipping date (consider changing to DATE or DATETIME)
    sls_due_dt   INT,             -- Due date (consider changing to DATE or DATETIME)
    sls_sales    INT,             -- Sales amount
    sls_quantity INT,             -- Quantity sold
    sls_price    INT              -- Unit price
);
GO

-- Drop and recreate location table in ERP schema
IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc_a101;
GO

CREATE TABLE silver.erp_loc_a101 (
    cid    NVARCHAR(50),    -- Customer or location ID
    cntry  NVARCHAR(50)     -- Country code or name
);
GO

-- Drop and recreate customer demographic table in ERP schema
IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust_az12;
GO

CREATE TABLE silver.erp_cust_az12 (
    cid    NVARCHAR(50),    -- Customer ID
    bdate  DATE,            -- Birthdate
    gen    NVARCHAR(50)     -- Gender
);
GO

-- Drop and recreate product category table in ERP schema
IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat_g1v2;
GO

CREATE TABLE silver.erp_px_cat_g1v2 (
    id           NVARCHAR(50),    -- Product or category ID
    cat          NVARCHAR(50),    -- Category name
    subcat       NVARCHAR(50),    -- Subcategory name
    maintenance  NVARCHAR(50)     -- Maintenance status or notes
);
GO
