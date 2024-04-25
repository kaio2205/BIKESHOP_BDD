create database bikeshop;

use bikeshop;

create table inventario(
idinventario int auto_increment primary key,
modelo varchar(50) not null,
marca varchar (40) not null,
quantidade int not null,
preco decimal(6,2) not null,
idfornecedor int not null
);


create table  clientes(
idclientes int auto_increment primary key,
nome varchar(50) not null,
endereco varchar(100) not null,
telefone varchar (15) not null,
email  varchar (100)
);

create table vendas(
idvendas int auto_increment primary key,
data datetime  not null,
idclientes int not null,
idinventario int not null,
quantidade int not null,
precototal decimal(6,2) not null,
metododepagamento enum ("Dinheiro","Credito","Debito","PIX") not null,
idvendedor int not null
);


create table fornecedor (
idfornecedor int auto_increment primary key,
nomefornecedor varchar (60)  not null,
numerodetelefonedofornecedor varchar (60) not null,
emaildofornecedor varchar(100)

);


create table vendedor(
idvendedor int auto_increment primary key,
nomevendedor varchar (40) not null,
idfuncionario int not null
);

create table  funcionarios(
idfuncionario int auto_increment primary key,
nomefuncionario varchar (40) not null,
cargo varchar(20) not null,
salario decimal (6,2),
datadeemissao datetime not null
); 


create table detalhevenda(
iddetalhevenda int auto_increment primary key,
idvenda int not null,
idfuncionario int not null
);

-- ALTERAÇÃO DE TABELA
-- INVENTARIO 
alter table  inventario
add constraint `fk.inv_pk.forncedor`
foreign key inventario(`idfornecedor`)
references fornecedor(`idfornecedor`);



-- VENDAS
alter table  vendas 
add  constraint  `fk.vendas_pk.clientes`
foreign key vendas (`idclientes`)
references clientes (`idclientes`);


alter table vendas  
add constraint `fk.vendas_pk.inventario`
foreign key vendas (`idinventario`)
references inventario (`idinventario`);

alter table vendas 
add constraint `fk.vendas_pk.vendedor`
foreign key vendas (`idvendedor`)
references  vendedor (`idvendedor`);



-- VENDEDOR
alter table  vendedor
add constraint `fk.vendedor_pk.func`
foreign key vendedor (`idfuncionario`)
references  funcionarios (`idfuncionario`);



-- DETALHE VENDA
alter table detalhevenda
add constraint `fk.dtv_pk.venda`
foreign key detalhevenda (`idvenda`)
references vendas (`idvendas`);

alter table detalhevenda 
add constraint `fk.dtv_pk.func`
foreign key detalhevenda (`idfuncionario`)
references funcionarios (`idfuncionario`);









































drop  database bikeshop;