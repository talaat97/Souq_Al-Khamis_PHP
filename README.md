# 🛍️ E-Commerce Backend API (PHP Native)

Welcome to the **E-Commerce Backend API** — a powerful, modular backend built with **pure PHP (native)** to handle a complete e-commerce ecosystem.  
This backend powers **three frontend applications** through a single API:
- 👤 **User App** — for customers to browse products, manage accounts, and place orders.  
- 🚚 **Delivery App** — for drivers to handle deliveries and update order statuses.  
- 🧑‍💻 **Admin App** — for admins to manage inventory, users, and reports.

---

## ✨ Features

✅ **Authentication & Authorization** (Register, Login, JWT Token)  
🔐 **Forgot Password** (via email or reset link)  
🏠 **Address Management** (Add / Edit / Delete addresses)  
🛒 **Shopping Cart** (Add, update, remove, and view items)  
🧩 **Items & Products Management** (CRUD operations for items and categories)  
📦 **Orders** (Place, cancel, track, and update orders)  
📢 **Real-Time Notifications** using **Firebase Cloud Messaging (FCM)** to connect all apps (User, Delivery, Admin)  
❤️ **Favorites & Wishlist**  
💸 **Coupons & Discounts**  
🗂️ **Categories & Search** (Filter, browse, and search by name or type)  
🚀 **Multi-App Integration** (Three frontend apps linked via one backend)

---

## 🧰 Tech Stack

| Layer | Technology |
|-------|-------------|
| Language | **PHP (Native)** |
| Database | **MySQL** |
| Server | **Apache / Nginx** |
| Authentication | **JWT (JSON Web Token)** |
| Notifications | **Firebase Cloud Messaging (FCM)** |
| Architecture | RESTful API |
| Format | JSON Responses |

---

## 📁 Project Structure
📦 project-root
┣ 📂 api
┃ ┣ 📂 auth
┃ ┣ 📂 user
┃ ┣ 📂 delivery
┃ ┣ 📂 admin
┃ ┣ 📂 utils
┃ ┗ 📜 config.php
┣ 📂 upload
┃ ┣ 📂 categories (SVG icons)
┃ ┗ 📂 items (PNG product images)
┣ 📜 .htaccess
┣ 📜 db_connection.php
┣ 📜 index.php
┗ 📜 README.md



🖼️ **Upload Folder**  
- `/upload/categories/` → Contains category icons in `.svg` format.  
- `/upload/items/` → Contains product images in `.png` format.  

---

## ⚙️ Installation & Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name

