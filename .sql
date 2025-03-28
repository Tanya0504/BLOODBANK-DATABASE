create DATABASE Minii_Project;
use Minii_project;

-- The donor table contains the information regarding the donor
CREATE TABLE Donor (
    Donor_ID INT PRIMARY KEY, -- The primary key, will help us in finding the donor by making the donor_id as unique.
    NAME VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Blood_Group VARCHAR(3),
    Contact VARCHAR(15),
    Disease VARCHAR(100),
    Quantity_of_Blood DECIMAL(5, 2),
    Date_of_Donation DATE
);

-- The patient table contains the information regarding the person, that needs blood or rather will recieve blood.
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Blood_Group VARCHAR(3),
    Address VARCHAR(255),
    Contact VARCHAR(15),
    Date_of_Intake DATE
);

-- Blood Bank Table
CREATE TABLE Blood_Bank (
    Blood_Bank_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255),
    Available_Blood_Groups VARCHAR(255)
);

CREATE TABLE Blood (
    Blood_ID INT PRIMARY KEY,
    Blood_Group VARCHAR(3),
    Quantity DECIMAL(5, 2),
    Blood_Bank_ID INT,
    FOREIGN KEY (Blood_Bank_ID) REFERENCES Blood_Bank(Blood_Bank_ID)
);

CREATE TABLE Clinical_Analyst (
    Analyst_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Blood_ID INT,
    FOREIGN KEY (Blood_ID) REFERENCES Blood(Blood_ID)
);

CREATE TABLE Hospital (
    Hospital_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255)
);

CREATE TABLE Registration_Team (
    Team_ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Manager (
    Manager_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255),
    Hospital_ID INT,
    FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID)
);

-- PROCESSS
-- Donor donates to Blood Bank via the Donation process.
-- Blood Bank stores Blood, and Blood is analyzed by the Clinical Analyst.
-- Patient receives blood and is registered by the Registration Team.
-- Hospital contacts Blood Bank for blood requirements, and the Manager supervises the hospital operations.

-- INSERTING VALUES

-- Adding a new column named 'Address' to the Donor table
ALTER TABLE Donor
ADD Address VARCHAR(255);


SELECT Donor_ID, Name, Age, Gender, Address, Blood_Group, Contact, Disease, Date_of_Donation, Quantity_of_Blood
FROM Donor
ORDER BY Date_of_Donation DESC;




SET SQL_SAFE_UPDATES = 0;
-- This query lists donors who donated more than 2 units of blood.
SELECT Name, Quantity_of_Blood
FROM Donor
WHERE Quantity_of_Blood > 2;

INSERT INTO Donor (Donor_ID, Name, Age, Gender, Blood_Group, Address, Contact, Disease, Quantity_of_Blood, Date_of_Donation)
VALUES
(1, 'Abhishek Wekhande', 30, 'Male', 'A+', '123 Street, NY', '1234567899', 'None', 150, '2024-01-01'),
(2, 'Tanya Singh', 25, 'Female', 'O-', '456 Avenue, LA', '2345678901', 'None', 200, '2024-02-15'),
(3, 'Palak Bedi', 35, 'Female', 'B+', '789 Blvd, LA', '3456789012', 'None', 140, '2024-03-10'),
(4, 'Tauhid Shaikh', 40, 'Male', 'AB-', '1010 Road, NY', '4567890123', 'Diabetes', 420, '2024-04-05'),
(5, 'Ajay Singh', 29, 'Male', 'O+', '2020 Lane, DY', '5678901234', 'Hypertension', 250, '2024-05-12'),
(6, 'Hemant Sawarkar', 31, 'Male', 'A-', '3030 Circle, FL', '6789012345', 'None', 180, '2024-06-18'),
(7, 'Nakshatra Sawarkar', 27, 'Female', 'B-', '4040 Drive, DY', '7890123456', 'None', 410, '2024-07-25'),
(8, 'Sunil Singh', 36, 'Male', 'AB+', '5050 Path, ND', '8901234567', 'None', 170, '2024-08-30'),
(9, 'Nehali Sawarkar', 22, 'Female', 'A+', '6060 Alley,AK ', '9012345678', 'Asthma', 140, '2024-09-14'),
(10, 'Ankit Sawarkar', 45, 'Male', 'O+', '7070 Street, ND', '0123456789', 'None', 260, '2024-10-10'),
(11, 'Alankrita Bhonde', 28, 'Female', 'O-', '8080 Parkway, AK', '1234509876', 'None', 150, '2024-11-05'),
(12, 'Anmol Chourasia', 32, 'Male', 'B+', '9090 Crescent, AK', '2345610987', 'None', 200, '2024-12-01'),
(13, 'Gunjal Chauhan', 34, 'Female', 'A-', '1110 Park, CA', '3456721098', 'None', 130, '2024-12-15'),
(14, 'Pritam Bedi', 50, 'Male', 'AB+', '1212 Square, CA', '4567832109', 'None', 202, '2025-01-10'),
(15, 'Ruchi Batra', 26, 'Female', 'B+', '1313 Plaza, HI', '5678943210', 'None', 190, '2025-01-25');

select * from donor;



-- INSERTING VALUE INTO BLOOD BANK

INSERT INTO Blood_Bank (Blood_Bank_ID, Name, Location, Available_Blood_Groups)
VALUES
(1, 'City Blood Bank', 'Downtown', 'A+, B+, O-, AB+'),
(2, 'Health Blood Bank', 'Midtown', 'O+, A-, B-, AB-'),
(3, 'LifeBlood Center', 'Uptown', 'A+, O+, B+, AB+'),
(4, 'Red Cross Blood Bank', 'East End', 'A-, O-, B-, AB-'),
(5, 'Universal Donor Blood Bank', 'West End', 'O-, O+');

select * from Blood_bank;

INSERT INTO Blood (Blood_ID, Blood_Group, Quantity, Blood_Bank_ID)
VALUES
(1, 'A+', 100, 1),
(2, 'B+', 150, 1),
(3, 'O-', 50, 1),
(4, 'AB+', 80, 2),
(5, 'O+', 120, 2),
(6, 'A-', 90, 2),
(7, 'B-', 70, 3),
(8, 'A+', 100, 3),
(9, 'O+', 50, 4),
(10, 'B+', 140, 4),
(11, 'AB-', 30, 4),
(12, 'O-', 100, 5),
(13, 'A-', 40, 5),
(14, 'B+', 80, 5),
(15, 'O+', 60, 5);

select * from blood;

INSERT INTO Registration_Team (Team_ID, Name)
VALUES
(1, 'Team Alpha'),
(2, 'Team Beta'),
(3, 'Team Gamma'),
(4, 'Team Delta'),
(5, 'Team Omega');

select * from registration_team;

INSERT INTO Clinical_Analyst (Analyst_ID, Name, Blood_ID)
VALUES
(1, 'Dr. Rohini Parasher', 1),
(2, 'Dr. Jay Agrawal', 2),
(3, 'Dr. Sushant Khan', 3),
(4, 'Dr. Manisha Salodkar', 4),
(5, 'Dr. Anil Gupta', 5);

SELECT * FROM clinical_analyst;
    INSERT INTO Patient (Patient_ID, Name, Gender, Blood_Group, Address, Contact, Date_of_Intake)
VALUES
(1, 'Sameer Wankhede', 'Male', 'A+', '909 Avenue, LA', '1239876543', '2024-01-20'),
(2, 'Maria Shaikh', 'Female', 'B+', '909 Blvd, NY', '2340987654', '2024-02-12'),
(3, 'Prince Warhade', 'Male', 'O-', '888 Circle, AK', '3459876543', '2024-03-25'),
(4, 'Anusha pawar', 'Female', 'AB+', '999 Square, AR', '4569870987', '2024-04-15'),
(5, 'Jeh Khan', 'Male', 'O+', '1212 Path, MN', '5678909876', '2024-05-20'),
(6, 'Diya Vij', 'Female', 'A-', '3434 Parkway, NY', '6789123456', '2024-06-22'),
(7, 'Devansh Rathi', 'Male', 'B-', '5656 Crescent, NY', '7890987654', '2024-07-10'),
(8, 'Sophia Simon', 'Female', 'A+', '7878 Street, AK', '8909876543', '2024-08-18'),
(9, 'James Dean', 'Male', 'O+', '8088 Lane, LA', '9012345678', '2024-09-05'),
(10, 'Olivia Cook', 'Female', 'B-', '9898 Drive, DY', '1239876543', '2024-10-02'),
(11, 'Mike Green', 'Male', 'AB-', '9090 Road, MN', '2345678901', '2024-11-13'),
(12, 'Ella Blue', 'Female', 'A-', '1212 Avenue, ND', '3456789012', '2024-12-10'),
(13, 'Zara Gray', 'Female', 'B+', '9898 Alley, ND', '4567890123', '2025-01-07'),
(14, 'Adam Red', 'Male', 'A+', '3434 Blvd, MN', '5678901234', '2025-02-10'),
(15, 'Sophie Brown', 'Female', 'O+', '7878 Crescent, NY', '6789012345', '2025-03-12');

select * from patient;

INSERT INTO Hospital (Hospital_ID, Name, Location)
VALUES
(1, 'General Hospital', 'City Center'),
(2, 'HealthPlus Clinic', 'East Side'),
(3, 'WellCare Hospital', 'West Side'),
(4, 'Prime Health', 'Downtown'),
(5, 'Life Care Clinic', 'Midtown');

select * from hospital;

 INSERT INTO Manager (Manager_ID, Name, Location, Hospital_ID)
VALUES
(1, 'Tom Johnson', 'City Center', 1),
(2, 'Lucy Smith', 'East Side', 2),
(3, 'Jack Brown', 'West Side', 3),
(4, 'Emma White', 'Downtown', 4),
(5, 'James Black', 'Midtown', 5);

select * from manager;

-- QUERIES
-- QUERY 1
-- This query aggregates the total quantity of blood available in each blood bank using GROUP BY.
SELECT Blood_Bank_ID, SUM(Quantity) AS Total_Quantity
FROM Blood
GROUP BY Blood_Bank_ID;



-- QUERY 2
-- This query joins Blood and Blood_Bank to show which blood types are stored in each blood bank.
SELECT b.Blood_Group, bb.Name AS Blood_Bank
FROM Blood b
JOIN Blood_Bank bb ON b.Blood_Bank_ID = bb.Blood_Bank_ID;

-- QUERY 3
-- This query uses GROUP BY to count how many donors belong to each blood group.
SELECT Blood_Group, COUNT(*) AS Donor_Count
FROM Donor
GROUP BY Blood_Group;


-- QUERY 4 USING JOIN
-- This query joins Donor and Blood tables to find the total quantity of blood donated by each donor and where it was stored.
SELECT d.Name AS Donor, bb.Name AS Blood_Bank, SUM(b.Quantity) AS Total_Quantity
FROM Donor d
JOIN Blood b ON d.Blood_Group = b.Blood_Group
JOIN Blood_Bank bb ON b.Blood_Bank_ID = bb.Blood_Bank_ID
GROUP BY d.Name, bb.Name;

-- QUERY 5
-- This view shows patients along with the clinical analyst who analyzed their blood.
CREATE VIEW Patient_Analyst_View AS
SELECT p.Name AS Patient, ca.Name AS Analyst
FROM Patient p
JOIN Blood b ON p.Blood_Group = b.Blood_Group
JOIN Clinical_Analyst ca ON b.Blood_ID = ca.Blood_ID;
SELECT * FROM PATIENT_ANALYST_VIEW;





-- This query retrieves all donors and their corresponding blood group information
-- It returns all rows from the Donor table, and the matching rows from the Blood table.
-- If there is no match, NULL will be shown for the Blood table columns.

SELECT d.Name AS Donor_Name, 
       d.Blood_Group, 
       b.Quantity AS Blood_Quantity
FROM Donor d                          -- From Donor table, we are fetching donor details.
LEFT JOIN Blood b ON d.Blood_Group = b.Blood_Group  -- Left join to include all donors, even if no matching blood record.
ORDER BY d.Name;                      -- Orders the result by donor name.





-- query 6
-- This query retrieves all hospitals that have patients with blood type 'A+' registered.
SELECT DISTINCT h.Name AS Hospital
FROM Patient p
JOIN Hospital h ON p.Patient_ID = h.Hospital_ID
WHERE p.Blood_Group = 'A+';





-- This trigger updates the blood quantity in the Blood table after a donor makes a donation.
-- Step 1: Set a different delimiter to allow creating the trigger


DELIMITER $$

-- Step 2: Create the trigger to update blood quantity after a donor donates blood
CREATE TRIGGER Update_Blood_Quantity
AFTER INSERT ON Donor
FOR EACH ROW
BEGIN
    -- Update the Quantity in the Blood table based on the donor's blood group
    UPDATE Blood
    SET Quantity = Quantity + NEW.Quantity_of_Blood
    WHERE Blood_Group = NEW.Blood_Group;
END$$

DELIMITER ;

-- Step : Insert a new donor entry to test the trigger
INSERT INTO Donor (Donor_ID, Name, Age, Gender, Address, Blood_Group, Contact, Disease, Date_of_Donation, Quantity_of_Blood) 
VALUES (103, 'Mark Wilson', 32, 'M', '789 Oak St', 'B+', '1112223334', 'None', '2024-10-14', 400);

SELECT * FROM Blood WHERE Blood_Group = 'B+';

-- a



-- This query selects all donors whose blood group contains the letter "O"
SELECT Donor_ID, Name, Age, Gender, Address, Blood_Group, Contact, Disease, Date_of_Donation, Quantity_of_Blood
FROM Donor
WHERE Blood_Group LIKE '%O%';


-- This query finds the minimum age of all donors in the Donor table.
SELECT MIN(Age) AS Min_Age
FROM Donor;


-- This query finds the maximum quantity of blood stored in the blood bank.
SELECT MAX(Quantity) AS Max_Stored_Quantity
FROM Blood;

-- This query calculates the average number of patients registered in each hospital.
SELECT Hospital_Id, AVG(Patient_Id) AS Avg_Registered_Patients
FROM Patient
GROUP BY Hospital_ID;




-- Modify the Quantity_of_Blood column to FLOAT in Donor table
ALTER TABLE Donor
MODIFY COLUMN Quantity_of_Blood FLOAT;
-- Update the Quantity_of_Blood for donor with Donor_ID = 3 to 500.50 ml
UPDATE Donor
SET Quantity_of_Blood = 500.50
WHERE Donor_ID = 3;
-- Retrieve all records from Donor table
SELECT * FROM Donor;



-- Updating the Quantity_of_Blood for the donor with Donor_ID = 5
UPDATE Donor
SET Quantity_of_Blood = 400.00
WHERE Donor_ID = 5;

select quantity_of_blood, donor_id from donor;

-- Deleting a donor with Donor_ID = 4 from the Donor table
DELETE FROM Donor
WHERE Donor_ID = 4;
select donor_id from donor;


-- This query performs a CROSS JOIN between Donor, Blood, and Registration_Team tables
-- It returns every combination of a Donor, a Blood record, and a Registration Team member.
SELECT d.Name AS Donor_Name, 
       b.Blood_Group, 
       rt.Name AS Registration_Team_Name  
FROM Donor d                         
CROSS JOIN Blood b                    -- Cross join to combine every donor with all the blood records.
CROSS JOIN Registration_Team rt       -- Cross join to combine the above result with every registration team member.
LIMIT 0, 1000;



DELIMITER $$

CREATE TRIGGER check_donation_limit
BEFORE INSERT ON Donor
FOR EACH ROW
BEGIN
    
    IF NEW.Quantity_of_Blood > 450 THEN
        
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Donation amount cannot exceed 450 ml';
    END IF;
END$$

DELIMITER ;

-- TESTING TRIGGER
INSER INTO Donor (Donor_ID, Name, Blood_Group, Quantity_of_Blood)
VALUES (2, 'Jane Smith', 'A-', 500); -- This should raise an error due to trigger






-- Create a function to calculate the donation cost
DELIMITER $$

CREATE FUNCTION calculate_donation_cost(donation_quantity INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE cost DECIMAL(10,2);
    SET cost = donation_quantity * 10;  -- Assuming each ml of blood costs 10 units
    RETURN cost;
END $$

DELIMITER ;
SELECT calculate_donation_cost(450) AS Donation_Cost;





DELIMITER //

CREATE PROCEDURE GetDonorByBloodGroup(IN blood_grp VARCHAR(3))
BEGIN
    SELECT Donor_ID, Name, Age, Gender, Address, Contact, Quantity_of_Blood, Date_of_Donation
    FROM Donor
    WHERE Blood_Group = blood_grp;
END //

DELIMITER ;

CALL GetDonorByBloodGroup('O+');
