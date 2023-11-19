CREATE TABLE Antrenmanlar (
    AntrenmanID INT AUTO_INCREMENT PRIMARY KEY,
    UyeID INT,
    AntrenorID INT,
    AntrenmanTarihi DATE NOT NULL,
    EgzersizAdi VARCHAR(100) NOT NULL,
    SetSayisi INT NOT NULL,
    TekrarSayisi INT NOT NULL,
    Agirlik DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (UyeID) REFERENCES Uyeler(UyeID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (AntrenorID) REFERENCES Antrenorler(AntrenorID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Antrenorler (
    AntrenorID INT AUTO_INCREMENT PRIMARY KEY,
    AdSoyad VARCHAR(255) NOT NULL,
    Cinsiyet ENUM('Erkek', 'Kadin', 'Diger') NOT NULL,
    UzmanlikAlani VARCHAR(100),
    Telefon VARCHAR(15),
    Email VARCHAR(255)
);

CREATE TABLE Uyeler (
    UyeID INT AUTO_INCREMENT PRIMARY KEY,
    AdSoyad VARCHAR(255) NOT NULL,
    Cinsiyet ENUM('Erkek', 'Kadin', 'Diger') NOT NULL,
    DogumTarihi DATE NOT NULL,
    Telefon VARCHAR(15),
    Email VARCHAR(255),
    KatilimTarihi DATE NOT NULL,
    UyelikTipi VARCHAR(50) NOT NULL
);

CREATE TABLE Paketler (
    PaketID INT AUTO_INCREMENT PRIMARY KEY,
    PaketAdi VARCHAR(100) NOT NULL,
    Aciklama TEXT,
    Fiyat DECIMAL(8, 2) NOT NULL
);

CREATE TABLE UyePaketleri (
    UyePaketID INT AUTO_INCREMENT PRIMARY KEY,
    UyeID INT,
    PaketID INT,
    BaslangicTarihi DATE NOT NULL,
    BitisTarihi DATE NOT NULL,
    FOREIGN KEY (UyeID) REFERENCES Uyeler(UyeID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PaketID) REFERENCES Paketler(PaketID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Odemeler (
    OdemeID INT AUTO_INCREMENT PRIMARY KEY,
    UyeID INT,
    Miktar DECIMAL(8, 2) NOT NULL,
    OdemeTarihi DATE NOT NULL,
    FOREIGN KEY (UyeID) REFERENCES Uyeler(UyeID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Antrenmanlar (
    AntrenmanID INT AUTO_INCREMENT PRIMARY KEY,
    UyeID INT,
    AntrenorID INT,
    AntrenmanTarihi DATE NOT NULL,
    EgzersizAdi VARCHAR(100) NOT NULL,
    SetSayisi INT NOT NULL,
    TekrarSayisi INT NOT NULL,
    Agirlik DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (UyeID) REFERENCES Uyeler(UyeID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (AntrenorID) REFERENCES Antrenorler(AntrenorID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Katılım Tablosu: Üyelerin katılım bilgilerini saklar.
CREATE TABLE Katilim (
    KatilimID INT AUTO_INCREMENT PRIMARY KEY,
    UyeID INT,
    KatilimTarihi DATE NOT NULL,
    FOREIGN KEY (UyeID) REFERENCES Uyeler(UyeID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Ekipman Tablosu: Fitness merkezindeki ekipman bilgilerini saklar.
CREATE TABLE Ekipman (
    EkipmanID INT AUTO_INCREMENT PRIMARY KEY,
    EkipmanAdi VARCHAR(100) NOT NULL,
    Aciklama TEXT
);

-- Ekipman Bakımı Tablosu: Ekipman bakım bilgilerini saklar.
CREATE TABLE EkipmanBakim (
    BakimID INT AUTO_INCREMENT PRIMARY KEY,
    EkipmanID INT,
    BakimTarihi DATE NOT NULL,
    Aciklama TEXT,
    FOREIGN KEY (EkipmanID) REFERENCES Ekipman(EkipmanID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Dersler Tablosu: Fitness sınıf bilgilerini saklar.
CREATE TABLE Dersler (
    DersID INT AUTO_INCREMENT PRIMARY KEY,
    DersAdi VARCHAR(100) NOT NULL,
    AntrenorID INT,
    ProgramZamani TIME NOT NULL,
    FOREIGN KEY (AntrenorID) REFERENCES Antrenorler(AntrenorID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- İzinler Tablosu: Kullanıcı izinlerini saklar.
CREATE TABLE Izinler (
    IzinID INT AUTO_INCREMENT PRIMARY KEY,
    IzinAdi VARCHAR(50) NOT NULL
);

-- Kullanıcılar Tablosu: Kullanıcı bilgilerini saklar.
CREATE TABLE Kullanicilar (
    KullaniciID INT AUTO_INCREMENT PRIMARY KEY,
    KullaniciAdi VARCHAR(50) NOT NULL,
    SifreHash VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    KayitTarihi DATE NOT NULL,
    IzinID INT,
    FOREIGN KEY (IzinID) REFERENCES Izinler(IzinID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Programlar Tablosu: Fitness program bilgilerini saklar.
CREATE TABLE Programlar (
    ProgramID INT AUTO_INCREMENT PRIMARY KEY,
    ProgramAdi VARCHAR(100) NOT NULL,
    Aciklama TEXT
);

-- ÜyeProgramları Tablosu: Üyelerin aldığı programları saklar.
CREATE TABLE UyeProgramlari (
    UyeProgramID INT AUTO_INCREMENT PRIMARY KEY,
    UyeID INT,
    ProgramID INT,
    BaslangicTarihi DATE NOT NULL,
    BitisTarihi DATE NOT NULL,
    FOREIGN KEY (UyeID) REFERENCES Uyeler(UyeID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProgramID) REFERENCES Programlar(ProgramID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- İletişim Tablosu: Fitness merkezi iletişim bilgilerini saklar.
CREATE TABLE IletisimBilgileri (
    IletisimID INT AUTO_INCREMENT PRIMARY KEY,
    Adres VARCHAR(255),
    Telefon VARCHAR(15),
    Email VARCHAR(255)
);