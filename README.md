# Arizona_Election_Project

# Outline of the Project
-	What is our Topic
-	Why we selected our topic
-	We started with describing our Data Source (which was from the Arizona Democratic Party)
-	Questions We Hope To answer 
-	Description of our Data Exploration: We cleaned and saved our datasets in multiple ways to fit different types of ML that we applied to our Datasets. And we also transferred and saved the tables to our pgAdmin Database from where we imported them for analysis.
-	Data Analysis: We performed several ML so as to get a better result as was shown on the python notebooks we have.

## Selected Topic

The GETZ group project will be executing an analysis of Arizona's four politically competitive legislative districts. We define "politically competitive" as districts where both Democrats and Republicans have a virtually equal shot at winning the race. We picked the four competitive legislative as our topic given that is where most of both parties resources will be invested on a state level this election and as a result, where our predictive model will have the most impact on Arizona's democracy. In the ballpark of 120,000 registered voters consising of Republicans, Democrats and Independents reside in each of the four districts.

## Why We Selected This Topic

First and foremost, we want to find a way to participate in our democracy, and furthermore, we hope we can have an impact on our local elections. The four districts we have chosen to analyze are the districts that will decide which party controls the agenda of the Arizona legislature.

Secondly, we find voter behavior interesting. According to numerous recent election studies, the American electorate has become hyper-partisan. This means that over the last 20 years voters are becoming more and more hardened in their support of their own party, and equally important, grown more and more negative towards the opposing party. In short, Democratic voters are much less likely to vote for a Republican candidate and vice versa - regardless of the candidate, policies and/or the economic climate. This, in conjunction, with Arizona's emergence on the national political stage over the last 4 years as battleground state, entices us to learn more about Arizona voters. In fact, the voters in these four competitive districts are also the voters that decide which presidential candidate wins in Arizona and therefore plays an inctrumental role which party resides in the White House. 

## Description of Our Data Sources

The primary data source for this project will be the proprietary statewide voter file provided from the Arizona Democratic Party. While the access to this data is from by a partisan organization, the data itself is neutral. As mentioned, each district consists of 120,000 registered voters. Thus, our model will be compiled of roughly 720,000 rows of data. The initial database will have the following columns: 

 - Voter registration ID
 - Voter ID 
 - First and last name
 - Address
 - City
 - County
 - Zip Code
 - Phone number (75% of voters provide this)
 - Political Party
 - Legislative District
 - Congressional District
 - Gender
 - Age
 - Ethnicity/Race
 - Voting History
 - Partisan Score (each voter scored on the degree with which they will vote for their own party)
 - Turnout Score (likelihood of voting)
 - Kids in Household (whether they have kids in their house)
 - Liberal Ideology (how ideological or pragmatic each voter is in their support of Liberal issues)

## Questions We Hope To Answer

In the execution of this project and our machine learning models, we hope to answer the following questions:

 - We hope to determine and classify which voters in each district are likely to be a split-ticket voter or so-called "Swing Voter". We are defining a Swing Voter as a voter that is registered as a Democrat, Republican or Other (Independent) that is likely to vote for both parties across their ballot. For example, a Swing Voter could be defined as a registered Republican that votes for a Democratic presidential candidate but votes for Republican congressional and state legislative candidates. In doing so, we will apply a binary classification predictive model with logistic regression.
 - We also hope to predict which voters of each of the four districts are likely to turn out in the 2022 election. We would likely do this as well with employing a binary classification predictive model with logistic regression. On another level, we hope to predict the likely percentage of voters in each district and the demographic composition to turnout in the 2022 election. 

## Description of Data Exploration

Click here for data exploration, preprocessing and transformation: [Cells 1-15](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Logistic_Regression_LD4.ipynb)

In acquiring the proprietary voter data, we linked up our voter tables with a db_string connection. Firstly, we identified the columns that are either irrelevant or non-benifical to answering our Swing Voter question. Therefore, we dropped these columns in the vetting and cleaning stage of the DataFrame:

  - First and last name
  - Address, City and County
  - Congressional and legislative district (We are doing our analysis and ML by leg district so there was no benefit leaving these columns in)
  - Phone Number

Thereafter we converted some dtypes from "Float64" to "Int" and removing all NaN or Null values. Additionally, we simplified the header name of "Partisan Score" to "Voter Score" so it would clear to our audience what this is and how we are using, which will be addressed shortly.

![Initial DataFrame](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Initial_DataFrame.PNG)


Given our objective of idenitying Swing Voters via machine learning and what features are most important and precitive in doing so, we had to identify and define Swing Voters. To that end, we used the "Voter Score" model of scoring Republican, Other(Independent) and Democrative voters between 0-100. Voters that are scored between 0-34 are highly likely to vote Republican with the lower the score the more likely they are to do so. On the other end, voters scoring between 66 and 100 are more likely to vote Democratic, again with the higher the score the increase in likelihood. And for voters that score between 35-65, they are likely to vote for both parties candidates, regardless of what party they are registered with. In this case, the closer they are to the score 50 the more liely they are a truly Independent or Swing Voter. To do our exploratory analysis, we created a list of conditions to assign each voter a new value based on the "Voter Score." Subsequently, we created a new "Swing Voter" column and assigned a "Low_Chance" and "High-Chance" value to each voter and moving forward drop the "Voter Score" column. 

![Conditions_SwingVoter](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Conditions_Create_SwingVoter.PNG)

![Chance_Values](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/HighLowChance_Values.PNG)

## Data Analysis

We installed Lux to help us with some of our exploratory data analysis and create data visializations. To do so, we had to "pip install" on our terminal "Alstair, Matplotlib (already did) and Scipy." Additonally, we had to activate the jupyter extension to run on Jupyter Notebook with the following code: "jupyter nbextension install --py luxwidget jupyter nbextension enable --py luxwidget." We then ran some specific queries with key features and targets to create some visualizations of correlations, distributions and occurrence graphs in our districts.

![Lux_Code](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Lux_Code.PNG)


As a result, we learned a great deal about voters in our district, especially which features play an instrumental role in making up a Swing Voter.

![Mean_Ethnicity_Swing](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Mean_SwingVoterScore_Ethnicity.PNG)

The graph above demonstrates that far and away "Caucasion" and "Uncoded"(meaning unknown) voters have a mean "Voter Scores" most aligned with what has been defined as a Swing Voter. This does not mean that every Caucasion or Uncoded voter are Swing Voters, rather that White voters have the largest range of "Voter Scores" compared to Hispanic, Black, Native American and Asian voters. This is true because Black and Hispanic voters heavily skew towards the Democratic party. If you look at registration numbers, Black and Hispanic voters are registered with the Democratic Party 91 and 67 percent respectively.

![Swing_Party_Sex](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/SwingVoter_Age_Party.PNG)

The graph above illustrates another critical element about Swing Voters in our districts. Over the last 20 years, Arizona politics like National politics has become more and more tribal. If you're a Democrat, you must be registered as a Democrat and vote for Democrats unconditionally and vise versa for Republicans. This graph shows that most Democrats have scores between 66-100 while most Republicans have scores between 0-34, regardless of age. As for Others/Independents, they do in fact fall in between the scores of 35-65, whereas roughly 5 percent of Democrats and Republicans are sprinkled in the Swing Voter scores of 35-65.

![Swing_Age](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Swing%20Voter_Age.png)

This graph above looks at the relationship between number of Swing Voters fall in each age bracket. The "1" is for a "High Chance" Swing Voter and the "0" is for a "Low Chance" Swing Voter. We broke down ages like this because this is how polling and the political industry buckets ages for audience targeting. This graph highlights that voters between ages of 25-54 have the most voters proportional to highly partisan voters. Specifically, voters between 25-44 have the highest proportionality and if you're spending money communicating with Swing Voters, this age group would be the most cost efficient. On the ither side of that, voters over the age of 65 would be the most inefficient. We presume this age disparity of Swing Voters is likely because as people get older they are more likely to get set in their ways and are harder to persuad or unlikely to change their minds, especially on a topic that invokes such hostility like Politics.   

# Machine Learning model
- Prelinimary data: As describe above our preliminary raw file was provided by the Arizona democratic party and it contain 95 columns many which contain nan or null values. Before feeding our machinve learning model we agree to drop most of the columns for analysis from the start. We encounter an issue with our target column which was a range from 1 to 100 in percentages. this score is the likely hood of a voter being a split ticket voter. Fortounely we had access to what the score means, the score calculate the level of support towards the democratic party. The closer the score to 100 the more likely to vote democratic, on the opposite sepctrum the closer to 0 the more likely to vote only republican or other. After discussing with this team just by simple observation, we came to a assumption: "a score between 40% to 60% seem to be the range where voters are more likely to be split ticket voters. 
- Preliminary features: Our inital features were selected based after we drop most of our columns which cointain scores and data from previous years going back since 2016. All scores where product of other models run outside our project with different paramaters that we had no access to. Therefore we decided to drop all repeating columns, and score columns believing that feeding our model prediction scores from other models could errosnously create predictions in our model. Our features selections where mostly based on team communication, and also by running analyzis showing for example the represntation of each party in the district, gender and score and any correlations. Some of the columns that we end up droping where Voter ID since it is an individual number for each seperate data point.
- Trainging and testing: For our training and testing data we also came into another issue and that was that we had object or quantitive data. We use get.dummies method to convert all of our features into numerical. Our target column was also converted by using a condition that would change our score between 40%-60% to Low-Chance and High-chance. We used a random state of 1 stratify= Y we used the default setting of the linear regression model to pick how many samples were to be used for training and for testing. We did intended to play with the n_estimators but it provided very little change in our model scores.
- Modle Choice: We run several ML models to see which model will give us the best f1 score- since f1 score is the harmonic mean between precission and recall. Our team however cares more about the recall since we want to be able to advertise not only those who fall within the split ticker range but anyone who might be close to that range. At the end it seem Like a logistic regresion model using undersampling gave us a good satisfactory scores. Undersampling was required since the number of our target points was unmbalance.

## Communication Protocal

-	Incase of emergency, we all have each other’s cell number.
-	The team communication consists of communicating daily over our Getz_Team Slack channel. In addition to that we have been meeting over Zoom multiple times (at least four times a week including the Mondays and Wednesdays classes) Also, we have been meeting in teams of twos when needed, for instance Franklin and Darlington, Franklin and Raymond, Franklin and Josh had met in few other times besides the normal scheduled times. 

