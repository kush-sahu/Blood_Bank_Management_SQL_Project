-- STEP 3 DATA INSERTION 
-- INSERT INTO BLOODBANK (must be inserted first, as other tables depend on it)
INSERT INTO BLOODBANK (BBID, BNAME, BBCON, BBADD) VALUES
('BB01', 'City Blood Bank', '9876543210', 'Mumbai'),
('BB02', 'LifeCare Blood Bank', '8765432109', 'Delhi'),
('BB03', 'Red Cross Blood Bank', '7654321098', 'Nagpur'),
('BB04', 'Noble Blood Bank', '6543210987', 'Pune'),
('BB05', 'Apollo Blood Bank', '5432109876', 'Hyderabad'),
('BB06', 'Fortis Blood Bank', '4321098765', 'Bangalore'),
('BB07', 'AIIMS Blood Bank', '3210987654', 'Delhi'),
('BB08', 'Sunrise Blood Bank', '2109876543', 'Chennai'),
('BB09', 'Hope Blood Bank', '1098765432', 'Kolkata'),
('BB10', 'Global Blood Bank', '9988776655', 'Ahmedabad');

-- INSERT INTO PATIENT
INSERT INTO PATIENT (PID, BBID, PNAME, PGEN, PAGE, PCON, PBG) VALUES
('P001','BB01','Ramesh Kumar','Male','35','9876543001','A+'),
('P002','BB02','Suresh Gupta','Male','42','9876543002','B+'),
('P003','BB03','Anita Sharma','Female','28','9876543003','O+'),
('P004','BB04','Vikas Singh','Male','50','9876543004','AB+'),
('P005','BB05','Neha Verma','Female','31','9876543005','A-'),
('P006','BB06','Pooja Mehta','Female','22','9876543006','B-'),
('P007','BB07','Amit Yadav','Male','47','9876543007','O-'),
('P008','BB08','Manish Jain','Male','29','9876543008','AB-'),
('P009','BB09','Priya Das','Female','33','9876543009','A+'),
('P010','BB10','Rahul Joshi','Male','40','9876543010','B+');
INSERT INTO PATIENT (PID, BBID, PNAME, PGEN, PAGE, PCON, PBG) VALUES
('P011','BB01',' Kumar','Male','35','9876543001','AC+');



-- INSERT INTO HOSPITAL (PID must exist in Patient, BBID in BloodBank)
INSERT INTO HOSPITAL (HID, PID, BBID, HNAME, HCON) VALUES
('H001','P001','BB01','Apollo Hospital','9000000001'),
('H002','P002','BB02','Fortis Hospital','9000000002'),
('H003','P003','BB03','AIIMS Delhi','9000000003'),
('H004','P004','BB04','Noble Care Hospital','9000000004'),
('H005','P005','BB05','City Hospital','9000000005'),
('H006','P006','BB06','Sunrise Hospital','9000000006'),
('H007','P007','BB07','Global Health Hospital','9000000007'),
('H008','P008','BB08','Hope Hospital','9000000008'),
('H009','P009','BB09','Care & Cure Hospital','9000000009'),
('H010','P010','BB10','LifeLine Hospital','9000000010');

-- INSERT INTO DONAR
INSERT INTO DONAR (DID, BBID, DNAME, DBG, DGEN, DCON, DON_DATE, MED_REPO) VALUES
('D001','BB01','Karan Patel','A+','Male','9111111111','2025-01-10','Healthy'),
('D002','BB02','Sahil Khan','B+','Male','9222222222','2025-01-15','Minor BP'),
('D003','BB03','Ritu Singh','O+','Female','9333333333','2025-02-01','Healthy'),
('D004','BB04','Deepak Joshi','AB+','Male','9444444444','2025-02-10','Healthy'),
('D005','BB05','Meena Kumari','A-','Female','9555555555','2025-02-12','Diabetic'),
('D006','BB06','Akash Yadav','B-','Male','9666666666','2025-02-18','Healthy'),
('D007','BB07','Sneha Roy','O-','Female','9777777777','2025-02-20','Asthma'),
('D008','BB08','Arjun Sharma','AB-','Male','9888888888','2025-02-25','Healthy'),
('D009','BB09','Pallavi Nair','A+','Female','9999999999','2025-02-28','Healthy'),
('D010','BB10','Rohit Gupta','B+','Male','9101010101','2025-03-01','Healthy');

-- INSERT INTO BLOOD_AVAILABILITY
INSERT INTO BLOOD_AVAILABILITY (BBID, BG, QUANTITY) VALUES
('BB02','A-',5),
('BB03','B-',10),
('BB09','O-',5),
('BB07','AB-',0),
('BB01','A+',08),
('BB02','B+',2),
('BB07','O+',3),
('BB04','AB+',6),
('BB10','A-',8),
('BB08','B-',2);
