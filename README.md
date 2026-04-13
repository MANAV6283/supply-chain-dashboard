# 🚀 Supply Chain Dashboard

## 📌 Overview

A full-stack **Supply Chain Management Dashboard** that visualizes inventory, orders, and logistics data using real-time analytics.

This project helps businesses:

* Monitor inventory levels 📦
* Track order status 📊
* Optimize transportation costs 🚚

---

## 🛠 Tech Stack

| Layer    | Technology            |
| -------- | --------------------- |
| Database | MySQL                 |
| Backend  | Flask (Python)        |
| Frontend | HTML, CSS, JavaScript |
| Charts   | Chart.js              |

---

## ✨ Features

* 📊 **KPI Metrics**

  * Total Orders
  * Total Inventory

* 📈 **Visual Analytics**

  * Order Status Distribution (Pie Chart)
  * Transport Cost Analysis (Bar Chart)
  * Delivery Time Insights

* 🔄 **Real-Time Data Fetching**

  * Dynamic API integration using Flask

---

## 🗄 Database Design

The system includes the following tables:

* Suppliers
* Manufacturers
* Distributors
* Products
* Inventory
* Orders
* Logistics

👉 All tables are connected using **foreign keys** to maintain data integrity.

---

## 🚀 How to Run

### 1️⃣ Setup Database

* Open MySQL Workbench
* Run the file:

```sql
schema.sql
```

---

### 2️⃣ Run Backend

```bash
python app.py
```

---

### 3️⃣ Open Dashboard

* Open `index.html` in browser

---

## 📸 Output

> Add your dashboard screenshot here

```
![Dashboard](screenshot.png)
```

---

## 📁 Project Structure

```
supply-chain-dashboard/
│
├── app.py
├── index.html
├── schema.sql
├── README.md
```

---

## 🎯 Key Learnings

* Database design with constraints
* REST API development using Flask
* Frontend-backend integration
* Data visualization using Chart.js

---

## 👨‍💻 Author

**Manvendra Nath Choudhury**

---

## 🌟 Future Improvements

* Add login/authentication 🔐
* Deploy dashboard online 🌐
* Add filters and search 📊
* Improve UI/UX 🎨

---

## ⭐ If you like this project

Give it a ⭐ on GitHub!
