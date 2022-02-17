-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/EiljV6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots (.. - without quotes).

CREATE TABLE Voter (
    voter_ID int  NOT NULL ,
    party_Name varchar  NOT NULL ,
     sex varchar   NOT NULL ,
    gender varchar   NOT NULL ,
    age int  NOT NULL ,
    ethnicity varchar   NOT NULL ,
    PRIMARY KEY (
        voter_ID
    )
);

CREATE TABLE location_ID (
    zip int  NOT NULL ,
    PRIMARY KEY (
        zip
    )
);

CREATE TABLE voting_Scores (
    voting_Scores int  NOT NULL ,
    partisan_Score int  NOT NULL ,
    nat_TO int  NOT NULL ,
    partisanship_Score int  NOT NULL 
);

CREATE TABLE civ_Scores (
    civ_KidsINHH int  NOT NULL ,
    civ_Libdeo int  NOT NULL ,
    civ_Marriage int  NOT NULL 
);

