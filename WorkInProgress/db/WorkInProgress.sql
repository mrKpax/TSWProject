DROP DATABASE IF EXISTS WorkInProgress;
CREATE DATABASE WorkInProgress;
USE WorkInProgress;

CREATE TABLE Prodotto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,  
    categoria ENUM('Attrezzatura', 'Accessori', 'Abbigliamento', 'FoodAndBeverage', 'Allenamenti') NOT NULL,
    descrizione VARCHAR(500) NOT NULL,
    marca VARCHAR(50) NOT NULL, 
    immagine VARCHAR(50) NOT NULL,
    IVA FLOAT NOT NULL,
    prezzo FLOAT NOT NULL
);

INSERT INTO Prodotto VALUES(1, "Set di fasce di resistenza tonificanti", "Attrezzatura", "Pensate per aiutarti a sfidare il tuo corpo. Porta il tuo allenamento al livello successivo, aumentando forza, energia e resistenza, che sia per un buon riscaldamento o per migliorare costantemente la tua flessibilità. 1 x Fascia di resistenza tonificante con resistenza bassa - Grigio chiaro, 1 x Fascia di resistenza tonificante con resistenza media - Grigio Scuro, 1 x Fascia di resistenza tonificante con resistenza alta - Nero", "Prozis", "fasce_resistenza_prozis", 22, 30);

CREATE TABLE Cliente(
	username VARCHAR(20) NOT NULL, 
    cf VARCHAR(16) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    via VARCHAR(50) NOT NULL,
    citta VARCHAR(30) NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    cap VARCHAR(8) NOT NULL,
    telefono VARCHAR(21) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL, 
    psw VARCHAR(50) NOT NULL
);

CREATE TABLE Indirizzo(
	id INT PRIMARY KEY AUTO_INCREMENT,
    via VARCHAR(50) NOT NULL,
    citta VARCHAR(30) NOT NULL,
    cap VARCHAR(8) NOT NULL,
    username VARCHAR(20) NOT NULL,
    FOREIGN KEY(username) REFERENCES Cliente(username)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Metodo_di_pagamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
    numero_carta VARCHAR(30) NOT NULL,
    cvv VARCHAR(4) NOT NULL,
    data_scadenza VARCHAR(15) NOT NULL,
    username VARCHAR(20) NOT NULL,
	FOREIGN KEY(username) REFERENCES Cliente(username)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Ordine(
	id INT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    prezzo_totale FLOAT NOT NULL,
    destinatario VARCHAR(50) NOT NULL,
    metodo_di_pagamento VARCHAR(20) NOT NULL,
    circuito VARCHAR(20) NOT NULL,
    numero_carta VARCHAR(30) NOT NULL,
    indirizzo_di_spedizione VARCHAR(50) NOT NULL,
    numero_di_tracking VARCHAR(50) NOT NULL,
    note VARCHAR(100),
    data_ordine DATE NOT NULL,
    metodo_di_spedizione ENUM('Standard', 'Economic', 'Express') NOT NULL,
    confezione_regalo BOOLEAN NOT NULL,
    FOREIGN KEY(username) REFERENCES Cliente(username)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Fattura(
	sdi VARCHAR(8) PRIMARY KEY,
    importo FLOAT NOT NULL,
    data_scadenza VARCHAR(15) NOT NULL,
    data_emissione VARCHAR(15) NOT NULL,
    stato_del_pagamento VARCHAR(15),
    CHECK(stato_del_pagamento='Paid' OR stato_del_pagamento='Pending'),
    IVA FLOAT NOT NULL,
    id INT UNIQUE NOT NULL,
    FOREIGN KEY(id) REFERENCES Ordine(id)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Composizione(
	id INT NOT NULL,
    id_prodotto INT NOT NULL,
    prezzo FLOAT NOT NULL,
    quantita INT NOT NULL,
    IVA FLOAT NOT NULL,
    PRIMARY KEY(id, id_prodotto),
    FOREIGN KEY(id) REFERENCES Ordine(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY(id_prodotto) REFERENCES Prodotto(id_prodotto)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);