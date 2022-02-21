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
# Machine Learning model
- Prelinimary data: As describe above our preliminary raw file was provided by the Arizona democratic party and it contain 95 columns many which contain nan or null values. Before feeding our machinve learning model we agree to drop most of the columns for analysis from the start. We encounter an issue with our target column which was a range from 1 to 100 in percentages. this score is the likely hood of a voter being a split ticket voter. Fortounely we had access to what the score means, the score calculate the level of support towards the democratic party. The closer the score to 100 the more likely to vote democratic, on the opposite sepctrum the closer to 0 the more likely to vote only republican or other. After discussing with this team just by simple observation, we came to a assumption: "a score between 40% to 60% seem to be the range where voters are more likely to be split ticket voters. 
- Preliminary features: Our inital features were selected based after we drop most of our columns which cointain scores and data from previous years going back since 2016. All scores where product of other models run outside our project with different paramaters that we had no access to. Therefore we decided to drop all repeating columns, and score columns believing that feeding our model prediction scores from other models could errosnously create predictions in our model. Our features selections where mostly based on team communication, and also by running analyzis showing for example the represntation of each party in the district, gender and score and any correlations. Some of the columns that we end up droping where Voter ID since it is an individual number for each seperate data point.
- Trainging and testing: For our training and testing data we also came into another issue and that was that we had object or quantitive data. We use get.dummies method to convert all of our features into numerical. Our target column was also converted by using a condition that would change our score between 40%-60% to Low-Chance and High-chance. We used a random state of 1 stratify= Y we used the default setting of the linear regression model to pick how many samples were to be used for training and for testing. We did intended to play with the n_estimators but it provided very little change in our model scores.
- Modle Choice: We run several ML models to see which model will give us the best f1 score- since f1 score is the harmonic mean between precission and recall. Our team however cares more about the recall since we want to be able to advertise not only those who fall within the split ticker range but anyone who might be close to that range. At the end it seem Like a logistic regresion model using undersampling gave us a good satisfactory scores. Undersampling was required since the number of our target points was unmbalance.
- 
## Communication Protocol.
-	Incase of emergency, we all have each other’s cell number.
-	The team communication consists of communicating daily over our Getz_Team Slack channel. In addition to that we have been meeting over Zoom multiple times (at least four times a week including the Mondays and Wednesdays classes) Also, we have been meeting in teams of twos when needed, for instance Franklin and Darlington, Franklin and Raymond, Franklin and Josh had met in few other times besides the normal scheduled times. 

