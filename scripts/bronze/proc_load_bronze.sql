/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/



-- Create or replace the procedure
CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$

DECLARE
    batch_start_time TIMESTAMP;
    batch_end_time   TIMESTAMP;
    step_start_time  TIMESTAMP;
    step_end_time    TIMESTAMP;
    duration_secs    INT;
    row_count        INT;  -- <--- THIS MUST BE HERE

BEGIN
    
    
    -- Your SQL code here

    RAISE NOTICE '==================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '==================================================';


    RAISE NOTICE '--------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '--------------------------------------------------';

    -- ================================================
    -- Insertion in 'crm_cust_info' table -- CRM TBALE - 1
    -- ================================================

    RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
    truncate table bronze.crm_cust_info;

    RAISE NOTICE '>> Inserting Data Into: bronze.crm_cust_info';

    COPY bronze.crm_cust_info
    FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

    -- 2. Capture how many rows were just inserted
    GET DIAGNOSTICS row_count = ROW_COUNT;

    -- 3. Print it out nicely
    RAISE NOTICE '>> Loaded % rows', row_count;

    RAISE NOTICE '- - - - - - - - - Insertion completed for above code- - - - - - - - - - - - - - - -';

    -- ================================================
    -- Insertion in 'crm_prd_info' table. -- CRM TBALE - 2
    -- ================================================



    RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
    truncate table bronze.crm_prd_info;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.crm_prd_info';

    COPY bronze.crm_prd_info
    FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

        -- 2. Capture how many rows were just inserted
    GET DIAGNOSTICS row_count = ROW_COUNT;

    -- 3. Print it out nicely
    RAISE NOTICE '>> Loaded % rows', row_count;

    RAISE NOTICE '- - - - - - - - - Insertion completed for above code- - - - - - - - - - - - - - - -';
    -- ================================================
    -- Insertion in 'crm_sales_details' table -- -- CRM TBALE - 3
    -- ================================================

    RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
    truncate table bronze.crm_sales_details;

    RAISE NOTICE '>> Inserting Data Into: bronze.crm_sales_details';

    COPY bronze.crm_sales_details
    FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

        -- 2. Capture how many rows were just inserted
    GET DIAGNOSTICS row_count = ROW_COUNT;

    -- 3. Print it out nicely
    RAISE NOTICE '>> Loaded % rows', row_count;

    RAISE NOTICE '- - - - - - - - - Insertion completed for above code- - - - - - - - - - - - - - - -';
    -- ================================================
    -- Insertion in 'erp_cust_az12' table (erp)  -- ERP TBALE - 1
    -- ================================================

    RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';

    truncate table bronze.erp_cust_az12;

    RAISE NOTICE '>> Inserting Data Into: bronze.erp_cust_az12';

    COPY bronze.erp_cust_az12
    FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

        -- 2. Capture how many rows were just inserted
    GET DIAGNOSTICS row_count = ROW_COUNT;

    -- 3. Print it out nicely
    RAISE NOTICE '>> Loaded % rows', row_count;

    RAISE NOTICE '- - - - - - - - - Insertion completed for above code- - - - - - - - - - - - - - - -';
    -- ================================================
    -- Insertion in 'erp_loc_a101' table (erp) -- ERP TBALE - 2
    -- ================================================

    RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';

    truncate table bronze.erp_loc_a101;

    RAISE NOTICE '>> Inserting Data Into: bronze.erp_loc_a101';

    COPY bronze.erp_loc_a101
    FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

        -- 2. Capture how many rows were just inserted
    GET DIAGNOSTICS row_count = ROW_COUNT;

    -- 3. Print it out nicely
    RAISE NOTICE '>> Loaded % rows', row_count;

    RAISE NOTICE '- - - - - - - - - Insertion completed for above code- - - - - - - - - - - - - - - -';

    -- ================================================
    -- Insertion in 'erp_px_cat_g1v2' table (erp) -- ERP TBALE - 3
    -- ================================================

    RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';

    truncate table bronze.erp_px_cat_g1v2;
    
    RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';

    COPY bronze.erp_px_cat_g1v2
    FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
    WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ','
    );

        -- 2. Capture how many rows were just inserted
    GET DIAGNOSTICS row_count = ROW_COUNT;

    -- 3. Print it out nicely
    RAISE NOTICE '>> Loaded % rows', row_count;

    RAISE NOTICE '- - - - - - - - - Insertion completed for above code- - - - - - - - - - - - - - - -';

EXCEPTION
    WHEN OTHERS THEN    
        RAISE NOTICE '==========================================';
        RAISE NOTICE 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE 'Error State: %', SQLSTATE;
        RAISE NOTICE '==========================================';
        
        RAISE EXCEPTION 'Bronze load aborted due to runtime errors.';


END;
$$;



