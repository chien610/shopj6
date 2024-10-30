create database shop;
CREATE TABLE Categories (
    id VARCHAR(100) PRIMARY KEY,
    name NVARCHAR (100) NOT NULL
);

CREATE TABLE Products (
    id INT PRIMARY KEY IDENTITY (1, 1),
    name NVARCHAR (100) NOT NULL,
    image NVARCHAR(500),
    price INT,
    description NVARCHAR(1000),
    Categoryid VARCHAR(100) NOT NULL,
    available tinyint,
    FOREIGN KEY (Categoryid) REFERENCES Categories(id)
);

CREATE TABLE Categories (
    id VARCHAR(100) PRIMARY KEY,
    name NVARCHAR (100) NOT NULL
);

CREATE TABLE Products (
    id INT PRIMARY KEY IDENTITY (1, 1),
    name NVARCHAR (100) NOT NULL,
    image NVARCHAR(500),
    price INT,
    description NVARCHAR(1000),
    Categoryid VARCHAR(100) NOT NULL,
    available tinyint,
    FOREIGN KEY (Categoryid) REFERENCES Categories(id)
);

CREATE TABLE Users(
    username varchar(100) PRIMARY KEY,
    password varchar(100),
    fullname NVARCHAR(100),
    email varchar(100),
    photo NVARCHAR(500),
    activated tinyint,
    isAdmin tinyint,
    isStaff tinyint
);

CREATE TABLE Orders(
    id BIGINT PRIMARY KEY IDENTITY (1, 1),
    Username varchar(100),
    address NVARCHAR (200),
    Createdate DATE NOT NULL,
    Deliver DATE NULL,
    status int,
    FOREIGN KEY (Username) REFERENCES Users(username)
);

CREATE TABLE OrderDetails(
    id BIGINT PRIMARY KEY IDENTITY (1, 1),
    price INT,
    quantity INT,
    Productid INT NOT NULL,
    Orderid BIGINT NOT NULL,
    FOREIGN KEY (Productid) REFERENCES Products(id),
    FOREIGN KEY (Orderid) REFERENCES Orders(id)
);

CREATE TABLE Carts(
    id BIGINT PRIMARY KEY IDENTITY (1, 1),
    Createdate DATE NOT NULL,
    Username varchar(100),
    FOREIGN KEY (Username) REFERENCES Users(username)
);

CREATE TABLE CartItems(
    id BIGINT PRIMARY KEY IDENTITY (1, 1),
    quantity INT,
    Productid INT NOT NULL,
    Cartid BIGINT NOT NULL,
    FOREIGN KEY (Productid) REFERENCES Products(id),
    FOREIGN KEY (Cartid) REFERENCES Carts(id)
);

INSERT INTO Categories VALUES
('IP', 'IPhone'),
('ANDR', 'Android');

INSERT INTO Products(name,image,price,description,Categoryid,available) VALUES
('IPhone 11', 'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-trang-200x200.jpg', 10500000, '', 'IP', 0),
('IPhone 12', 'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-trang-13-600x600.jpg', 11900000, '', 'IP', 0),
('IPhone 13', 'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-starlight-1-600x600.jpg', 14490000, '', 'IP', 1),
('IPhone 14', 'https://cdn.tgdd.vn/Products/Images/42/240259/iPhone-14-thumb-tim-1-600x600.jpg', 17890000, '', 'IP', 1),
('IPhone 15', 'https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-xanh-la-thumb-600x600.jpg', 19900000, '', 'IP', 1),
('Galaxy S22', 'https://cdn.tgdd.vn/Products/Images/42/231110/samsung-galaxy-s22-090222-102419-600x600.jpg', 10900000, '', 'ANDR', 0),
('Galaxy S23', 'https://cdn.tgdd.vn/Products/Images/42/264060/samsung-galaxy-s23-600x600.jpg', 15400000, '', 'ANDR', 1),
('Galaxy S24', 'https://cdn.tgdd.vn/Products/Images/42/319665/samsung-galaxy-s24-yellow-thumb-600x600.png', 19900000, '', 'ANDR', 1);

insert into Users VALUES
('nva', '123', N'Nguyễn Văn A', 'nva@gmail.com', '', 1, 0, 0),
('nvb', '456', N'Nguyễn Văn B', 'nvb@gmail.com', '', 1, 0, 0);