
#  Blood Donation Management System  

## 📌 Overview  
This system manages the end-to-end blood donation process, ensuring smooth interaction between **donors, blood banks, hospitals, and patients.  

## 🗃️ Database Schema  
The system consists of the following tables:  

1. **Donor** - Stores donor details.  
2. **Blood_Bank** - Manages blood storage.  
3. **Donation** - Tracks blood donations.  
4. **Clinical_Analyst** - Analyzes and approves blood quality.  
5. **Patient** - Stores patient details who receive blood.  
6. **Registration_Team** - Handles patient registrations.  
7. **Hospital** - Manages hospital requests for blood.  
8. **Manager** - Supervises hospital operations and inventory.  

## 📜 SQL Scripts  
- **`blood_bank_management.sql`** - Contains **database schema**, including tables and relationships.  
- **`queries.sql`** - Contains SQL queries for retrieving, inserting, updating, and deleting records.  
- **`triggers_procedures.sql`** - Includes **triggers** and **stored procedures** for automation and validation.  

- PROCESSS
-- Donor donates to Blood Bank via the Donation process.
-- Blood Bank stores Blood, and Blood is analyzed by the Clinical Analyst.
-- Patient receives blood and is registered by the Registration Team.
-- Hospital contacts Blood Bank for blood requirements, and the Manager supervises the hospital operations.


## 🚀 How to Run  
1. Import **`blood_bank_management.sql`** into MySQL.  
2. Execute **`triggers_procedures.sql`** to enable automation.  
3. Run **`queries.sql`** for sample queries.  
4. Integrate with a web application (if required).  


