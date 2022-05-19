use teste;

create table lojas(
loj_prod int not null primary key,
desc_loj char(40)
);

create table produtos(
cod_prod int not null primary key,
loj_prod int,
desc_prod char(40),
dt_inclu_prod Date,
preco_prod decimal(8,3),
FOREIGN KEY (loj_prod) references lojas(loj_prod)
);

create table estoque(
cod_prod int not null primary key,
loj_prod int,
qtd_prod decimal(15,3),
FOREIGN KEY (loj_prod) references lojas(loj_prod)
);

insert into lojas (loj_prod,desc_loj)
values (1, 'primeira_loja')

insert into lojas (loj_prod,desc_loj)
values (2, 'segunda_loja')

insert into produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) 
values (170, 2, 'LEITE CONDESADO MOCOCA', '2010-12-30', 45.40);

update produtos set preco_prod = 95.40 where cod_prod = 170

select p.cod_prod, p.desc_prod, l.loj_prod from produtos as p, lojas as l
where l.loj_prod = 1 or l.loj_prod = 2

Select Max(dt_inclu_prod) from produtos

Select Min(dt_inclu_prod) from produtos

SELECT COUNT(*) FROM produtos

SELECT desc_prod FROM produtos WHERE desc_prod LIKE 'L%'

SELECT SUM(preco_prod) AS totalvalor FROM produtos;

select p.cod_prod, p.desc_prod,p.preco_prod, l.loj_prod, l.desc_loj, e.qtd_prod from produtos as p, lojas as l, estoque as e
where l.loj_prod = 1

SELECT * FROM produtos p WHERE EXISTS (SELECT * FROM estoque as e WHERE p.cod_prod = e.cod_prod)

