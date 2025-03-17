CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    data_nascimento DATE,
    documento_identidade VARCHAR(20) UNIQUE
);

CREATE TABLE Destinos (
    id_destino INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    pais VARCHAR(100),
    cidade VARCHAR(100),
    preco DECIMAL(10, 2)
);

CREATE TABLE Pacotes (
    id_pacote INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    id_destino INT,
    preco DECIMAL(10, 2),
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (id_destino) REFERENCES Destinos(id_destino)
);

CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_pacote INT,
    data_reserva DATE,
    status_reserva VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_pacote) REFERENCES Pacotes(id_pacote)
);

CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    data_pagamento DATE,
    valor_pago DECIMAL(10, 2),
    metodo_pagamento VARCHAR(50),
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);

