📦 Secure Inventory Management System

📖 Overview

The Secure Inventory Management System is a robust desktop application designed to streamline stock tracking and automate procurement processes. Built with Java and MySQL, it ensures data integrity while providing real-time insights into stock levels.

🚀 Key Features

Real-time Stock Tracking: CRUD operations for inventory items with instant database reflection.

Automated Triggers: Logic to flag items falling below specific thresholds (Reorder Points).

Relational Database Design: Normalized MySQL schema optimized for fast retrieval of large inventories.

Role-Based Access: Basic authentication to secure sensitive pricing and supplier data.

🛠️ Technical Architecture

Frontend/UI: Java Swing / JavaFX

Backend Logic: Java (DAO Pattern)

Database: MySQL (Relational)

🗄️ Database Schema

The system utilizes a relational model linking Suppliers, Products, and Transactions to ensure 3NF (Third Normal Form) compliance.

💻 Getting Started

Database Setup:
Import the schema.sql file into your local MySQL instance.

mysql -u root -p inventory_db < database/schema.sql


Configuration:
Update db.properties with your credentials.

Run:
Launch the main application class.