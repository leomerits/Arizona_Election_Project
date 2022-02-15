-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/EiljV6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Voter" (
    "voterID" int   NOT NULL,
    "partyName" string   NOT NULL,
    "sex" string   NOT NULL,
    "age" int   NOT NULL,
    "ethnicity" string   NOT NULL,
    CONSTRAINT "pk_Voter" PRIMARY KEY (
        "voterID"
     )
);

CREATE TABLE "InformationID" (
    "zip" int   NOT NULL,
    "voterID" int   NOT NULL
);

CREATE TABLE "votingScores" (
    "votingScores" int   NOT NULL,
    "partisanScore" int   NOT NULL,
    "natTO" int   NOT NULL,
    "partisanshipScore" int   NOT NULL,
    "voterID" int   NOT NULL
);

CREATE TABLE "civScores" (
    "civScores" int   NOT NULL,
    "civKidsINHH" int   NOT NULL,
    "civLibdeo" int   NOT NULL,
    "civMarriage" int   NOT NULL,
    "voterID" int   NOT NULL
);

ALTER TABLE "InformationID" ADD CONSTRAINT "fk_InformationID_voterID" FOREIGN KEY("voterID")
REFERENCES "Voter" ("voterID");

ALTER TABLE "votingScores" ADD CONSTRAINT "fk_votingScores_voterID" FOREIGN KEY("voterID")
REFERENCES "Voter" ("voterID");

ALTER TABLE "civScores" ADD CONSTRAINT "fk_civScores_voterID" FOREIGN KEY("voterID")
REFERENCES "Voter" ("voterID");

