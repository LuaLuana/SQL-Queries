use ecommerce;
show tables;
select * from clients;
insert into clients(Fname,Minit,Lname,CPF,Address)
	   values('Maria','M','Silva',111111111,'rua silva 29,Norte - Cidade das Flores'),
			 ('Mario','O','Prato',222222222,'rua araujo 9,Centro- Cidade das Flores'),
			 ('Joao','F','Honesto',3333333333,'rua monteiro 129, Centro - Cidade das Flores'),
			 ('Lidia','L','Mendes',4444444444,'avendida brigadeiro 1445, Centro- Cidade das Flores'),
			 ('Silvio','S','Silva',123456789,'rua Alemada 325, Centro - Cidade das Flores');

insert into orders(IdOrderClient,orderStatus,orderDescription,sendValue,paymentCash) values -- v
			(1,default,'compra via aplicativo',null,1),
            (2,default,'compra via aplicativo',50,0),
            (3,'Confirmado',null,null,1),
            (4,default,'compra via web site',150,0);
select * from orders;

insert into productOrder(idPOproduct,IdPOorder,prodQuantity,poStatus) values -- v
			(6,1,2,null),
            (7,2,3,null),
            (8,3,5,'Sem estoque');
            
select * from productOrder;

insert into product (Pname,classification_kids,category,avaliação,size) values
					('Fone',false,'Eletrônico','4',null),
                    ('Elsa',true,'Brinquedos','3',null),
                    ('jeans',true,'Vestuário','1',null),
                    ('Arroz',false,'Alimentos','4',null),
                    ('Mesa',false,'Móveis','3','110x100');
select * from product;   
                 
insert into productStorage(storageLocation,quantity) values
			('São Paulo',1000),
            ('São Paulo',500),
            ('São Paulo',300);
select * from productStorage;

insert into storageLocation(idLproduct,IdLstorage,location) values -- v
			(9,2,'SP'),
            (10,3,'SP');
select * from storageLocation;

insert into supplier (socialName,CNPJ,contact) values  -- v
					('Pernambucanos e Cia',773457691203164,'235621456'),
                    ('Eagle and Cia',923457691203364,'365025654'),
                    ('Eletros ',413457691203164,'235621965');
select *from supplier;		
	
insert into productSupplier (idPsSupplier,IdsPproduct,quantity) values -- v
					(1,6,500),
                    (1,7,200),
                    (2,8,300),
                    (3,9,800);
select * from productSupplier;
					
insert into seller(socialName,AbsName,CNPJ,CPF,location,contact) values	 -- v
					('info e info',null,316052641301474,123568792,null,'235621456'),
                    ('Bar e adega',null,316052641303344,133687102,'Minas Gerais','365025654'),
                    ('Beauty Saloon',null,2134588912031,898750356,'São Paulo','235621965');	
select * from seller;

insert into productSeller(idPseller,IdPproduct,prodQuantity) values	 -- v
					(4,6,80),
                    (5,7,10);	
select * from productSeller;

insert into payment (idClient,id_payment,typePayment,limitAvailable) values
					(1,1,'Boleto',null),
                    (2,2,'Cartão',null),
                    (3,3,'Dois cartões',null),
                    (4,4,'Boleto',null);
select * from payment;





