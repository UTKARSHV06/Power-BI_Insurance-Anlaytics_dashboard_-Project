SET SQL_SAFE_UPDATES = 0;

create database insuranceanalytics;
use  insuranceanalytics;

CREATE TABLE brokerage_table (
    client_name VARCHAR(100),
    policy_number VARCHAR(100),
    policy_status VARCHAR(20),
    policy_start_date DATE,
    policy_end_date DATE,
    product_group VARCHAR(50),
    account_id INT,
    account_exe_id VARCHAR(100),
    branch_name VARCHAR(100),
    solution_group VARCHAR(100),
    income_class VARCHAR(50),
    amount DECIMAL(15,2),
    income_due_date DATE,
    revenue_transaction_type VARCHAR(50),
    renewal_status VARCHAR(50),
    last_updated_date DATE
);

describe brokerage_table;

LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Brokerage Table.csv'
INTO TABLE brokerage_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Brokerage Table.csv'
INTO TABLE brokerage_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Brokerage Table.csv'
INTO TABLE brokerage_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    client_name,
    policy_number,
    policy_status,
    @policy_start_date,
    @policy_end_date,
    product_group,
    account_id,
    account_exe_id,
    branch_name,
    solution_group,
    income_class,
    amount,
    @income_due_date,
    revenue_transaction_type,
    renewal_status,
    @last_updated_date
)
SET
    policy_start_date = STR_TO_DATE(@policy_start_date, '%d-%m-%Y'),
    policy_end_date = STR_TO_DATE(@policy_end_date, '%d-%m-%Y'),
    income_due_date = STR_TO_DATE(@income_due_date, '%d-%m-%Y'),
    last_updated_date = STR_TO_DATE(@last_updated_date, '%d-%m-%Y');
    
    select * from brokerage_table;
    
    CREATE TABLE FeesTable (
    client_name VARCHAR(50),
    branch_name VARCHAR(100),
    solution_group VARCHAR(150),
    Salesperson_ID INT,
    Account_Executive VARCHAR(100),
    income_class VARCHAR(50),
    Amount DECIMAL(15,2),
    income_due_date DATE,
    revenue_transaction_type VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Fees Table.csv'
INTO TABLE feestable
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    client_name,
    branch_name,
    solution_group,
    Salesperson_ID,
    Account_Executive,
    income_class,
    Amount,
    @income_due_date,
    revenue_transaction_type
)
SET
   income_due_date = STR_TO_DATE( @income_due_date, '%d-%m-%Y');
   
   select * from feestable;
   
   CREATE TABLE budget_table (
    branch VARCHAR(100),
    sales_person_id INT,
    employee_name VARCHAR(100),
    new_role VARCHAR(100),
    new_budget DECIMAL(15,2),
    cross_sell_budget DECIMAL(15,2),
    renewal_budget DECIMAL(15,2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Budget Table.csv'
INTO TABLE budget_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    branch,
    sales_person_id,
    employee_name,
    new_role,
    new_budget,
    cross_sell_budget,
    renewal_budget
);

SELECT * FROM budget_table;

CREATE TABLE invoice_table (
    invoice_number BIGINT,
    invoice_date DATE,
    revenue_transaction_type VARCHAR(50),
    branch_name VARCHAR(100),
    solution_group VARCHAR(150),
    account_exe_id INT,
    account_executive VARCHAR(100),
    income_class VARCHAR(50),
    client_name VARCHAR(100),
    policy_number VARCHAR(100),
    amount DECIMAL(15,2),
    income_due_date DATE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Invoice Table.csv'
INTO TABLE invoice_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    invoice_number,
    @invoice_date,
    revenue_transaction_type,
    branch_name,
    solution_group,
    account_exe_id,
    account_executive,
    income_class,
    client_name,
    policy_number,
    amount,
    @income_due_date
)
SET
    invoice_date = STR_TO_DATE(@invoice_date, '%d-%m-%Y'),
    income_due_date = STR_TO_DATE(@income_due_date, '%d-%m-%Y');
    
    SELECT * FROM invoice_table;
    
    CREATE TABLE meeting_table (
    account_exe_id INT,
    account_executive VARCHAR(100),
    branch_name VARCHAR(100),
    global_attendees VARCHAR(100),
    meeting_date DATE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Meeting Table.csv'
INTO TABLE meeting_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    account_exe_id,
    account_executive,
    branch_name,
    global_attendees,
    @meeting_date
)
SET
    meeting_date = STR_TO_DATE(@meeting_date, '%d-%m-%Y');
    
    SELECT * FROM meeting_table;
    
    CREATE TABLE opportunity_table (
    opportunity_name VARCHAR(200),
    opportunity_id VARCHAR(50),
    account_exe_id INT,
    account_executive VARCHAR(100),
    premium_amount DECIMAL(18,2),
    revenue_amount DECIMAL(18,2),
    closing_date DATE,
    stage VARCHAR(100),
    branch VARCHAR(100),
    specialty VARCHAR(200),
    product_group VARCHAR(150),
    product_sub_group VARCHAR(150),
    risk_details VARCHAR(250)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Opportunity Table.csv'
INTO TABLE opportunity_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    opportunity_name,
    opportunity_id,
    account_exe_id,
    account_executive,
    premium_amount,
    revenue_amount,
    @closing_date,
    stage,
    branch,
    specialty,
    product_group,
    product_sub_group,
    risk_details
)
SET
    closing_date = STR_TO_DATE(@closing_date, '%d-%m-%Y');
    
    SELECT * FROM opportunity_table;
    
    DESC brokerage_table;
    SELECT * FROM brokerage_table LIMIT 5;
    
    ALTER TABLE brokerage_table
MODIFY COLUMN account_exe_id VARCHAR(100);

DESC brokerage_table;






## Insurance Analytics Project Queries
#		Brokerage Queries
#   	1.) Total Brokerage Revenue
SELECT
    SUM(amount) AS total_brokerage
FROM brokerage_table;

#	2.) Brokerage by Income Class
SELECT
    income_class,
    COUNT(*) AS policy_count,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY income_class
ORDER BY total_brokerage DESC;

#	 3.)Brokerage by Account Executive
SELECT
    account_exe_id AS account_executive,
    COUNT(*) AS policy_count,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY account_exe_id
ORDER BY total_brokerage DESC;

#	4.)Brokerage by Branch
SELECT
    branch_name,
    COUNT(*) AS policy_count,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY branch_name
ORDER BY total_brokerage DESC;

#  5.) Brokerage by Product
SELECT
    product_group,
    COUNT(*) AS policy_count,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY product_group
ORDER BY total_brokerage DESC;

#	6.) Brokerage by Branch and Income Class
SELECT
    branch_name,
    income_class,
    COUNT(*) AS policy_count,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY
    branch_name,
    income_class
ORDER BY
    branch_name,
    total_brokerage DESC;
    
    # 	7.) Complete Branch Performance
    SELECT
    branch_name,

    SUM(
        CASE
            WHEN LOWER(income_class) = 'cross sell'
            THEN amount ELSE 0
        END
    ) AS cross_sell_brokerage,

    SUM(
        CASE
            WHEN LOWER(income_class) = 'new'
            THEN amount ELSE 0
        END
    ) AS new_brokerage,

    SUM(
        CASE
            WHEN LOWER(income_class) = 'renewal'
            THEN amount ELSE 0
        END
    ) AS renewal_brokerage,

    SUM(amount) AS total_brokerage,

    COUNT(*) AS total_policies

FROM brokerage_table
GROUP BY branch_name
ORDER BY total_brokerage DESC;

# 	8.) Active vs Inactive Policies
SELECT
    policy_status,
    COUNT(*) AS policy_count,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY policy_status
ORDER BY policy_count DESC;

#	9.) Renewal Status Analysis
SELECT
    renewal_status,
    COUNT(*) AS policy_count,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY renewal_status
ORDER BY total_brokerage DESC;

#	10.) Monthly Brokerage Trend
SELECT
    YEAR(income_due_date) AS year,
    MONTH(income_due_date) AS month,
    DATE_FORMAT(income_due_date, '%Y-%m') AS Year__Month,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY
    YEAR(income_due_date),
    MONTH(income_due_date),
    DATE_FORMAT(income_due_date, '%Y-%m')
ORDER BY
    year,
    month;
    
    #	11.) Year-wise Brokerage
    SELECT
    YEAR(income_due_date) AS year,
    SUM(amount) AS total_brokerage,
    COUNT(*) AS policy_count
FROM brokerage_table
GROUP BY YEAR(income_due_date)
ORDER BY year;

#	12.) Top 10 Clients
SELECT
    client_name,
    COUNT(DISTINCT policy_number) AS policy_count,
    SUM(amount) AS total_brokerage
FROM brokerage_table
GROUP BY client_name
ORDER BY total_brokerage DESC
LIMIT 10;

# 13.) Top 10 Policies
SELECT
    policy_number,
    client_name,
    product_group,
    income_class,
    policy_status,
    amount
FROM brokerage_table
ORDER BY amount DESC
LIMIT 10;

#	Budget Queries
#	14.) Total Targets
SELECT
    SUM(new_budget) AS new_target,
    SUM(cross_sell_budget) AS cross_sell_target,
    SUM(renewal_budget) AS renewal_target
FROM budget_table;

#	15.) Target by Branch
SELECT
    branch,
    SUM(new_budget) AS new_target,
    SUM(cross_sell_budget) AS cross_sell_target,
    SUM(renewal_budget) AS renewal_target,

    SUM(
        new_budget +
        cross_sell_budget +
        renewal_budget
    ) AS total_target

FROM budget_table
GROUP BY branch
ORDER BY total_target DESC;

#	Fees / Achievement Queries
#	16.) Achievement by Income Class
SELECT
    income_class,
    COUNT(*) AS transaction_count,
    SUM(amount) AS achievement
FROM feestable
GROUP BY income_class
ORDER BY achievement DESC;

#	17.) Achievement by Branch
SELECT
    branch_name,
    SUM(
        CASE
            WHEN LOWER(income_class) = 'cross sell'
            THEN amount ELSE 0
        END
    ) AS cross_sell_achievement,

    SUM(
        CASE
            WHEN LOWER(income_class) = 'new'
            THEN amount ELSE 0
        END
    ) AS new_achievement,

    SUM(
        CASE
            WHEN LOWER(income_class) = 'renewal'
            THEN amount ELSE 0
        END
    ) AS renewal_achievement,

    SUM(amount) AS total_achievement

FROM feestable
GROUP BY branch_name
ORDER BY total_achievement DESC;

# 	Invoice Queries
#	18.) Invoice by Income Class	
SELECT
    income_class,
    COUNT(*) AS invoice_count,
    SUM(amount) AS invoice_amount
FROM invoice_table
GROUP BY income_class
ORDER BY invoice_amount DESC;

#	19.)  Invoice by Account Executive
SELECT
    account_executive,
    COUNT(*) AS invoice_count,
    SUM(amount) AS invoice_amount
FROM invoice_table
GROUP BY account_executive
ORDER BY invoice_count DESC;

#`20.) Invoice by Income Class and Account Executive
SELECT
    account_executive,

    SUM(
        CASE
            WHEN LOWER(income_class) = 'cross sell'
            THEN 1 ELSE 0
        END
    ) AS cross_sell_invoice,

    SUM(
        CASE
            WHEN LOWER(income_class) = 'new'
            THEN 1 ELSE 0
        END
    ) AS new_invoice,

    SUM(
        CASE
            WHEN LOWER(income_class) = 'renewal'
            THEN 1 ELSE 0
        END
    ) AS renewal_invoice,

    COUNT(*) AS total_invoice

FROM invoice_table
GROUP BY account_executive
ORDER BY total_invoice DESC;

#	Achievement % and Invoice %
# 	21.)Placed Achievement %
WITH budget AS (
    SELECT 
        SUM(new_budget) AS new_target,
        SUM(cross_sell_budget) AS cross_sell_target,
        SUM(renewal_budget) AS renewal_target
    FROM budget_table
),

fees AS (
    SELECT
        SUM(
            CASE
                WHEN LOWER(TRIM(income_class)) = 'cross sell'
                THEN amount ELSE 0
            END
        ) AS cross_sell_fees,

        SUM(
            CASE
                WHEN LOWER(TRIM(income_class)) = 'new'
                THEN amount ELSE 0
            END
        ) AS new_fees,

        SUM(
            CASE
                WHEN LOWER(TRIM(income_class)) = 'renewal'
                THEN amount ELSE 0
            END
        ) AS renewal_fees
    FROM feestable
),

brokerage AS (
    SELECT
        SUM(
            CASE
                WHEN LOWER(TRIM(income_class)) = 'cross sell'
                THEN amount ELSE 0
            END
        ) AS cross_sell_brokerage,

        SUM(
            CASE
                WHEN LOWER(TRIM(income_class)) = 'new'
                THEN amount ELSE 0
            END
        ) AS new_brokerage,

        SUM(
            CASE
                WHEN LOWER(TRIM(income_class)) = 'renewal'
                THEN amount ELSE 0
            END
        ) AS renewal_brokerage
    FROM brokerage_table
)

SELECT

    /* CROSS SELL */
    ROUND(
        (
            COALESCE(f.cross_sell_fees, 0)
            +
            COALESCE(br.cross_sell_brokerage, 0)
        )
        /
        NULLIF(b.cross_sell_target, 0)
        * 100,
        2
    ) AS cross_sell_placed_ach_pct,

    /* NEW */
    ROUND(
        (
            COALESCE(f.new_fees, 0)
            +
            COALESCE(br.new_brokerage, 0)
        )
        /
        NULLIF(b.new_target, 0)
        * 100,
        2
    ) AS new_placed_ach_pct,

    /* RENEWAL */
    ROUND(
        (
            COALESCE(f.renewal_fees, 0)
            +
            COALESCE(br.renewal_brokerage, 0)
        )
        /
        NULLIF(b.renewal_target, 0)
        * 100,
        2
    ) AS renewal_placed_ach_pct

FROM budget b
CROSS JOIN fees f
CROSS JOIN brokerage br;

#	22.) Invoice Achievement %
WITH budget AS (
    SELECT
        SUM(new_budget) AS new_target,
        SUM(cross_sell_budget) AS cross_sell_target,
        SUM(renewal_budget) AS renewal_target
    FROM budget_table
),

invoice AS (
    SELECT

        SUM(
            CASE
                WHEN LOWER(income_class) = 'cross sell'
                THEN amount ELSE 0
            END
        ) AS cross_sell_invoice,

        SUM(
            CASE
                WHEN LOWER(income_class) = 'new'
                THEN amount ELSE 0
            END
        ) AS new_invoice,

        SUM(
            CASE
                WHEN LOWER(income_class) = 'renewal'
                THEN amount ELSE 0
            END
        ) AS renewal_invoice

    FROM invoice_table
)

SELECT

    ROUND(
        cross_sell_invoice /
        NULLIF(cross_sell_target,0) * 100,
        2
    ) AS cross_sell_invoice_ach_pct,

    ROUND(
        new_invoice /
        NULLIF(new_target,0) * 100,
        2
    ) AS new_invoice_ach_pct,

    ROUND(
        renewal_invoice /
        NULLIF(renewal_target,0) * 100,
        2
    ) AS renewal_invoice_ach_pct

FROM budget
CROSS JOIN invoice;

#	Opportunity Queries
#	23.) Total Opportunities
SELECT
    COUNT(*) AS total_opportunities
FROM opportunity_table;

#	24.) Opportunity by Stage
SELECT
    stage,
    COUNT(*) AS opportunity_count,
    SUM(revenue_amount) AS total_revenue
FROM opportunity_table
GROUP BY stage
ORDER BY total_revenue DESC;

#	25.)  Open Opportunities
SELECT
    COUNT(*) AS open_opportunities  
FROM opportunity_table
WHERE stage IN (
    'qualify opportunity',
    'propose solution'
);

#	26.) Stage Funnel by Revenue
SELECT
    stage,
    SUM(revenue_amount) AS total_revenue
FROM opportunity_table
GROUP BY stage
ORDER BY
    CASE LOWER(stage)
        WHEN 'qualify opportunity' THEN 1
        WHEN 'negotiate' THEN 2
        WHEN 'propose solution' THEN 3
        ELSE 99
    END;
    
    #	27.) Top 4 Opportunities by Revenue
    SELECT
    opportunity_name,
    SUM(revenue_amount) AS revenue
FROM opportunity_table
GROUP BY opportunity_name
ORDER BY revenue DESC
LIMIT 4;

#	28.) Top 5 Open Opportunities
SELECT
    opportunity_name,
    stage,
    SUM(revenue_amount) AS revenue
FROM opportunity_table
WHERE stage NOT IN (
    'Negotiate'
)
GROUP BY
    opportunity_name,
    stage
ORDER BY revenue DESC
LIMIT 5;

#	29.) Opportunity Product Distribution (using Common Table Expression[CTE])
WITH product_counts AS (
    SELECT
        product_group,
        COUNT(*) AS opportunity_count
    FROM opportunity_table
    GROUP BY product_group
)

SELECT
    product_group,
    opportunity_count,
    ROUND(
        opportunity_count * 100.0 /
        SUM(opportunity_count) OVER (),
        2
    ) AS percentage
FROM product_counts
ORDER BY opportunity_count DESC;

#	Meeting Queries
#	30.)Meetings by Account Executive
SELECT
    account_executive,
    COUNT(*) AS meeting_count
FROM meeting_table
GROUP BY account_executive
ORDER BY meeting_count DESC;

#	31.) Yearly Meeting Count
SELECT
    YEAR(meeting_date) AS meeting_year,
    COUNT(*) AS meeting_count
FROM meeting_table
GROUP BY YEAR(meeting_date)
ORDER BY meeting_year;

#	32.) Account Executive + Yearly Meetings	
   SELECT
    account_executive,
    YEAR(meeting_date) AS meeting_year,
    COUNT(*) AS meeting_count
FROM meeting_table
GROUP BY
    account_executive,
    YEAR(meeting_date)
ORDER BY
    account_executive,
    meeting_year;
    
    

