SHOW databases;
USE latihan2;
SHOW tables;
SELECT * FROM dosen;
SELECT * FROM mahasiswa;
SELECT * FROM mata_kuliah;
SELECT * FROM jadwal_mengajar;
SELECT * FROM krs_mahasiswa;
SHOW CREATE TABLE krs_mahasiswa;
SHOW CREATE TABLE mahasiswa;
SHOW CREATE TABLE mata_kuliah;
SHOW CREATE TABLE jadwal_mengajar;
SHOW CREATE TABLE dosen;
INSERT INTO dosen (kd_ds, nama) VALUES 
("DS005", "Vika Prasetyo");
INSERT INTO mahasiswa (nim, nama, jk, tgl_lahir, kota, kd_ds) VALUES 
(1967890, "Bayu Laksono", "L", "1999-07-22", "Cikarang", "DS004");
UPDATE mahasiswa SET kd_ds = "DS002" WHERE nim = 1812345;
INSERT INTO mata_kuliah (kd_mk, nama, sks) VALUES
("MK008", "Arsitektur Komputer", 2);
INSERT INTO jadwal_mengajar (kd_ds, kd_mk, hari, jam, ruang) VALUES 
("DS005", "MK008", "Kamis", "13:00:00", "201");
INSERT INTO krs_mahasiswa (nim, kd_mk, kd_ds) VALUES 
(1812345, "MK006", "DS004");
DELETE FROM krs_mahasiswa WHERE kd_ds = "DS004" AND nim = 1812345;
UPDATE krs_mahasiswa SET kd_ds = "DS001" WHERE nim = 1812345;
SET FOREIGN_KEY_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 0;

SELECT 
mahasiswa.nim, mahasiswa.nama, mahasiswa.jk, dosen.nama AS "DPA" 
FROM mahasiswa INNER JOIN dosen ON mahasiswa.kd_ds = dosen.kd_ds;

SELECT * FROM mata_kuliah INNER JOIN dosen ON mata_kuliah.kd_mk = dosen.kd_ds;
SELECT mata_kuliah.kd_mk, mata_kuliah.nama, mata_kuliah.sks, dosen.nama
FROM ((mata_kuliah
INNER JOIN jadwal_mengajar ON jadwal_mengajar.kd_mk = mata_kuliah.kd_mk)
INNER JOIN dosen ON dosen.kd_ds = jadwal_mengajar.kd_ds);

SELECT 
mata_kuliah.kd_mk, 
mata_kuliah.nama, 
mata_kuliah.sks, dosen.nama AS "Dosen Pengampu", 
jadwal_mengajar.hari, jadwal_mengajar.jam, jadwal_mengajar.ruang
FROM ((mata_kuliah
INNER JOIN jadwal_mengajar ON jadwal_mengajar.kd_mk = mata_kuliah.kd_mk)
INNER JOIN dosen ON dosen.kd_ds = jadwal_mengajar.kd_ds);

SELECT 
mahasiswa.nim, mahasiswa.nama, 
dosen.nama AS "DPA",
mata_kuliah.nama, mata_kuliah.sks, 
krs_mahasiswa.kd_ds AS "Dosen Pengampu"
FROM 
(((krs_mahasiswa
INNER JOIN mahasiswa ON mahasiswa.nim = krs_mahasiswa.nim)
LEFT JOIN dosen ON mahasiswa.kd_ds = dosen.kd_ds)
INNER JOIN mata_kuliah ON mata_kuliah.kd_mk = krs_mahasiswa.kd_mk);

SELECT 
mahasiswa.nim, mahasiswa.nama, mahasiswa.jk, dosen.nama AS "DPA" 
FROM mahasiswa LEFT JOIN dosen ON mahasiswa.kd_ds = dosen.kd_ds;

