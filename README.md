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

2. **Import the Database**

Import the .sql file from the /database folder into your MySQL server.

3. **Configure Database**

Open db_connection.php and update:

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ecommerce_db";


4. **Set Up FCM**

Add your Firebase Cloud Messaging credentials inside your notification logic or config file.

5. **Run on Localhost**

Move project to htdocs (XAMPP) or your web server root.

Access via:
👉 http://localhost/your-repo-name/api/

📡 API Endpoints (Examples)
Method	Endpoint	Description
POST	/api/auth/login.php	Login user
POST	/api/auth/signup.php	Register new user
POST	/api/auth/forget_password.php	Reset password
GET	/api/products/list.php	Get all products
POST	/api/items/add.php	Add new item
POST	/api/cart/add.php	Add item to cart
POST	/api/order/checkout.php	Create new order
POST	/api/notifications/view.php	Send FCM notification

(Add more endpoints or link to your Postman Collection if available.)

🔒 Authentication Flow

Upon successful login, users receive a JWT token.

Each secured API request must include the token in the header:

Authorization: Bearer YOUR_TOKEN_HERE

🔔 FCM Notification Flow

When an order is created or updated, the system sends an FCM notification to:

The Admin App (for new orders)

The Delivery App (for order assignments)

The User App (for order status updates)

This ensures real-time updates across all connected applications.

🧠 Future Improvements

📈 Advanced analytics for admin dashboard

💬 Real-time chat between users and delivery agents

🌍 Multi-language support

☁️ Cloud storage integration for images

🤝 Contributing

Contributions are always welcome!
If you’d like to enhance or fix something:

Fork this repo

Create a branch (feature/your-feature-name)

Commit your changes

Submit a Pull Request

📬 Contact

👤 Talaat Amr Talaat Abazaa
📧 Email:talaatabazaa10@gmail.com

🔗 GitHub: [yourusername](https://github.com/talaat97/)

⭐ If you like this project, don’t forget to give it a star on GitHub! ⭐


