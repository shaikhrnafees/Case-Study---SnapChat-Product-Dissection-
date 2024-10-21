-- TABLE
CREATE TABLE Delivery_Services (
    service_id INTEGER PRIMARY KEY AUTOINCREMENT,
    region TEXT NOT NULL,
    service_type TEXT,
    delivery_time TEXT
);
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE Discounts_Offers (
    offer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    discount_percentage REAL,
    offer_description TEXT,
    valid_until DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Emergency_Deliveries (
    delivery_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    medicine_id INTEGER,
    request_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    status TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
CREATE TABLE Loyalty_Programs (
    loyalty_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    points_earned INTEGER DEFAULT 0,
    points_redeemed INTEGER DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Medicines (
    medicine_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    stock_level INTEGER NOT NULL,
    brand TEXT
);
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    delivery_status TEXT,
    total_amount REAL NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Reminders (
    reminder_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    medicine_id INTEGER,
    reminder_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
CREATE TABLE Supply_Chain (
    supply_chain_id INTEGER PRIMARY KEY AUTOINCREMENT,
    region TEXT,
    demand_prediction INTEGER,
    delivery_service_id INTEGER,
    FOREIGN KEY (delivery_service_id) REFERENCES Delivery_Services(service_id)
);
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    language_preference TEXT,
    budget REAL
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
