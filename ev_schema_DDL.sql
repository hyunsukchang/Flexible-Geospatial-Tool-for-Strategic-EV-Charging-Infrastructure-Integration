SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ev_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ev_schema` DEFAULT CHARACTER SET utf8 ;
USE `ev_schema` ;

-- -----------------------------------------------------
-- Table `ev_schema`.`ev_population`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ev_schema`.`ev_population` (
  `population_id` INT NOT NULL,
  `zipcode` VARCHAR(15) NOT NULL,
  `city` VARCHAR(45) NULL,
  `count` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`population_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ev_schema`.`ev_population_jan_2021`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ev_schema`.`ev_population_jul_2022` (
  `population_id_2022` INT NOT NULL,
  `zipcode` VARCHAR(15) NOT NULL,
  `city` VARCHAR(45) NULL,
  `count` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`population_id_2022`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ev_schema`.`demographics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ev_schema`.`demographics` (
  `zip_demo` VARCHAR(15) NOT NULL,
  `edu_less_than_9th_grade` FLOAT NOT NULL,
  `edu_9th_to_12th_grade_no_diploma` FLOAT NOT NULL,
  `edu_high_school_graduate` FLOAT NOT NULL,
  `edu_some_college_no_degree` FLOAT NOT NULL,
  `edu_associates_degree` FLOAT NOT NULL,
  `edu_bachelors_degree`FLOAT NOT NULL,
  `edu_graduate_or_professional_degree` FLOAT NOT NULL,
  `median_income` INT NOT NULL,
  `race_pct_white_only` FLOAT NOT NULL,
  `race_pct_black_affrican_american_only` FLOAT NOT NULL,
  `race_pct_native_american_alaska_native_only` FLOAT NOT NULL,
  `race_pct_asian_only` FLOAT NOT NULL,
  `race_pct_native_hawaiian_pac_islander_only` FLOAT NOT NULL,
  `race_pct_some_other_race` FLOAT NOT NULL,
  `race_pct_two_or_more_races` FLOAT NOT NULL,
  `ethnicity_pct_hispanic_or_latino` FLOAT NOT NULL,
  `age_pct_15_to_19_yrs` FLOAT NOT NULL,
  `age_pct_20_to_24_yrs` FLOAT NOT NULL,
  `age_pct_25_to_34_yrs` FLOAT NOT NULL,
  `age_pct_35_to_44_yrs` FLOAT NOT NULL,
  `age_pct_45_to_54_yrs` FLOAT NOT NULL,
  `age_pct_55_to_59_yrs` FLOAT NOT NULL,
  `age_pct_60_to_64_yrs` FLOAT NOT NULL,
  `age_pct_65_to_74_yrs` FLOAT NOT NULL,
  `age_pct_76_to_84_yrs` FLOAT NOT NULL,
  `age_pct_85_and_older` FLOAT NOT NULL,
  PRIMARY KEY (`zip_demo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ev_schema`.`ev_stations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ev_schema`.`ev_stations` (
  `station_id` INT NOT NULL,
  `zip_station` VARCHAR(10) NOT NULL,
  `station_address` VARCHAR(60) NULL,
  `station_name` VARCHAR(150) NULL,
  `intersection_directions` VARCHAR(150) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `status_code` VARCHAR(10) NULL,
  `station_phone` VARCHAR(30) NULL,
  `groups_with_access_code` VARCHAR(45) NULL,
  `access_days_time` VARCHAR(300) NULL,
  `cards_accepted` VARCHAR(45) NULL,
  `ev_level1_evse_num` SMALLINT NULL,
  `ev_level2_evse_num` SMALLINT NULL,
  `ev_dc_fast_count` SMALLINT NULL,
  `ev_other_info` VARCHAR(45) NULL,
  `ev_network` VARCHAR(45) NOT NULL,
  `ev_network_web` VARCHAR(45) NULL,
  `geocode_status` VARCHAR(10) NULL,
  `latitude` FLOAT NULL,
  `longitude` FLOAT NULL,
  `date_last_confirmed` DATE NULL,
  `updated_at` DATETIME NULL,
  `owner_type_code` VARCHAR(45) NULL,
  `federal_agency_id` VARCHAR(45) NULL,
  `federal_agency_name` VARCHAR(45) NULL,
  `open_date` DATE NULL,
  `ev_connector_types` VARCHAR(45) NULL,
  `access_code` VARCHAR(45) NULL,
  `access_detail_code` VARCHAR(45) NULL,
  `federal_agency_code` VARCHAR(45) NULL,
  `facility_type` VARCHAR(45) NULL,
  `ev_pricing` VARCHAR(150) NULL,
  `ev_on-site_renewable_source` VARCHAR(45) NULL,
  `restricted_access` VARCHAR(45) NULL,
  PRIMARY KEY (`station_id`))
ENGINE = InnoDB;

CREATE INDEX `zip_station_dimensional` ON `ev_schema`.`ev_stations` (`zip_station` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ev_schema`.`fact_ev`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ev_schema`.`fact_ev` (
  `zip_key(PK)` INT NOT NULL AUTO_INCREMENT,
  `population_id_2022` INT NOT NULL,
  `zip_demo` VARCHAR(10) NOT NULL,
  `zip_station` VARCHAR(10) NOT NULL,
  `ev_population_2022` INT NOT NULL,
  `median_income` INT NOT NULL,
  `edu_less_than_9th_grade` FLOAT NOT NULL,
  `edu_9th_to_12th_grade_no_diploma` FLOAT NOT NULL,
  `edu_high_school_graduate` FLOAT NOT NULL,
  `edu_some_college_no_degree` FLOAT NOT NULL,
  `edu_associates_degree` FLOAT NOT NULL,
  `edu_bachelors_degree`FLOAT NOT NULL,
  `edu_graduate_or_professional_degree` FLOAT NOT NULL,
  `race_pct_white_only` FLOAT NOT NULL,
  `race_pct_black_affrican_american_only` FLOAT NOT NULL,
  `race_pct_native_american_alaska_native_only` FLOAT NOT NULL,
  `race_pct_asian_only` FLOAT NOT NULL,
  `race_pct_native_hawaiian_pac_islander_only` FLOAT NOT NULL,
  `race_pct_some_other_race` FLOAT NOT NULL,
  `race_pct_two_or_more_races` FLOAT NOT NULL,
  `ethnicity_pct_hispanic_or_latino` FLOAT NOT NULL,
  `age_pct_15_to_19_yrs` FLOAT NOT NULL,
  `age_pct_20_to_24_yrs` FLOAT NOT NULL,
  `age_pct_25_to_34_yrs` FLOAT NOT NULL,
  `age_pct_35_to_44_yrs` FLOAT NOT NULL,
  `age_pct_45_to_54_yrs` FLOAT NOT NULL,
  `age_pct_55_to_59_yrs` FLOAT NOT NULL,
  `age_pct_60_to_64_yrs` FLOAT NOT NULL,
  `age_pct_65_to_74_yrs` FLOAT NOT NULL,
  `age_pct_76_to_84_yrs` FLOAT NOT NULL,
  `age_pct_85_and_older` FLOAT NOT NULL,
  `count_level_2_chargers` SMALLINT NULL,
  `count_dc_fast_chargers` SMALLINT NULL,
  PRIMARY KEY (`zip_key(PK)`),
  CONSTRAINT `population_id_2022`
    FOREIGN KEY (`population_id_2022`)
    REFERENCES `ev_schema`.`ev_population_jul_2022` (`population_id_2022`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `zip_demo`
    FOREIGN KEY (`zip_demo`)
    REFERENCES `ev_schema`.`demographics` (`zip_demo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `zip_station`
    FOREIGN KEY (`zip_station`)
    REFERENCES `ev_schema`.`ev_stations` (`zip_station`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `population_id_idx` ON `ev_schema`.`fact_ev` (`population_id_2022` ASC) VISIBLE;

CREATE INDEX `zip_demo_idx` ON `ev_schema`.`fact_ev` (`zip_demo` ASC) VISIBLE;

CREATE INDEX `zip_stations_idx` ON `ev_schema`.`fact_ev` (`zip_station` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

