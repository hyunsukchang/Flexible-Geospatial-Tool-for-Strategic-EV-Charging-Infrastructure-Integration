/* IMPORT WIZARD INSTRUCTIONS
NOTE: MAKE SURE YOU HAVE ALL THE DATASET DOWNLOADED IN CSV FORMAT
WARNING: EV_POPULATION TAKES A LONG TIME, SO DON'T DO THIS FOR EV_POPULATION_JAN_2021. SEE EV_POPULATION_JAN_2021 IN DML BELOW.
1. RIGHT-CLICK ON THE TABLE THAT YOU WANT TO POPULATE
2. CHOOSE TABLE DATA IMPORT WIZARD
3. LOCATE THE DATASET FILE IN YOUR COMPUTER, THEN NEXT
4. CHOOSE THE CORRESPONDING EXISTING TABLE FROM THE DROPDOWN MENU, THEN NEXT
5. MATCH THE COLUMNS, THEN NEXT
6. RUN THE QUERIES BELOW
*/

USE EV_SCHEMA;

-- -----------------------------------------------------
-- Write ev_population_jul_2022 DML script here
-- -----------------------------------------------------

INSERT INTO ev_schema.ev_population_jul_2022 (
SELECT * FROM ev_schema.ev_population
WHERE date = "2022-07-15");

-- -----------------------------------------------------
-- Write Fact table fact_rental DML script here
-- -----------------------------------------------------

INSERT INTO ev_schema.fact_ev (
  population_id_2022,
  zip_demo,
  zip_station,
  ev_population_2022,
  edu_less_than_9th_grade,
  edu_9th_to_12th_grade_no_diploma,
  edu_high_school_graduate,
  edu_some_college_no_degree,
  edu_associates_degree,
  edu_bachelors_degree,
  edu_graduate_or_professional_degree,
  median_income,
  race_pct_white_only,
  race_pct_black_affrican_american_only,
  race_pct_native_american_alaska_native_only,
  race_pct_asian_only,
  race_pct_native_hawaiian_pac_islander_only,
  race_pct_some_other_race,
  race_pct_two_or_more_races,
  ethnicity_pct_hispanic_or_latino,
  age_pct_15_to_19_yrs,
  age_pct_20_to_24_yrs,
  age_pct_25_to_34_yrs,
  age_pct_35_to_44_yrs,
  age_pct_45_to_54_yrs,
  age_pct_55_to_59_yrs,
  age_pct_60_to_64_yrs,
  age_pct_65_to_74_yrs,
  age_pct_76_to_84_yrs,
  age_pct_85_and_older,
  count_level_2_chargers,
  count_dc_fast_chargers )
SELECT 
  ep.population_id_2022,
  dm.zip_demo,
  st.zip_station,
  ep.count,
  dm.edu_less_than_9th_grade,
  dm.edu_9th_to_12th_grade_no_diploma,
  dm.edu_high_school_graduate,
  dm.edu_some_college_no_degree,
  dm.edu_associates_degree,
  dm.edu_bachelors_degree,
  dm.edu_graduate_or_professional_degree,
  dm.median_income,
  dm.race_pct_white_only,
  dm.race_pct_black_affrican_american_only,
  dm.race_pct_native_american_alaska_native_only,
  dm.race_pct_asian_only,
  dm.race_pct_native_hawaiian_pac_islander_only,
  dm.race_pct_some_other_race,
  dm.race_pct_two_or_more_races,
  dm.ethnicity_pct_hispanic_or_latino,
  dm.age_pct_15_to_19_yrs,
  dm.age_pct_20_to_24_yrs,
  dm.age_pct_25_to_34_yrs,
  dm.age_pct_35_to_44_yrs,
  dm.age_pct_45_to_54_yrs,
  dm.age_pct_55_to_59_yrs,
  dm.age_pct_60_to_64_yrs,
  dm.age_pct_65_to_74_yrs,
  dm.age_pct_76_to_84_yrs,
  dm.age_pct_85_and_older,
  COALESCE(sum(st.ev_level2_evse_num), 0),
  COALESCE(sum(st.ev_dc_fast_count), 0)
FROM ev_schema.demographics dm
INNER JOIN ev_schema.ev_stations st
	ON dm.zip_demo = st.zip_station
INNER JOIN ev_population_jul_2022 ep
	ON ep.zipcode = st.zip_station
GROUP BY ep.population_id_2022, st.zip_station, dm.zip_demo, ep.zipcode;

commit;

