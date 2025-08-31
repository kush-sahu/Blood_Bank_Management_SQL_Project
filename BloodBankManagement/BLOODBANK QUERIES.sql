SELECT * FROM DONAR;
SELECT * FROM BLOODBANK;
SELECT P.PNAME , P.PBG ,B.BNAME , BT.BG,BT.qUANTITY
FROM ((PATIENT P INNER JOIN bloodbank B
ON P.BBID=B.BBID)INNER JOIN BLOOD_AVAILABILITY BT
ON BT.BBID=B.BBID)
WHERE P.PBG=BT.BG;

use Blood_Bank_Management;

-- 🟢 Easy Queries
-- SHOW TYPE OF BLOOD AVAILABLE IN EACH BLOOD BANK 
SELECT B.BNAME,COUNT(*)
FROM BLOODBANK B INNER JOIN BLOOD_AVAILABILITY BA
ON B.BBID=BA.BBID
GROUP BY B.BNAME;
-- List all patients with their assigned blood bank name.
SELECT  P.PNAME,B.BNAME 
FROM PATIENT P INNER JOIN BLOODBANK B
ON P.BBID=B.BBID;
-- Find all donors who donated after 1st Feb 2025.
SELECT DNAME 
FROM DONAR
WHERE DON_DATE>'2025-02-01';
-- Show all blood banks where O+ blood is available.
SELECT BNAME ,B.BBID
FROM BLOODBANK B INNER JOIN BLOOD_AVAILABILITY BA
ON B.BBID=BA.BBID
WHERE BA.BG='O+';


-- Display hospital names along with the patient names they are associated with.
SELECT P.PNAME , H.HNAME
FROM PATIENT P INNER JOIN HOSPITAL H
ON P.PID=H.PID;
-- 🟡 Medium Queries
-- Find patients who have the same blood group as at least one donor. (Hint: Compare PATIENT.PBG with DONAR.DBG)
SELECT *
FROM PATIENT P
WHERE P.PBG IN(SELECT DBG
               FROM DONAR);
-- Get the total quantity of each blood group available across all blood banks.
SELECT BG, SUM(QUANTITY) AS TOTAL
FROM BLOOD_AVAILABILITY
GROUP BY BG;
-- Find donors who donated to the same blood bank as the patient ‘Ramesh Kumar’.
SELECT DNAME
FROM DONAR
WHERE BBID = (SELECT BBID 
              FROM PATIENT
              WHERE PNAME='Ramesh Kumar');
-- List all blood banks where the total blood quantity available is less than 20 units.
select bname ,bbid
from bloodbank
where bbid in(select bbid
from blood_availability
group by bbid
having sum(Quantity)<20);
-- 🔴 Tricky Queries
-- Find patients whose required blood group is not available in their blood bank.

SELECT P.PNAME, P.PBG, B.BNAME
FROM PATIENT P
INNER JOIN BLOODBANK B ON P.BBID = B.BBID
LEFT JOIN BLOOD_AVAILABILITY BA 
       ON BA.BBID = B.BBID AND BA.BG = P.PBG
WHERE BA.BG IS NULL;


-- Get the hospital names that are associated with more than one patient.
SELECT H.HNAME, COUNT(H.PID) AS PatientCount
FROM HOSPITAL H
GROUP BY H.HID, H.HNAME
HAVING COUNT(H.PID) >= 2;


-- Find the top 3 blood banks with the highest total blood quantity.(Hint: ORDER BY + LIMIT)
-- List all patients and show whether their required blood group is available or not (Yes/No).(Hint: Use CASE WHEN)
-- Find donors who donated a blood group that is currently out of stock in their blood bank.
-- Show patients and donors who share the same blood group and belong to the same blood bank.