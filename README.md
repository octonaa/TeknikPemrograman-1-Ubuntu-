# Instalasi Ubuntu WSL + Nginx + PHP + MySQL (LAMP Stack)

Panduan ini menjelaskan cara menginstal LAMP stack (Linux, Nginx, MySQL, PHP) di Windows menggunakan WSL (Windows Subsystem for Linux).

## 🛠️ 1. Instalasi Ubuntu WSL

### Langkah-langkah:
1. Buka PowerShell **sebagai Administrator**
2. Jalankan perintah:
   ```powershell
   wsl --install -d Ubuntu
   ```
3. Restart komputer jika diminta
4. Buka Ubuntu (dari Start Menu), lalu buat user dan password saat pertama kali dijalankan.

## 🌐 2. Update Ubuntu & Install Tools
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install curl wget unzip git -y
```

## 🔧 3. Install NGINX
```bash
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

Cek apakah berhasil:
```bash
curl http://localhost
```

## ⚙️ 4. Konfigurasi NGINX (Opsional)
File konfigurasi default bisa disesuaikan:

Letakkan file [nginx/default.conf](./nginx/default.conf) ke:
```bash
sudo cp nginx/default.conf /etc/nginx/sites-available/default
sudo systemctl restart nginx
```

## 🐘 5. Install PHP dan Modul
```bash
sudo apt install php-fpm php-mysql -y
```

### Uji PHP:
Buat file:
```bash
sudo nano /var/www/html/info.php
```

Isi dengan:
```php
<?php phpinfo(); ?>
```

Atau gunakan file [php/info.php](./php/info.php)

Akses di browser:  
[http://localhost/info.php](http://localhost/info.php)

## 🛢️ 6. Install MySQL
```bash
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo mysql_secure_installation
```

### Login MySQL:
```bash
sudo mysql -u root -p
```

## 🔐 7. (Opsional) Buat Database dan User
```sql
CREATE DATABASE contoh_db;
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'passwordku';
GRANT ALL PRIVILEGES ON contoh_db.* TO 'user1'@'localhost';
FLUSH PRIVILEGES;
```

## ✅ Selesai!

Sekarang kamu sudah punya server web lokal menggunakan Ubuntu WSL + Nginx + PHP + MySQL di Windows!

---

## 📁 Struktur Direktori
```
/var/www/html/       => Tempat file PHP
/etc/nginx/          => Konfigurasi NGINX
/etc/php/            => Konfigurasi PHP
/var/lib/mysql/      => Data MySQL
```

## 📄 File Tambahan

- `nginx/default.conf` – konfigurasi virtual host
- `php/info.php` – file uji phpinfo
- `mysql/init.sql` – (opsional) skrip untuk inisialisasi database
