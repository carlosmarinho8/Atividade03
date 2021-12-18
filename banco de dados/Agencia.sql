-- Criando banco de dados
CREATE DATABASE ProjetoAgencia;

-- Usando banco de dados
USE ProjetoAgencia;

-- Criando tabela cliente
CREATE TABLE Cliente
(ClienteId int NOT NULL PRIMARY KEY,
Nome varchar(50),
Idade int,
Sexo varchar(10),
CPF Bigint,
Email varchar(50),
Telefone int,	
Endereco varchar(50)
); 

-- Criando tabela Viagem com uma chave inglesa para rastrear o destino, data e hora
CREATE TABLE Viagem
(
ViagemId int PRIMARY KEY,
FkCliente int,
FOREIGN KEY(FkCliente) REFERENCES Cliente(ClienteId),
Destino varchar(50),
DataDestino char(10),
Hora char(5),
);
-- Inserindo os dados dos clientes
INSERT INTO Cliente(ClienteId, Nome, Idade, Sexo, CPF, Email, Telefone, Endereco) values
(1, 'Arthur', 21, 'Masculino', 07061602074, 'arthur@yahoo.com', 3333444, 'salvador, ba'),
(2, 'Helena', 25, 'Feminino', 01493148095, 'helena@gmail.com', 33335555, 'são paulo, sp'),
(3, 'Miguel', 30, 'Masculino', 16979730002, 'miguel@outlook.com', 33336666, 'Ilheus, ba'),
(4, 'Alice', 40, 'Feminino', 80834557096, 'alice@yahoo.com', 33337777, 'Rio de janeiro, rj'),
(5, 'Davi', 60, 'Masculino', 66742662050, 'davi@gmail.com', 33338888, 'Manaus, am'),
(6, 'Amanda', 18, 'Feminino', 56369253014, 'amanda@outlook.com', 33339999, 'Fortaleza, ce'),
(7, 'Theo', 50, 'Masculino', 69163725088, 'theo@yahoo.com', 44441111, 'Macapá, ap');
SELECT * FROM Cliente;
-- Inserindo os dados de viagem
INSERT INTO Viagem(ViagemId, FkCliente, Destino, DataDestino, Hora) values
(1, 7, 'Nova York, Estados Unidos', '05-01-2022', '18:00'),
(2, 1, 'Paris, França', '10-02-2022', '13:00'),
(3, 6, 'Tokyo, Japão', '30-01-2022', '15:30'),
(4, 2, 'Florianópolis, Santa Catarina', '07-01-2022', '10:00'),
(5, 5, 'Buenos Aires, Agentina', '27-12-2021', '20:00'),
(6, 3, 'Cidade do Mexico, Mexico', '15-02-2022', '07:00'),
(7, 4, 'Toronto, Canadá','07-01-2022', '12:00');
SELECT * FROM Viagem;
-- A cliente Helena mudou de telefone e foi preciso atualizar seus dados
UPDATE Cliente
SET Telefone = '44442222'
WHERE ClienteId = 1;
SELECT * FROM Cliente;
-- O Cliente Davi decidiu cancelar sua viagem, então sua reserva teve que ser retirada
DELETE Viagem
WHERE FkCliente = 5;
SELECT * FROM Viagem;
-- Rastreando a reservas dos clientes através da referência com inner join e o fk
SELECT Nome, CPF, Destino, DataDestino, Hora
FROM Cliente
INNER JOIN Viagem
ON Cliente.ClienteId = Viagem.FkCliente;

