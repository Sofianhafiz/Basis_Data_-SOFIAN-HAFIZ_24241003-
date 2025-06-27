-- Membuat database
CREATE DATABASE IF NOT EXISTS mahasiswa_undikma;

-- Menggunakan database
USE mahasiswa_undikma;

-- Tabel mahasiswa
CREATE TABLE IF NOT EXISTS mahasiswa (
    nim VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jurusan VARCHAR(50),
    angkatan INT
);

-- Tabel matkul (mata kuliah)
CREATE TABLE IF NOT EXISTS matkul (
    kode_matkul VARCHAR(10) PRIMARY KEY,
    nama_matkul VARCHAR(100) NOT NULL,
    sks INT CHECK (sks > 0)
);

-- Tabel ruangan
CREATE TABLE IF NOT EXISTS ruangan (
    kode_ruangan VARCHAR(10) PRIMARY KEY,
    nama_ruangan VARCHAR(50),
    kapasitas INT CHECK (kapasitas > 0)
);

-- Tabel perkuliahan
CREATE TABLE IF NOT EXISTS perkuliahan (
    id_perkuliahan INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(10),
    kode_matkul VARCHAR(10),
    kode_ruangan VARCHAR(10),
    hari VARCHAR(10),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    FOREIGN KEY (kode_matkul) REFERENCES matkul(kode_matkul),
    FOREIGN KEY (kode_ruangan) REFERENCES ruangan(kode_ruangan)
);

-- Mengisi data mahasiswa
INSERT INTO mahasiswa (nim, nama, jurusan, angkatan) VALUES 
('24241179', 'dandi raditya', 'PTI', 2024),
('24241003', 'sopian hafiz', 'PTI', 2024);

-- Mengisi data matkul
INSERT INTO matkul (kode_matkul, nama_matkul, sks) VALUES 
('IF101', 'Pemrograman Dasar', 3),
('IF102', 'Struktur Data', 3);

-- Mengisi data ruangan
INSERT INTO ruangan (kode_ruangan, nama_ruangan, kapasitas) VALUES 
('R101', 'Lab Komputer 1', 40),
('R102', 'Ruang Teori A', 30);

-- Mengisi data perkuliahan
INSERT INTO perkuliahan (nim, kode_matkul, kode_ruangan, hari) VALUES
('24241179', 'IF101', 'R101', 'Senin'),
('24241003', 'IF101', 'R101', 'Senin'),
('24241179', 'IF102', 'R102', 'Rabu');

-- Menampilkan isi tabel
SELECT * FROM mahasiswa;
SELECT * FROM matkul;
SELECT * FROM ruangan;

-- Query JOIN untuk menampilkan data perkuliahan lengkap
SELECT 
    p.id_perkuliahan,
    m.nim,
    m.nama AS nama_mahasiswa,
    m.jurusan,
    mk.nama_matkul,
    r.nama_ruangan,
    p.hari
FROM perkuliahan p
JOIN mahasiswa m ON p.nim = m.nim
JOIN matkul mk ON p.kode_matkul = mk.kode_matkul
JOIN ruangan r ON p.kode_ruangan = r.kode_ruangan;