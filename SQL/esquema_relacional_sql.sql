CREATE TABLE clients(
	idClient int auto_increment PRIMARY KEY,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) NOT NULL,
	Address varchar(255),
	CONSTRAINT UNIQUE_cpf_client UNIQUE (CPF)
);

CREATE TABLE product(
	idProduct int auto_increment PRIMARY KEY,
    Pname varchar(10) NOT NULL,
    classification_kids BOOL DEFAULT false,
    category enum ('Eletrônico','Vestuário','Brinquedos','Alimentos','Móveis')NOT NULL,
	avaliação FLOAT DEFAULT 0,
    size varchar(10)
);
desc product;

CREATE TABLE payment(
    idClient int,
    id_payment int,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limitAvailable FLOAT,
    PRIMARY KEY(idClient, id_payment),
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
);
desc payment;
-- tabela pedido
CREATE TABLE orders(
    idOrder int auto_increment PRIMARY KEY,
    IdOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
    orderDescription varchar (255),
	sendValue FLOAT DEFAULT(10),
    paymentCash BOOL DEFAULT false,
	CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES  clients(idClient)
);
desc orders;

CREATE TABLE productStorage(
    idProductStorage int auto_increment PRIMARY KEY,
    storageLocation varchar(255),
	quantity int DEFAULT 0
);
-- fornecerdor
CREATE TABLE supplier(
    idSupplier int auto_increment PRIMARY KEY,
    socialName varchar(255) NOT NULL,
    CNPJ char(15) NOT NULL, 
    contact char(11) NOT NULL,
	CONSTRAINT  unique_supplier UNIQUE (CNPJ)
);

desc supplier;

-- vendedor
CREATE TABLE seller(
    idSeller int auto_increment PRIMARY KEY,
    socialName varchar(255) NOT NULL,
    absName varchar(255),
    CNPJ char(15), 
    CPF char(9),
    location varchar(255),
    contact char(11) NOT NULL,
	CONSTRAINT  unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT  unique_cpf_seller UNIQUE (CPF)
);
desc seller;

CREATE TABLE productSeller(
    idPseller int,
    IdPproduct int,
    prodQuantity int DEFAULT 1, 
	PRIMARY KEY (idPseller, idPproduct),
    CONSTRAINT  fk_product_seller FOREIGN KEY (idPseller) REFERENCES  seller (idSeller),
	CONSTRAINT  fk_product_product FOREIGN KEY (idPproduct) REFERENCES  product (idProduct)
);
desc productSeller;


CREATE TABLE productOrder(
    idPOproduct int,
    IdPOorder int,
    prodQuantity int DEFAULT 1, 
    poStatus enum('Disponivel','Sem estoque') DEFAULT 'Disponivel',
	PRIMARY KEY (idPOproduct, IdPOorder),
    CONSTRAINT  fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES  product (idProduct),
	CONSTRAINT  fk_productorder_product FOREIGN KEY (IdPOorder) REFERENCES  orders (idOrder)
);

CREATE TABLE storageLocation(
    idLproduct int,
    IdLstorage int,
    location varchar(255) NOT NULL,
	PRIMARY KEY (idLproduct, IdLstorage),
    CONSTRAINT  fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES  product(idProduct),
	CONSTRAINT  fk_storage_location_storage FOREIGN KEY (IdLstorage) REFERENCES  productStorage(idProductStorage)
);
CREATE TABLE productSupplier(
    idPsSupplier int,
    IdsPproduct int,
    quantity int NOT NULL, 
	PRIMARY KEY (idPsSupplier, IdsPproduct),
    CONSTRAINT  fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES  supplier (idSupplier),
	CONSTRAINT  fk_product_supplier_product FOREIGN KEY (IdsPproduct) REFERENCES  product (idProduct)
);
desc productSupplier;
