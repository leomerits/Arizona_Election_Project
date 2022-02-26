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

The graph above demonstrates that far and away "Caucasian" and "Uncoded"(meaning unknown) voters have a mean "Voter Scores" most aligned with what has been defined as a Swing Voter. This does not mean that every Caucasion or Uncoded voter are Swing Voters, rather that White voters have the largest range of "Voter Scores" compared to Hispanic, Black, Native American and Asian voters. This is true because Black and Hispanic voters heavily skew towards the Democratic party. If you look at registration numbers, Black and Hispanic voters are registered with the Democratic Party 91 and 67 percent respectively.

![Swing_Party_Sex](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/SwingVoter_Age_Party.PNG)

The graph above illustrates another critical element about Swing Voters in our districts. Over the last 20 years, Arizona politics like National politics has become more and more tribal. If you're a Democrat, you must be registered as a Democrat and vote for Democrats unconditionally and vise versa for Republicans. This graph shows that most Democrats have scores between 66-100 while most Republicans have scores between 0-34, regardless of age. As for Others/Independents, they do in fact fall in between the scores of 35-65, whereas roughly 5 percent of Democrats and Republicans are sprinkled in the Swing Voter scores of 35-65.

![Swing_Age](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Swing%20Voter_Age.png)

The graph above looks at the relationship between number of Swing Voters fall in each age bracket. The "1" is for a "High Chance" Swing Voter and the "0" is for a "Low Chance" Swing Voter. We broke down ages like this because this is how polling and the political industry buckets ages for audience targeting. This graph highlights that voters between ages of 25-54 have the most voters proportional to highly partisan voters. Specifically, voters between 25-44 have the highest proportionality and if you're spending money communicating with Swing Voters, this age group would be the most cost efficient. On the ither side of that, voters over the age of 65 would be the most inefficient. We presume this age disparity of swing voters is likely because as people get older they are more likely to get set in their ways and are harder to persuade or unlikely to change their minds, especially on a topic that invokes such hostility like politics.  

![Swing_Gender](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/SwingVoter_Sex.PNG)

This graph demostrates to us the correlation between gender and Swing Voters. For instance, there is high-density of women clustering between the voter scores of 45 and 55, which is the sweet spot for identifying the most likely Swing Voters. Additionally, this graph also reinforces the prior bar graph with the relationship between age and Swing Voters, particularly that most Swing Voters are below the age of 55.

## Machine Learning Model

Click here to view our code: [Legislative_Districts_Machine_Learning](https://github.com/leomerits/Arizona_Election_Project/blob/Franklin/Machine_learning/District13_ML_logisticregresion.ipynb)


- Prelinimary data: As described above, our preliminary raw file was provided by the Arizona democratic party and it contained 95 columns, many of which contained nan or null values. Before feeding our machinve learning model we agreed to drop most of the columns for analysis from the start. We encountered an issue with our target column as the column began as a "Voter Score" ranging between scores of 0 to 100. As mentioned, we converted this column into the "Swing Voter" column. The Voter Score model is as follows:
      
      - A Swing Voter is defined as a voter with a score between 35-65. The closer the score is to 50 the more likely they are to be a truly independent voter with a willingness to vote for both parties. 
      - For scores between 0-34, the voter is likely to vote strictly Republican. The lower the score then the more partisan the voter is for Republican candidates/issues. 
      - For scores between 66-100, the voter is likely to vote strictly Democratic. The higher the score then the more partisan the voter is for Democratic candidates/issues. 
      - This Voter Score system derives from a sophisticated and robust model developed with proprietary, commercial, behavioral and public data by data analytics organizations such as TargetSmart, Catalist Institute and Analyst Instiute.
  
- Preliminary features: Our inital features were selected after we dropped most of our non-benficial columns cointaining scores and data from previous years going back to 2016. All scores were products of other models developed outside of our project. They had different paramaters with different objectives and from which a place we did not have access to the raw data. Therefore, we decided to drop all redundant columns, and score based columns that had differen objectives than our project and, if included, would dramatically disrupt our models efficacy. Our features were selected through weekly scheduled team zoom meetings, where we engaged in rigorous debate around the relevance and impact of each prospective feature. Furthermore, we ran numerous analyses with our intitial DataFrame to determine how voters were distributed by features such as Party, Sex, Ethnicity, Age, Turnout Scores, Zip Code and whether these voters had kids in their household. In additon to this, we also ran correlation analyses to see where features and our target had any noteworthy relationships, which is graphed above. In doing so, this exploratory data analysis was critical in building the structures of our maching learning models. And lastly, we ended up dropping the Voter ID column due to it being an unique number for each seperate data point.

- Trainging and testing: For our training and testing data we also came into another issue and that was that we had object or quantitive data. We use get.dummies method to convert all of our features into numerical. Our target column was also converted by using a condition that would change our score between 35%-65% to Low-Chance and High-chance. We used a random state of 1 stratify= Y we used the default setting of the linear regression model to pick how many samples were to be used for training and for testing. We did intended to play with the n_estimators but it provided very little change in our model scores.

- Modle Choice: We run several ML models to see which model will give us the best f1 score- since f1 score is the harmonic mean between precission and recall. Our team however cares more about the recall since we want to be able to advertise not only those who fall within the split ticker range but anyone who might be close to that range. At the end it seem Like a logistic regresion model using undersampling gave us a good satisfactory scores. Undersampling was required since the number of our target points was unmbalance.

Click here to view where we ran 5-6 different supervised and unsupervised machine learning models: [Supervised_Exhaustion](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Legislative_Districts_MachineLearning.ipynb) | [More_Supervised](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Logistic_Regression_LD4.ipynb) | [Deep_Learning](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Deep_Learning_Neural_Network_LD4.ipynb) | [Unsupervised_K-Means](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/KMeans_Clusters_withPCA_LD4.ipynb)

## Communication Protocal

-	In case of emergency, we all have each other’s cell number.
-	The team communication consists of communicating daily over our Getz_Team Slack channel. In addition to that, we have been meeting over Zoom multiple times (at least four times a week including the Mondays and Wednesdays classes) Also, we have been meeting in teams of twos when needed, for instance Franklin and Darlington, Franklin and Raymond, Franklin and Josh had met in few other times besides the normal scheduled times. 

## DataBase Images:
Primary Key set up:

<img width="368" alt="primarykeysetup" src="https://user-images.githubusercontent.com/90356052/155256559-45425e66-2731-456b-8b72-e818b75eeadf.png">

two table set up:

<img width="502" alt="Screen Shot 2022-02-22 at 8 21 52 PM" src="https://user-images.githubusercontent.com/90356052/155256860-f0ba399b-bd93-46a3-bb7b-8ead06c1bf7b.png">

diagram table:

<img width="502" alt="Screen Shot 2022-02-22 at 8 41 03 PM" src="https://user-images.githubusercontent.com/90356052/155258235-f26c9261-5172-411c-be7b-97cb34f15d45.png">

## Conclusion

### Assumptions

If you analyze the Arizona election studies and exit poll data over the last three election cycles of 2016, 2018 and 2020, regardless of what party won the state that cycle, the victor won by less than 4 points. This is what determines Arizona a battleground state, maning each party has a near equal shot at winning this state - and this translates to the elections held at our legislative level. Given it is this close, whatever party persuades these so called Swing Voters, then that party will win the State, as well as take majority control over the legislature. These studies and polling data have perpetuated that these Swing Voters mostly made up of college-educated women over the age of 35, are registered Republican and reside entirely in Maricopa County suburbs. Having said that, these studies and exit polling do not employ scientify rigorous methodologies. Additionally, with American politics becoming more hyper-partisan and polarized over the last twenty years, the so-called Swing Voter voting bloc has shrunk to half of what it was at the start of the 21st Century. All this led to pose the question of "are we able to create an effective machine learning model that identifies Swing Voters in four of Arizona's competitive legislative districs?" "And if so, does our model and analyses reinforce the assumptions of Swing Voter attributes or does it counter the assumptions?" Should we be able to not only predict Swing Voters with our model and the most importatn features in doing so, then this project would be significantly beneficial to both the Republican or Democratic parties. The same Swing Voters we are seeking to identify in these legislative districts, are also the ones needed to win statewide by Presidential, Gubernatorial and the 4 other statewide candidates.

### Findings

Our Arizona Election Project found

### Challenges

## Google Slides

Click here for initial draft of Google Slides draft of presentation (Please note this is an early, early draft): [Dashboard mockup](https://docs.google.com/presentation/d/1niBqt4rMpW65NBb7cFWH2UJPZE_gq36iIZQ91IrVoC0/edit#slide=id.g1147b030573_0_1) | [Draft Presentation](https://docs.google.com/presentation/d/1kg2Wtakuq2NBjBmaiVa10OS5loL1bqqo6kbOCEo29Kk/edit#slide=id.p)
 
