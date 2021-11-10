-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`LoaiHang`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`LoaiHang` ;

CREATE TABLE IF NOT EXISTS `mydb`.`LoaiHang` (
  `MaLoai` INT NOT NULL,
  `TenLoai` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`MaLoai`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LoaiHang`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`LoaiHang` ;

CREATE TABLE IF NOT EXISTS `mydb`.`LoaiHang` (
  `MaLoai` INT NOT NULL,
  `TenLoai` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`MaLoai`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mathang`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mathang` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mathang` (
  `MaMh` INT NOT NULL,
  `TenMh` NVARCHAR(250) NOT NULL,
  `MauSac` VARCHAR(250) NOT NULL,
  `ChatLieu` VARCHAR(250) NOT NULL,
  `GiaBan` DOUBLE NOT NULL,
  `GiaMua` DOUBLE NOT NULL,
  `HinhAnh` TEXT NOT NULL,
  `MaLoai` INT NOT NULL,
  PRIMARY KEY (`MaMh`),
  INDEX `fk_Mathang_LoaiHang_idx` (`MaLoai` ASC) VISIBLE,
  CONSTRAINT `fk_Mathang_LoaiHang`
    FOREIGN KEY (`MaLoai`)
    REFERENCES `mydb`.`LoaiHang` (`MaLoai`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DonHang`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DonHang` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DonHang` (
  `MaDH` INT NOT NULL,
  `DiaChiGiaoHang` TEXT NOT NULL,
  `SDTNguoiNhan` VARCHAR(255) NOT NULL,
  `PhiVanChuyen` DOUBLE NOT NULL,
  `NgayTao` DATETIME NOT NULL,
  `TongTien` DOUBLE NOT NULL,
  PRIMARY KEY (`MaDH`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ChiTietDonHang`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ChiTietDonHang` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ChiTietDonHang` (
  `MaDH` INT NOT NULL,
  `MaMh` INT NOT NULL,
  `SoLuong` INT NOT NULL,
  PRIMARY KEY (`MaDH`, `MaMh`),
  INDEX `fk_DonHang_has_Mathang_Mathang1_idx` (`MaMh` ASC) VISIBLE,
  INDEX `fk_DonHang_has_Mathang_DonHang1_idx` (`MaDH` ASC) VISIBLE,
  CONSTRAINT `fk_DonHang_has_Mathang_DonHang1`
    FOREIGN KEY (`MaDH`)
    REFERENCES `mydb`.`DonHang` (`MaDH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DonHang_has_Mathang_Mathang1`
    FOREIGN KEY (`MaMh`)
    REFERENCES `mydb`.`Mathang` (`MaMh`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HoaDon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`HoaDon` ;

CREATE TABLE IF NOT EXISTS `mydb`.`HoaDon` (
  `MaHD` INT NOT NULL,
  `SoTienCanTHanhToan` DOUBLE NOT NULL,
  `NgayXuat` DATETIME NOT NULL,
  `DonHang_MaDH` INT NOT NULL,
  PRIMARY KEY (`MaHD`),
  INDEX `fk_HoaDon_DonHang1_idx` (`DonHang_MaDH` ASC) VISIBLE,
  CONSTRAINT `fk_HoaDon_DonHang1`
    FOREIGN KEY (`DonHang_MaDH`)
    REFERENCES `mydb`.`DonHang` (`MaDH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
