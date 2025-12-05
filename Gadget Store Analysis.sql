-- 1. Membuat Database
CREATE DATABASE db_toko_gadget;

-- 2. Menggunakan Database tersebut
USE db_toko_gadget;

CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_lengkap VARCHAR(100),
    kota_domisili VARCHAR(50),
    email VARCHAR(100),
    tanggal_daftar DATE
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    kategori VARCHAR(50),
    harga DECIMAL(10, 2),
    stok INT
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    tanggal_transaksi DATE,
    jumlah_barang INT,
    total_bayar DECIMAL(10, 2),
    
    -- Menghubungkan ke tabel customers
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    
    -- Menghubungkan ke tabel products
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (nama_lengkap, kota_domisili, email, tanggal_daftar)
VALUES
('Andi Saputra', 'Jakarta', 'andi@gmail.com', '2023-01-15'),
('Budi Santoso', 'Bandung', 'budi.san@yahoo.com', '2023-02-20'),
('Citra Lestari', 'Surabaya', 'citra.l@gmail.com', '2023-03-10'),
('Dewi Anggraini', 'Jakarta', 'dewi.a@outlook.com', '2023-04-05'),
('Eko Prasetyo', 'Yogyakarta', 'eko.p@gmail.com', '2023-05-12');

INSERT INTO products (nama_produk, kategori, harga, stok)
VALUES
('iPhone 14 Pro', 'Smartphone', 18000000, 10),
('Samsung Galaxy S23', 'Smartphone', 15000000, 15),
('MacBook Air M2', 'Laptop', 20000000, 5),
('Asus ROG Zephyrus', 'Laptop', 25000000, 3),
('AirPods Pro 2', 'Aksesoris', 3500000, 50);

INSERT INTO transactions (customer_id, product_id, tanggal_transaksi, jumlah_barang, total_bayar)
VALUES
-- Transaksi 1: Andi (ID 1) beli iPhone (ID 1)
(1, 1, '2023-06-01', 1, 18000000),

-- Transaksi 2: Budi (ID 2) beli AirPods (ID 5) dua biji
(2, 5, '2023-06-02', 2, 7000000),

-- Transaksi 3: Andi (ID 1) balik lagi beli MacBook (ID 3) (Sultan nih si Andi)
(1, 3, '2023-06-05', 1, 20000000),

-- Transaksi 4: Citra (ID 3) beli Samsung (ID 2)
(3, 2, '2023-06-10', 1, 15000000),

-- Transaksi 5: Eko (ID 5) beli Asus ROG (ID 4)
(5, 4, '2023-06-12', 1, 25000000);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM transactions;

-- Kasus 1: "Saya mau laporan penjualan lengkap. Siapa beli apa, tanggal berapa, dan harganya berapa?"
SELECT 
    t.transaction_id,
    c.nama_lengkap AS Pembeli,
    p.nama_produk AS Barang,
    t.jumlah_barang,
    t.total_bayar,
    t.tanggal_transaksi
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN products p ON t.product_id = p.product_id
ORDER BY t.tanggal_transaksi;
-- Note: 
-- 1. Alias (t, c, p): Huruf t adalah nama panggilan singkat (Alias). Saat mengetik kolom, cukup ketik t.total_bayar, tidak perlu panjang-panjang transactions.total_bayar
-- 2. JOIN: Ini perintah untuk nempel. "Tolong tempelkan tabel Customer ke tabel Transaksi, disesuaikan kuncinya lewat kolom customer_id."

-- Kasus 2: "Berapa total omset toko kita sejauh ini?"
SELECT 
    SUM(total_bayar) AS Total_Omset
FROM transactions;

-- Kasus 3: "Produk apa yang paling laku (Best Seller)?"
SELECT 
    p.nama_produk,
    SUM(t.jumlah_barang) AS Total_Terjual
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.nama_produk
ORDER BY Total_Terjual DESC;
-- Logika:
-- 1. Gabungkan tabel transaksi dan produk.
-- 2. GROUP BY: Kelompokkan data berdasarkan nama produk (semua penjualan iPhone dikumpulkan jadi satu tumpukan, Samsung satu tumpukan, dst).
-- 3. SUM: Hitung total barang di setiap tumpukan itu.
-- 4. DESC: Urutkan dari yang paling besar di atas.

-- Kasus 4: "Siapa pelanggan 'Sultan' kita? (Top Spender)"
SELECT 
    c.nama_lengkap,
    COUNT(t.transaction_id) AS Frekuensi_Belanja,
    SUM(t.total_bayar) AS Total_Belanja
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.nama_lengkap
ORDER BY Total_Belanja DESC
LIMIT 3; -- Hanya ambil Top 3 

-- Kasus 5: "Produk apa yang paling banyak menyumbang pendapatan (Revenue Leader)?"
SELECT 
    p.nama_produk, 
    p.kategori,
    SUM(t.total_bayar) AS Total_Revenue
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.nama_produk, p.kategori -- Grup berdasarkan nama dan kategori
ORDER BY Total_Revenue DESC;