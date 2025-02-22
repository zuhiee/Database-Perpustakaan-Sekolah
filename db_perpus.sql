-- TUGAS DB AYUNI RAMADHANI XI RPL 1
-- Soal Nomer 1
CREATE DATABASE db_perpus;
use db_perpus;

-- Soal Nomer 2
create table buku(
id_buku int primary key auto_increment,
judul_buku varchar(50),
penulis varchar(50),
kategori varchar(50),
stok int);

create table siswa(
id_siswa int primary key auto_increment,
nama varchar(50),
kelas varchar(10));

create table peminjaman(
id_peminjaman int primary key auto_increment,
id_siswa int,
id_buku int,
tanggal_pinjam date,
tanggal_kembali date,
status varchar(50));

show tables;

-- Soal Nomer 3
insert into siswa (nama,kelas) values ("Andi Saputra", "X-RPL");
insert into siswa (nama,kelas) values ("Budi Wijaya", "X-TKJ");
insert into siswa (nama,kelas) values ("Citra Lestari", "XI-RPL");
insert into siswa (nama,kelas) values ("Dewi Kurniawati", "XI-RP");
insert into siswa (nama,kelas) values ("Eko Prasetyo", "XII-RPL");
select * from siswa;

insert into buku (judul_buku,penulis,kategori,stok) values ("Algoritma dan Pemrograman", "Andi Wijaya", "Teknologi",5);
insert into buku (judul_buku,penulis,kategori,stok) values ("Dasar-dasar Database", "Budi Santoso", "Teknologi",7);
insert into buku (judul_buku,penulis,kategori,stok) values ("Matematika Diskrit", "Rina Sari", "Matematika",4);
insert into buku (judul_buku,penulis,kategori,stok) values ("Sejarah Dunia", "John Smith", "Sejarah",3);
insert into buku (judul_buku,penulis,kategori,stok) values ("Pemrograman Web dengan PHP", "Eko Prasetyo", "Teknologi",8);
select * from buku;

insert into peminjaman (id_siswa,id_buku,tanggal_pinjam,tanggal_kembali,status) values (11,2,"2025-02-01","2025-02-08","Dipinjam");
insert into peminjaman (id_siswa,id_buku,tanggal_pinjam,tanggal_kembali,status) values (2,5,"2025-01-28","2025-02-04","Dikembalikan");
insert into peminjaman (id_siswa,id_buku,tanggal_pinjam,tanggal_kembali,status) values (3,8,"2025-02-02","2025-02-09","Dipinjam");
insert into peminjaman (id_siswa,id_buku,tanggal_pinjam,tanggal_kembali,status) values (4,10,"2025-01-30","2025-02-06","Dikembalikan");
insert into peminjaman (id_siswa,id_buku,tanggal_pinjam,tanggal_kembali,status) values (5,3,"2025-01-25","2025-02-01","Dikembalikan");
select * from peminjaman;

-- Soal Nomer 4
DELIMITER $$
create procedure insert_siswa(
pNama varchar(50),
pKelas varchar(10))
BEGIN
INSERT INTO siswa (nama,kelas) values (pNama,pKelas);
END $$
DELIMITER ;

CALL insert_siswa("Farhan Maulana","XII-TKJ");
CALL insert_siswa("Gita Permata","X-RPL");
CALL insert_siswa("Hadi Sucipto","X-TKJ");
CALL insert_siswa("Intan Permadi","XI-RPL");
CALL insert_siswa("Joko Santoso","XI-TKJ");
CALL insert_siswa("Kartika Sari","XII-RPL");
CALL insert_siswa("Lintang Putri","XII-TKJ");
CALL insert_siswa("Muhammad Rizky","X-RPL");
CALL insert_siswa("Novi Andriana","X-TKJ");
CALL insert_siswa("Olivia Hernanda","XI-RPL");
select * from siswa;

DELIMITER //
create procedure insert_buku(
pJudulBuku varchar(50),
pPenulis varchar(50),
pKategori varchar(50),
pStok int)
BEGIN
INSERT INTO buku (judul_buku,penulis,kategori,stok) values (pJudulBuku,pPenulis,pKategori,pStok);
END //
DELIMITER ;

CALL insert_buku("Sistem Operasi","Dian Kurniawan","Teknologi",6);
CALL insert_buku("Jaringan Komputer","Ahmad Fauzi","Teknologi",5);
CALL insert_buku("Cerita Rakyat Nusantara","Lestari Dewi","Sastra",9);
CALL insert_buku("Bahasa Inggris untuk Pemula","Jane Doe","Bahasa",10);
CALL insert_buku("Biologi Dasar","Budi Rahman","Sains",7);
CALL insert_buku("Kimia Organik","Siti Aminah","Sains",5);
CALL insert_buku("Teknik Elektro","Ridwan Hakim","Teknik",6);
CALL insert_buku("Fisika Modern","Albert Einstein","Sains",4);
CALL insert_buku("Manajemen Waktu","Steven Covey","Pengembangan",8);
CALL insert_buku("Strategi Belajar Efektif","Tony Buzan","Pendidikan",6);
select * from buku;

DELIMITER $$
create procedure insert_peminjaman(
pId_Siswa int,
pId_Buku int,
pTanggal_Pinjam date,
pTanggal_Kembali date,
pStatus varchar(50))
BEGIN
INSERT INTO peminjaman (id_siswa,id_buku,tanggal_pinjam,tanggal_kembali,status) values (pId_Siswa,pId_Buku,pTanggal_Pinjam,pTanggal_Kembali,pStatus);
END $$
DELIMITER ;

CALL insert_peminjaman(15,7,"2025-02-01","2025-02-08","Dipinjam");
CALL insert_peminjaman(7,1,"2025-01-29","2025-02-05","Dikembalikan");
CALL insert_peminjaman(8,9,"2025-02-03","2025-02-10","Dipinjam");
CALL insert_peminjaman(13,4,"2025-01-27","2025-02-03","Dikembalikan");
CALL insert_peminjaman(10,11,"2025-02-01","2025-02-08","Dipinjam");
select * from peminjaman;

-- Soal Nomer 5
-- UPDATE NAMA SISWA
DELIMITER $$
create procedure update_NamaSiswa(
IN new_id int,
IN new_Nama varchar(50))
BEGIN
update siswa set nama = new_Nama where id_siswa=new_id;
END $$
DELIMITER ;
CALL update_NamaSiswa(14,"Amalia Rahmadani");
select * from siswa;

-- UPDATE STOK BUKU
DELIMITER $$
create procedure update_StokBuku(
IN new_Id_Buku int,
IN new_Stok int)
BEGIN
update buku set stok = new_Stok where id_buku=new_Id_Buku;
END $$
DELIMITER ;
CALL update_StokBuku(1,10);
select * from buku;
 
-- UPDATE STATUS PEMINJAMAN
DELIMITER $$
create procedure update_Status_Peminjaman(
IN new_Id_Peminjaman int,
IN new_Status varchar(50))
BEGIN
update peminjaman set status = new_Status where id_peminjaman=new_Id_Peminjaman;
END $$
DELIMITER ;
CALL update_Status_Peminjaman(10,"Dikembalikan");
select * from peminjaman;

-- DELETE DI TABEL SISWA
DELIMITER $$
create procedure delete_Siswa(In new_Id int)
Begin
DELETE FROM siswa where id_siswa = new_Id;
END $$
DELIMITER ;
CALL delete_Siswa(15);
select * from siswa;

-- DELETE DI TABEL BUKU
DELIMITER $$
create procedure delete_Buku(In new_Id_Buku int)
Begin
DELETE FROM buku where id_buku = new_Id_Buku;
END $$
DELIMITER ;
CALL delete_Buku(15);
select * from buku;

-- DELETE DI TABEL PEMINJAMAN
DELIMITER $$
create procedure delete_Peminjaman(In new_Id_Peminjaman int)
Begin
DELETE FROM peminjaman where id_peminjaman = new_Id_Peminjaman;
END $$
DELIMITER ;
CALL delete_peminjaman(9);
select * from peminjaman;

-- Soal Nomer 6
-- TABEL SISWA
DELIMITER $$
create procedure lihat_siswa()
BEGIN
select * from siswa;
END $$
DELIMITER ;
CALL lihat_siswa()

-- TABEL BUKU
DELIMITER $$
create procedure lihat_buku()
BEGIN
select * from buku;
END $$
DELIMITER ;
CALL lihat_buku()

-- TABEL PEMINJAMAN
DELIMITER $$
create procedure lihat_peminjaman()
BEGIN
select * from peminjaman;
END $$
DELIMITER ;
CALL lihat_peminjaman()

-- Soal Nomer 7
DELIMITER $$
create trigger stok_berkurang
AFTER INSERT ON peminjaman
FOR each row
BEGIN
UPDATE buku set stok = stok-1
where id_buku = new.id_buku;
END $$
DELIMITER ;

-- Stok buku dengan id 1 berkurang yang awal nya 10 menjadi 9
CALL insert_peminjaman(1,1,"2025-02-05","2025-02-15","Dipinjam");
CALL lihat_buku()

-- Soal Nomer 8
DELIMITER $$
 create trigger stok_bertambah
 AFTER UPDATE ON peminjaman
 FOR each row
 BEGIN
 IF new.status = "Dikembalikan" THEN
  update buku set stok = stok+1
  where id_buku = new.id_buku;
  END IF;
  END $$
  DELIMITER ;
  
  CALL update_Status_Peminjaman(1,"Dikembalikan");
  CALL lihat_buku()
  
  
-- Soal Nomer 9
  DELIMITER $$
  create procedure mengembalikan_buku(
  IN id_pinjam INT
)
BEGIN
UPDATE peminjaman
set status = "Dikembalikan",
tanggal_kembali = current_date WHERE id_peminjaman = id_pinjam;
END $$
DELIMITER ;
CALL mengembalikan_buku(10);

-- Soal Nomer 10
DELIMITER $$
create procedure daftar_siswa_meminjam_buku()
BEGIN
select s.nama, s.kelas, p.status
FROM peminjaman p
INNER JOIN siswa s
ON p.id_siswa = s.id_siswa;
END $$
DELIMITER ;
CALL daftar_siswa_meminjam_buku()

-- Soal Nomer 11
DELIMITER $$
create procedure daftar_semua_siswa()
BEGIN
select s.nama, s.kelas
FROM siswa s
LEFT JOIN peminjaman p
ON s.id_siswa = p.id_siswa
ORDER BY s.nama ASC;
END $$
DELIMITER ;
CALL daftar_semua_siswa();

-- Soal Nomer 12
DELIMITER $$
create procedure daftar_semua_buku()
BEGIN
select b.judul_buku
FROM buku b
LEFT JOIN peminjaman p
ON b.id_buku = p.id_buku;
END $$
DELIMITER ;
CALL daftar_semua_buku()

