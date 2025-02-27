CREATE TABLE Поставщик (
  код_поставщика INT PRIMARY KEY,
  поставщик VARCHAR(255)
);

CREATE TABLE Тип_товара (
  код_типа_товара INT PRIMARY KEY,
  тип_товара VARCHAR(255),
  описание VARCHAR(255)
);

CREATE TABLE Категория_товара (
  код_категории INT PRIMARY KEY,
  категория VARCHAR(255),
  описание_категории VARCHAR(255)
);

CREATE TABLE Товар (
  код_товара INT PRIMARY KEY,
  наименование VARCHAR(255),
  описание VARCHAR(255),
  поставщик INT,
  тип_товара INT,
  категория INT,
  склад INT,
  цена DECIMAL(10,2),
  FOREIGN KEY (поставщик) REFERENCES Поставщик(код_поставщика),
  FOREIGN KEY (тип_товара) REFERENCES Тип_товара(код_типа_товара),
  FOREIGN KEY (категория) REFERENCES Категория_товара(код_категории),
  FOREIGN KEY (склад) REFERENCES Склад(код_склада)
);

CREATE TABLE Склад (
  код_склада INT PRIMARY KEY,
  количество INT,
  размер VARCHAR(255)
);

CREATE TABLE Способ_оплаты (
  код_способа_оплаты INT PRIMARY KEY,
  вид_оплаты VARCHAR(255)
);

CREATE TABLE Товарно_кассовый_чек (
  номер_чека INT PRIMARY KEY,
  продавец INT,
  клиент INT,
  товар INT,
  количество INT,
  способ_оплаты INT,
  дата DATE,
  FOREIGN KEY (продавец) REFERENCES Продавец_консультант(код_продавца),
  FOREIGN KEY (клиент) REFERENCES Клиент(код_клиента),
  FOREIGN KEY (товар) REFERENCES Товар(код_товара),
  FOREIGN KEY (способ_оплаты) REFERENCES Способ_оплаты(код_способа_оплаты)
);

CREATE TABLE Продавец_консультант (
  код_продавца INT PRIMARY KEY,
  ФИО VARCHAR(255),
  ИНН VARCHAR(255),
  расчетный_счет VARCHAR(255)
);

CREATE TABLE Клиент (
  код_клиента INT PRIMARY KEY,
  ФИО VARCHAR(255),
  дата_рождения DATE,
  номер_телефона VARCHAR(255)
);
