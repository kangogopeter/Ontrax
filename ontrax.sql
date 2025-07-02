-- 1. Churches table (must be created first)
CREATE TABLE churches (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(200),
    contact_info VARCHAR(200)
);

-- 2. Contributions table
CREATE TABLE contributions (
    id SERIAL PRIMARY KEY,
    month VARCHAR(20) NOT NULL,
    day INT NOT NULL, -- renamed from "date" to "day" to avoid reserved keyword
    tithes_type VARCHAR(20) NOT NULL,
    sadaka DECIMAL(10, 2) DEFAULT 0.00,
    fungu DECIMAL(10, 2) DEFAULT 0.00,
    transactions DECIMAL(10, 2) DEFAULT 0.00,
    totals DECIMAL(10, 2) DEFAULT 0.00,
    s_totals DECIMAL(10, 2) DEFAULT 0.00,
    g_totals DECIMAL(10, 2) DEFAULT 0.00,
    report_year INT NOT NULL,
    church_id INT NOT NULL,
    FOREIGN KEY (church_id) REFERENCES churches(id)
);

-- 3. Monthly summary table
CREATE TABLE monthly_summary (
    id SERIAL PRIMARY KEY,
    month VARCHAR(20) NOT NULL,
    total_sadaka DECIMAL(10, 2) DEFAULT 0.00,
    total_fungu DECIMAL(10, 2) DEFAULT 0.00,
    total_transactions DECIMAL(10, 2) DEFAULT 0.00,
    grand_total DECIMAL(10, 2) DEFAULT 0.00,
    report_year INT NOT NULL,
    church_id INT NOT NULL,
    FOREIGN KEY (church_id) REFERENCES churches(id)
);

-- 4. Expenditure table
CREATE TABLE expenditure (
    id SERIAL PRIMARY KEY,
    month VARCHAR(20) NOT NULL,
    category VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    report_year INT NOT NULL,
    church_id INT NOT NULL,
    FOREIGN KEY (church_id) REFERENCES churches(id)
);

INSERT INTO Churches (name, location, contact_info) VALUES
('Sarura Tithes', 'Unknown Location', 'Unknown Contact');




INSERT INTO Contributions (month, date, tithes_type, sadaka, fungu, transactions, totals, s_totals, g_totals, report_year, church_id) VALUES
-- January
('January', 1, 'Sadaka', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('January', 1, 'Fungu', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('January', 5, 'Sadaka', 50.00, 0.00, 35.00, 2575.00, 2575.00, 4745.00, 2025, 1),
('January', 5, 'Fungu', 0.00, 50.00, 2390.00, 0.00, 0.00, 0.00, 2025, 1),
('January', 12, 'Sadaka', 50.00, 0.00, 20.00, 1265.00, 0.00, 0.00, 2025, 1),
('January', 12, 'Fungu', 0.00, 40.00, 100.00, 0.00, 0.00, 0.00, 2025, 1),
('January', 12, 'Sadaka', 905.00, 0.00, 1055.00, 0.00, 0.00, 0.00, 2025, 1),
('January', 19, 'Fungu', 0.00, 0.00, 0.00, 0.00, 905.00, 0.00, 2025, 1),
('January', 26, 'Sadaka', 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 2025, 1),
('January', 26, 'Fungu', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('January', 2, 'Sadaka', 2200.00, 0.00, 0.00, 2200.00, 0.00, 0.00, 2025, 1),
-- February
('February', 9, 'Sadaka', 465.00, 0.00, 0.00, 465.00, 0.00, 2865.00, 2025, 1),
('February', 9, 'Fungu', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('February', 16, 'Sadaka', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('February', 16, 'Fungu', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('February', 23, 'Sadaka', 50.00, 0.00, 30.00, 920.00, 0.00, 0.00, 2025, 1),
('February', 23, 'Fungu', 0.00, 50.00, 50.00, 0.00, 0.00, 0.00, 2025, 1),
('February', 2, 'Sadaka', 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 2025, 1),
('February', 9, 'Fungu', 0.00, 50.00, 100.00, 750.00, 0.00, 0.00, 2025, 1),
('February', 9, 'Sadaka', 100.00, 0.00, 940.00, 1090.00, 0.00, 4660.00, 2025, 1),
-- March
('March', 16, 'Sadaka', 30.00, 0.00, 50.00, 630.00, 0.00, 0.00, 2025, 1),
('March', 16, 'Fungu', 0.00, 50.00, 50.00, 0.00, 0.00, 0.00, 2025, 1),
('March', 23, 'Sadaka', 1270.00, 0.00, 0.00, 1270.00, 0.00, 0.00, 2025, 1),
('March', 30, 'Fungu', 0.00, 0.00, 1060.00, 0.00, 0.00, 0.00, 2025, 1),
('March', 6, 'Sadaka', 50.00, 0.00, 20.00, 1180.00, 0.00, 0.00, 2025, 1),
('March', 6, 'Fungu', 100.00, 0.00, 10.00, 725.00, 8625.00, 12075.00, 2025, 1),
('March', 13, 'Sadaka', 7900.00, 0.00, 100.00, 1350.00, 0.00, 0.00, 2025, 1),
('March', 13, 'Fungu', 500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 2025, 1),
('March', 20, 'Sadaka', 50.00, 0.00, 50.00, 920.00, 0.00, 0.00, 2025, 1),
('March', 20, 'Fungu', 0.00, 50.00, 20.00, 0.00, 0.00, 0.00, 2025, 1),
('March', 27, 'Sadaka', 0.00, 0.00, 100.00, 0.00, 0.00, 0.00, 2025, 1),
-- April
('April', 4, 'Sadaka', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('April', 11, 'Fungu', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('April', 18, 'Sadaka', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('April', 25, 'Fungu', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
-- May
('May', 2, 'Sadaka', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1),
('May', 13, 'Fungu', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2025, 1);


INSERT INTO expenditure (month, category, amount, report_year, church_id) VALUES
('January', 'Pastors Salary', 15.00, 2025, 1),
('January', 'C.Office', 0.00, 2025, 1),
('January', 'Transport', 4.00, 2025, 1),
('January', 'Conference', 1225.00, 2025, 1),
('January', 'Bank Charges', 3.00, 2025, 1),
('January', 'COK Returns', 4.00, 2025, 1),
('January', 'Total Expenditure', 393.00, 2025, 1),
('February', 'Pastors Salary', 80.00, 2025, 1),
('February', 'C.Office', 1995.00, 2025, 1),
('February', 'Transport', 12.00, 2025, 1),
('February', 'Conference', 300.00, 2025, 1),
('February', 'Bank Charges', 3.00, 2025, 1),
('February', 'COK Returns', 3.00, 2025, 1),
('February', 'Total Expenditure', 770.00, 2025, 1),
('March', 'Pastors Salary', 1.00, 2025, 1),
('March', 'C.Office', 87500.00, 2025, 1),
('March', 'Transport', 4.00, 2025, 1),
('March', 'Conference', 6000.00, 2025, 1),
('March', 'Bank Charges', 230.00, 2025, 1),
('March', 'COK Returns', 4.00, 2025, 1),
('March', 'Total Expenditure', 86531.00, 2025, 1),
('April', 'Pastors Salary', 12.00, 2025, 1),
('April', 'C.Office', 0.00, 2025, 1),
('April', 'Transport', 335.00, 2025, 1),
('April', 'Conference', 0.00, 2025, 1),
('April', 'Bank Charges', 4.00, 2025, 1),
('April', 'COK Returns', 0.00, 2025, 1),
('April', 'Total Expenditure', 351.00, 2025, 1),
('May', 'Pastors Salary', 51.00, 2025, 1),
('May', 'C.Office', 40.00, 2025, 1),
('May', 'Transport', 0.00, 2025, 1),
('May', 'Conference', 0.00, 2025, 1),
('May', 'Bank Charges', 0.00, 2025, 1),
('May', 'COK Returns', 0.00, 2025, 1),
('May', 'Total Expenditure', 91.00, 2025, 1);
