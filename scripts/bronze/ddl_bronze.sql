/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables
    if they already exist.
Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/


--================================
-- DDL for crm sources (cust_info)
--================================

DROP TABLE IF EXISTS bronze.crm_cust_info;
create table bronze.crm_cust_info(
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_material_status VARCHAR(50),
    cst_gndr VARCHAR,
    cst_create_date date
);


--================================
-- DDL for crm sources (prd_info)
--================================
DROP TABLE IF EXISTS bronze.crm_prd_info;
create table bronze.crm_prd_info(
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(2),
    prd_start_dt DATE,
    prd_end_dt DATE

);

--================================
-- DDL for crm sources (sales_details)
--================================

DROP TABLE IF EXISTS bronze.crm_sales_details;
create table bronze.crm_sales_details(

    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);



--================================
-- DDL for erp sources (CUST_AZ12)
--================================

DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12(
    CID  VARCHAR(50),
    BDATE DATE,
    GEN VARCHAR(10)
);

--================================
-- DDL for erp sources (LOC_A101)
--================================
DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101(
    CID VARCHAR(50),
    CNTRY VARCHAR(50)
);

--================================
-- DDL for erp sources (PX_CAT_G1V2)
--================================
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2(
    ID VARCHAR(20),
    CAT VARCHAR(50),
    SUBCAT VARCHAR(50),
    MAINTENANCE VARCHAR(5)
);
