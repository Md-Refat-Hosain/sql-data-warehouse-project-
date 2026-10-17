
/*
====================================================
Create Database and Schemas
====================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/


-- Create database
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'datawarehouse') THEN
        PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE datawarehouse');
    END IF; -- Make sure there is a semicolon here too if needed, though standard syntax is END IF;
END
$$;

-- Schema Creation
create schema if not exists bronze;
create schema if not exists silver;
create schema if not exists gold;
