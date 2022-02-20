# Arizona_Election_Project

# Outline of the Project
-	What is our Topic
-	Why we selected our topic
-	We started with describing our Data Source (which was from the Arizona Democratic Party)
-	Questions We Hope To answer 
-	Description of our Data Exploration: We cleaned and saved our datasets in multiple ways to fit different types of ML that we applied to our Datasets. And we also transferred and saved the tables to our pgAdmin Database from where we imported them for analysis.
-	Data Analysis: We performed several ML so as to get a better result as was shown on the python notebooks we have.


## Selected Topic

The GETZ group project will be executing an analysis of Arizona's six politically competitive legislative districts. We define "politically competitive" as districts where both Democrats and Republicans have a virtually equal shot at winning the race. We picked the six competitive legislative as our topic given that is where most of both parties resources will be invested on a state level this election and as a result, where our predictive model will have the most impact on Arizona's democracy. In the ballpark of 120,000 registered voters consisting of Republicans, Democrats and Independents reside in each of the six districts.

## Why We Selected This Topic

First and foremost, we want to find a way to participate in our democracy, and furthermore, we hope we can have an impact on our local elections. The six districts we have chosen to analyze are the districts that will decide which party controls the agenda of the Arizona legislature.

Secondly, we find voter behavior interesting. According to numerous recent election studies, the American electorate has become hyper-partisan. This means that over the last 20 years voters are becoming more and more hardened in their support of their own party, and equally important, grown more and more negative towards the opposing party. In short, Democratic voters are much less likely to vote for a Republican candidate and vice versa - regardless of the candidate, policies and/or the economic climate. This, in conjunction, with Arizona's emergence on the national political stage over the last 4 years as battleground state, entices us to learn more about Arizona voters. In fact, the voters in these six competitive districts are also the voters that decide which presidential candidate wins in Arizona and therefore plays an inctrumental role which party resides in the White House. 

## Description of Our Data Sources

The primary data source for this project will be the proprietary statewide voter file provided from the Arizona Democratic Party. While the access to this data is from by a partisan organization, the data itself is neutral. As mentioned, each district consists of 120,000 registered voters. Thus, our model will be compiled of roughly 720,000 rows of data. The initial database will have the following columns: 

 - Voter registration ID
 - First and last name
 - Address
 - City
 - County
 - Zip Code
 - Phone number (75% of voters provide this)
 - Party Affiliation
 - Legislative District
 - Congressional District
 - Gender
 - Birth Date
 - Age
 - Ethnicity/Race
 - Voting History
 - Partisan Score (the likelihood to vote for their own party)
 - Turnout Score

## Questions We Hope To Answer

In the execution of this project and our machine learning models, we hope to answer the following questions:

 - We hope to determine and classify which voters in each district are likely to be a split-ticket voters. In doing so, we would apply a binary classification predictive model with logistic regression.
 - We also hope to predict which voters of each of the six districts are likely to turn out in the 2022 election. We would likely do this as well with employing a binary classification predictive model with logistic regression. On another level, we hope to predict the likely percentage of voters in each district and the demographic composition to turnout in the 2022 election. 
 
