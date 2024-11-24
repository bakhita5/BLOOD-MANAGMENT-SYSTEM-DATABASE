show databases;
create database BloodBank_management;
use BloodBank_management;
show tables ;
CREATE TABLE DONOR
(
Donor_id INT PRIMARY KEY NOT NULL,
Name VARCHAR(200) NOT NULL,
Age INT,
Gender VARCHAR(6),
Blood_group VARCHAR(30) NOT NULL,
Contact_Info VARCHAR(15) UNIQUE,
Address VARCHAR(50),
Last_donationDate Date,
Health_status VARCHAR(100) NOT NULL,
BloodInventory_id INT,
FOREIGN KEY (BloodInventory_id) REFERENCES BLOOD_INVENTORY (BloodInventory_id)
);
CREATE TABLE BLOODBANK
(
Bloodbank_id INT PRIMARY KEY NOT NULL,
B_name VARCHAR(200) NOT NULL,
Location  VARCHAR(50) NOT NULL,
Contact_Info VARCHAR(15) UNIQUE,
Avaiable_bloodgroups VARCHAR(50)
);
CREATE TABLE RECIPIENT
(
Recipient_id INT PRIMARY KEY NOT NULL,
Recipient_name VARCHAR(50) NOT NULL,
R_age INT,
R_gender VARCHAR(6), 
R_bloodgroup VARCHAR(30),
R_contactdetails VARCHAR(30),
R_address VARCHAR(50),
Emergency_contact VARCHAR(30),
Bloodbank_id INT,
FOREIGN KEY (Bloodbank_id) REFERENCES BLOODBANK (Bloodbank_id)
);
CREATE TABLE BLOOD_INVENTORY
(
BloodInventory_id INT PRIMARY KEY NOT NULL,
Blood_name VARCHAR(50) NOT NULL,
Quantity_available VARCHAR(50),
Expiration_date DATE,
Bloodbank_id INT,
FOREIGN KEY (Bloodbank_id) REFERENCES BLOODBANK (Bloodbank_id)
);
CREATE TABLE STAFF
(
Staff_id INT PRIMARY KEY NOT NULL,
S_name VARCHAR(50) NOT NULL,
Role VARCHAR(50) NOT NULL,
Contact_Info VARCHAR(15) UNIQUE,
Bloodbank_id INT,
FOREIGN KEY (Bloodbank_id) REFERENCES BLOODBANK (Bloodbank_id)
);
DESCRIBE BLOOD_INVENTORY;
DESCRIBE BLOODBANK;
DESCRIBE STAFF;
DESCRIBE DONOR;
DESCRIBE RECIPIENT;
alter table Donor add column aBloodInventory_id int ;

INSERT INTO BLOODBANK (Bloodbank_id, B_name, Location, Contact_Info, Avaiable_bloodgroups) VALUES
(1, 'Central Blood Bank', 'Nairobi', '254700111222', 'A+, A-, B+, B-'),
(2, 'Westside Blood Center', 'Mombasa', '254711222333', 'O+, O-, A+'),
(3, 'Eastside Blood Bank', 'Kisumu', '254722333444', 'B+, AB+, AB-'),
(4, 'North Clinic Blood Bank', 'Eldoret', '254733444555', 'A+, O-'),
(5, 'South General Blood Bank', 'Nakuru', '254744555666', 'O+, B-'),
(6, 'Central Regional Blood Bank', 'Nairobi', '254755666777', 'A+, AB+'),
(7, 'Lakeview Blood Bank', 'Kisumu', '254766777888', 'B+, O+'),
(8, 'Riverside Blood Bank', 'Machakos', '254777888999', 'A-, B-'),
(9, 'Coastal Blood Bank', 'Malindi', '254788999000', 'O-, AB-'),
(10, 'Highlands Blood Bank', 'Nyeri', '254799000111', 'A+, O+');
select * from bloodbank;

INSERT INTO Donor (Donor_id, Name, Age, Gender, Blood_group, Contact_Info, Address, Last_donationDate, Health_status, BloodInventory_id) VALUES 
(1, 'Alice Mwangi', 29, 'Female', 'A+', '254701123456', 'Nairobi', '2024-10-01', 'Healthy', 1),
(2, 'John Kamau', 34, 'Male', 'O+', '254702234567', 'Mombasa', '2024-09-15', 'Healthy', 2),
(3, 'Peter Otieno', 28, 'Male', 'B+', '254703345678', 'Kisumu', '2024-10-10', 'Healthy', 3),
(4, 'Grace Wambui', 25, 'Female', 'AB+', '254704456789', 'Eldoret', '2024-10-05', 'Healthy', 4),
(5, 'Mary Njeri', 32, 'Female', 'A-', '254705567890', 'Nakuru', '2024-09-20', 'Healthy', 5),
(6, 'Paul Kiprop', 30, 'Male', 'B-', '254706678901', 'Nairobi', '2024-10-12', 'Healthy', 6),
(7, 'Jane Akinyi', 27, 'Female', 'AB-', '254707789012', 'Kisumu', '2024-10-18', 'Healthy', 7),
(8, 'Michael Mutua', 35, 'Male', 'O-', '254708890123', 'Machakos', '2024-09-28', 'Healthy', 8),
(9, 'Lucy Wairimu', 26, 'Female', 'A+', '254709901234', 'Malindi', '2024-10-08', 'Healthy', 9),
(10, 'George Mwangi', 33, 'Male', 'O+', '254710012345', 'Nyeri', '2024-10-20', 'Healthy', 10);
select * from Donor;


INSERT INTO BLOOD_INVENTORY (BloodInventory_id, Blood_name, Quantity_available, Expiration_date, Bloodbank_id) VALUES
(1, 'A+', '50 Units', '2024-12-01', 1),
(2, 'O+', '30 Units', '2024-11-15', 2),
(3, 'B+', '40 Units', '2024-12-10', 3),
(4, 'AB+', '20 Units', '2024-11-20', 4),
(5, 'A-', '60 Units', '2024-12-05', 5),
(6, 'B-', '35 Units', '2024-11-25', 6),
(7, 'AB-', '15 Units', '2024-12-15', 7),
(8, 'O-', '70 Units', '2024-12-01', 8),
(9, 'A+', '25 Units', '2024-11-30', 9),
(10, 'O+', '55 Units', '2024-12-20', 10);
select * from Blood_inventory;


INSERT INTO RECIPIENT (Recipient_id, Recipient_name, R_age, R_gender, R_bloodgroup, R_contactdetails, R_address, Emergency_contact, Bloodbank_id) VALUES
(1, 'Eunice Njoroge', 40, 'Female', 'A+', '254711112233', 'Nairobi', '254722334455', 1),
(2, 'James Mwangi', 50, 'Male', 'O+', '254722223344', 'Mombasa', '254733445566', 2),
(3, 'Ruth Odhiambo', 36, 'Female', 'B+', '254733334455', 'Kisumu', '254744556677', 3),
(4, 'Joseph Ochieng', 48, 'Male', 'AB+', '254744445566', 'Eldoret', '254755667788', 4),
(5, 'Nancy Kariuki', 42, 'Female', 'A-', '254755556677', 'Nakuru', '254766778899', 5),
(6, 'Isaac Ndegwa', 45, 'Male', 'B-', '254766667788', 'Nairobi', '254777889900', 6),
(7, 'Dorothy Muthoni', 38, 'Female', 'AB-', '254777778899', 'Kisumu', '254788990011', 7),
(8, 'Samuel Macharia', 41, 'Male', 'O-', '254788889900', 'Machakos', '254799001122', 8),
(9, 'Agnes Wairimu', 43, 'Female', 'A+', '254799990011', 'Malindi', '254700112233', 9),
(10, 'Kevin Otieno', 39, 'Male', 'O+', '254700001122', 'Nyeri', '254711223344', 10);
select * from RECIPIENT;


INSERT INTO STAFF (Staff_id, S_name, Role, Contact_Info, Bloodbank_id) VALUES
(1, 'Dr. John Doe', 'Doctor', '254701234567', 1),
(2, 'Mary Smith', 'Nurse', '254702345678', 2),
(3, 'Paul Ochieng', 'Technician', '254703456789', 3),
(4, 'Jane Wambui', 'Lab Assistant', '254704567890', 4),
(5, 'David Otieno', 'Manager', '254705678901', 5),
(6, 'Grace Kimani', 'Phlebotomist', '254706789012', 6),
(7, 'Mark Onyango', 'Technician', '254707890123', 7),
(8, 'Lucy Wangari', 'Nurse', '254708901234', 8),
(9, 'Peter Mwangi', 'Doctor', '254709012345', 9),
(10, 'Susan Kamau', 'Receptionist', '254710123456', 10);
select * from STAFF;

select Quantity_available , Blood_name from BLOOD_INVENTORY;
select Blood_name,Quantity_avHailable,Expiration_date ,Bloodbank_id from BLOOD_INVENTORY;
Update BLOOD_INVENTORY SET Quantity_Available='20 units' where BloodInventory_id=4;
update Donor set contact_info ='25411111111' where Donor_id=5;
update BLOODBANK set B_name='Breakdown Hospital' where Bloodbank_id=7;
delete from Recipient where Recipient_id=7;
Delete from STAFF where Staff_id=4;
delete from DONOR where BloodInventory_id=1;

UPDATE Donor
SET Age = 18
WHERE Donor_id = 1;

UPDATE Donor
SET Age = 25
WHERE Donor_id = 2;

UPDATE Donor
SET Age = 29
WHERE Donor_id = 3;

UPDATE Donor
SET Age = 26
WHERE Donor_id = 4;

UPDATE Donor
SET Age = 20
WHERE Donor_id = 5;

UPDATE Donor
SET Age = 29
WHERE Donor_id = 6;

UPDATE Donor
SET Age = 40
WHERE Donor_id = 7;

UPDATE Donor
SET Age = 45
WHERE Donor_id = 8;

UPDATE Donor
SET Age = 27
WHERE Donor_id = 9;

UPDATE Donor
SET Age = 34
WHERE Donor_id = 10;



SELECT d.Donor_id, d.Name, d.Blood_group, b.B_name AS Blood_Bank_Name, b.Location
FROM DONOR d
JOIN BLOOD_INVENTORY bi ON d.BloodInventory_id = bi.BloodInventory_id
JOIN BLOODBANK b ON bi.Bloodbank_id = b.Bloodbank_id;

SELECT Blood_group, COUNT(*) AS Donor_Count
FROM DONOR
GROUP BY Blood_group;

SELECT Blood_name, SUM(Quantity_available) AS Total_Quantity
FROM BLOOD_INVENTORY
GROUP BY Blood_name;

SELECT 
    RECIPIENT.Recipient_name AS RecipientName,
    RECIPIENT.R_bloodgroup AS RecipientBloodGroup,
    DONOR.Name AS DonorName,
    DONOR.Blood_group AS DonorBloodGroup
FROM 
    RECIPIENT
JOIN 
    DONOR ON RECIPIENT.R_bloodgroup = DONOR.Blood_group;


select * from Donor;


