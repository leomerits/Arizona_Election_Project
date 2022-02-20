# Arizona_Election_Project

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



## Communication Protocal

 - In case of emergency, contact Josh
 - The team communication will consist of communicating daily over our Getz_Team Slack channel. Additionally, we will meet over Zoom four times a week including the Monday and Wednesday classes.
 - 
