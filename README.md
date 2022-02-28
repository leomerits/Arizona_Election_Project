# Arizona_Election_Project

# Outline of the Project
-	What is our Topic
-	Why we selected our topic
-	We started with describing our Data Source (which was from the Arizona Democratic Party)
-	Questions We Hope To answer 
-	Description of our Data Exploration: We cleaned and saved our datasets in multiple ways to fit different types of ML that we applied to our Datasets. And we also transferred and saved the tables to our pgAdmin Database from where we imported them for analysis.
-	Data Analysis: We performed several ML so as to get a better result as was shown on the python notebooks we have.

## Communication Protocal

-	In case of emergency, we all have each other’s cell number.
-	The team communication consists of communicating daily over our Getz_Team Slack channel. In addition to that, we have been meeting over Zoom multiple times (at least four times a week including the Mondays and Wednesdays classes) Also, we have been meeting in teams of twos when needed, for instance Franklin and Darlington, Franklin and Raymond, Franklin and Josh had met in few other times besides the normal scheduled times. 

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

 - In Arizona, it is assumed in today's current political climate that most Swing Voters are college-educated Republican women residing in the suburbs of Maricopa County. We hope to determine and idenitfy which voters in each district are likely to be so-called "Swing Voters". We are defining a Swing Voter as a voter, regardless of party registration, that has a history and willingness to vote for candidates from both the Republican and Democratic parties. For example, a Swing Voter could be defined as a registered Republican that votes for a Democratic presidential candidate but votes for Republican congressional and state legislative candidates. In doing so, we will employ various supervised and unspervised machine learning models that can do this with the highest precision, recall, sensitivity and/or accuracy.
 - Additionally, we hope to identify which demographical and geographical attributes make up a Swing Voter in Arizona and, in particularly, which of those features are the most predictive. We also hope to reinforce or counter the Swing Voter assumptions above with exploratory data analysis and various machine learning techniques. Given the elevated status of Arizona on the national stage and how much political money is being injected here, engaging in deeper analysis and learning of Arizona Swing Voters would greatly benefit political campaigns across the state. 

## Description of Data Exploration

### DataBase Images:
We created our Databse using Pgadmin PostgreSQL 11 by first importing our raw data csv files into our code in jupyter notebook. This could help us clean and merge our 4 districts into one and finally exporting the new dataset to our dataframe. 

![Creating our tables code](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/Initial_DataFrame.PNG)

Primary Key set up:

<img width="368" alt="primarykeysetup" src="https://user-images.githubusercontent.com/90356052/155256559-45425e66-2731-456b-8b72-e818b75eeadf.png">

two table set up:

<img width="502" alt="Screen Shot 2022-02-22 at 8 21 52 PM" src="https://user-images.githubusercontent.com/90356052/155256860-f0ba399b-bd93-46a3-bb7b-8ead06c1bf7b.png">

diagram table:

<img width="502" alt="Screen Shot 2022-02-22 at 8 41 03 PM" src="https://user-images.githubusercontent.com/90356052/155258235-f26c9261-5172-411c-be7b-97cb34f15d45.png">

Click here for data exploration, preprocessing and transformation: [Cells 1-15](https://github.com/leomerits/Arizona_Election_Project/blob/main/DRAFTS/Logistic_Regression_LD4.ipynb)

In acquiring the proprietary voter data, we linked up our voter tables with a db_string connection. Firstly, we identified the columns that are either irrelevant or non-benifical to answering our Swing Voter question. Therefore, we dropped these columns in the vetting and cleaning stage of the DataFrame:

  - First and last name
  - Address, City and County
  - Congressional and legislative district (We are doing our analysis and ML by leg district so there was no benefit leaving these columns in)
  - Phone Number

Thereafter we converted some dtypes from "Float64" to "Int" and removing all NaN or Null values. Additionally, we simplified the header name of "Partisan Score" to "Voter Score" so it would clear to our audience what this is and how we are using, which will be addressed shortly.

![Initial DataFrame](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/Initial_DataFrame.PNG)


Given our objective of idenitying Swing Voters via machine learning and what features are most important and precitive in doing so, we had to identify and define Swing Voters. To that end, we used the "Voter Score" model of scoring Republican, Other(Independent) and Democrative voters between 0-100. Voters that are scored between 0-34 are highly likely to vote Republican with the lower the score the more likely they are to do so. On the other end, voters scoring between 66 and 100 are more likely to vote Democratic, again with the higher the score the increase in likelihood. And for voters that score between 35-65, they are likely to vote for both parties candidates, regardless of what party they are registered with. In this case, the closer they are to the score 50 the more liely they are a truly Independent or Swing Voter. To do our exploratory analysis, we created a list of conditions to assign each voter a new value based on the "Voter Score." Subsequently, we created a new "Swing Voter" column and assigned a "Low_Chance" and "High-Chance" value to each voter and moving forward drop the "Voter Score" column. 

![Conditions_SwingVoter](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/Conditions_Create_SwingVoter.PNG)

![Chance_Values](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/HighLowChance_Values.PNG)

## Data Analysis

We installed Lux to help us with some of our exploratory data analysis and create data visializations. To do so, we had to "pip install" on our terminal "Alstair, Matplotlib (already did) and Scipy." Additonally, we had to activate the jupyter extension to run on Jupyter Notebook with the following code: "jupyter nbextension install --py luxwidget jupyter nbextension enable --py luxwidget." We then ran some specific queries with key features and targets to create some visualizations of correlations, distributions and occurrence graphs in our districts.

![Lux_Code](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/Lux_Code.PNG)


As a result, we learned a great deal about voters in our district, especially which features play an instrumental role in making up a Swing Voter.

![Mean_Ethnicity_Swing](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/Mean_SwingVoterScore_Ethnicity.PNG)

The graph above demonstrates that far and away "Caucasian" and "Uncoded"(meaning unknown) voters have a mean "Voter Scores" most aligned with what has been defined as a Swing Voter. This does not mean that every Caucasion or Uncoded voter are Swing Voters, rather that White voters have the largest range of "Voter Scores" compared to Hispanic, Black, Native American and Asian voters. This is true because Black and Hispanic voters heavily skew towards the Democratic party. If you look at registration numbers, Black and Hispanic voters are registered with the Democratic Party 91 and 67 percent respectively.

![Swing_Party_Sex](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/SwingVoter_Age_Party.PNG)

The graph above illustrates another critical element about Swing Voters in our districts. Over the last 20 years, Arizona politics like National politics has become more and more tribal. If you're a Democrat, you must be registered as a Democrat and vote for Democrats unconditionally and vise versa for Republicans. This graph shows that most Democrats have scores between 66-100 while most Republicans have scores between 0-34, regardless of age. As for Others/Independents, they do in fact fall in between the scores of 35-65, whereas roughly 5 percent of Democrats and Republicans are sprinkled in the Swing Voter scores of 35-65.

![Swing_Age](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/Swing%20Voter_Age.png)

The graph above looks at the relationship between number of Swing Voters fall in each age bracket. The "1" is for a "High Chance" Swing Voter and the "0" is for a "Low Chance" Swing Voter. We broke down ages like this because this is how polling and the political industry buckets ages for audience targeting. This graph highlights that voters between ages of 25-54 have the most voters proportional to highly partisan voters. Specifically, voters between 25-44 have the highest proportionality and if you're spending money communicating with Swing Voters, this age group would be the most cost efficient. On the ither side of that, voters over the age of 65 would be the most inefficient. We presume this age disparity of swing voters is likely because as people get older they are more likely to get set in their ways and are harder to persuade or unlikely to change their minds, especially on a topic that invokes such hostility like politics.  

![Swing_Gender](https://github.com/leomerits/Arizona_Election_Project/blob/main/IMAGES/SwingVoter_Sex.PNG)

This graph demostrates to us the correlation between gender and Swing Voters. For instance, there is high-density of women clustering between the voter scores of 45 and 55, which is the sweet spot for identifying the most likely Swing Voters. Additionally, this graph also reinforces the prior bar graph with the relationship between age and Swing Voters, particularly that most Swing Voters are below the age of 55.

## Machine Learning Model

Click here to view our code: [Legislative_Districts_Machine_Learning](https://github.com/leomerits/Arizona_Election_Project/blob/Franklin/Machine_learning/District13_ML_logisticregresion.ipynb)


- **Prelinimary Data:** As described above, our preliminary raw file was provided by the Arizona democratic party and it contained 95 columns, many of which contained nan or null values. Before feeding our machinve learning model we agreed to drop most of the columns for analysis from the start. We encountered an issue with our target column as the column began as a "Voter Score" ranging between scores of 0 to 100. As mentioned, we converted this column into the "Swing Voter" column. The Voter Score model is as follows:
      
      - A Swing Voter is defined as a voter with a score between 35-65. The closer the score is to 50 the more likely they are to be a truly independent voter with a willingness to vote for both parties. 
      - For scores between 0-34, the voter is likely to vote strictly Republican. The lower the score then the more partisan the voter is for Republican candidates/issues. 
      - For scores between 66-100, the voter is likely to vote strictly Democratic. The higher the score then the more partisan the voter is for Democratic candidates/issues. 
      - This Voter Score system derives from a sophisticated and robust model developed with proprietary, commercial, behavioral and public data by data analytics organizations such as TargetSmart, Catalist Institute and Analyst Instiute.
  
- **Preliminary features:** Our inital features were selected after we dropped most of our non-benficial columns cointaining scores and data from previous years going back to 2016. All scores were products of other models developed outside of our project. They had different paramaters with different objectives and from which a place we did not have access to the raw data. Therefore, we decided to drop all redundant columns, and score based columns that had differen objectives than our project and, if included, would dramatically disrupt our models efficacy. Our features were selected through weekly scheduled team zoom meetings, where we engaged in rigorous debate around the relevance and impact of each prospective feature. Furthermore, we ran numerous analyses with our intitial DataFrame to determine how voters were distributed by features such as Party, Sex, Ethnicity, Age, Turnout Scores, Zip Code and whether these voters had kids in their household. In additon to this, we also ran correlation analyses to see where features and our target had any noteworthy relationships, which is graphed above. In doing so, this exploratory data analysis was critical in building the structures of our maching learning models. And lastly, we ended up dropping the Voter ID column due to it being an unique number for each seperate data point.

- **Trainging and Testing:** For our training and testing data, we also encountered another issue of much of our dating being an 'object' or categorical data. We used the get.dummies method to convert all of our features into numerical values. Our target column was also converted with a set of condition and values that changed our scores between 35-65 to having a "High_Chance" of being a Swing Voter, whereas all other scores were deemed a "Low_Chance" of being s Swing Voter. We used a "random state of 1, stratify= y" for the the Logisitic Regression Model and used its default setting to pick how many samples were to be used for training and testing. We did in fact play with the "n_estimators" amount but found it to be of no consequence on our model scores.

- **Model Choice:** We ran 7 different ML models to see which model will give us the best f1 score given the f1 score is the harmonic mean between precision and recall. Our team however cares more about the recall score because campaign's will want to communicate with those voters that fall within that Swing Voter score range of 35-65 - and any voter who might be close to that range. In the end, employing a Logistic Regression Model with an undersampling that shrinks the majority sample of non-Swing Voters down to a similar sample size of Swing Voters. Undersampling was required since the number of our target points were significantly unbalanced. This technique produced robust Recall (REC) and Specificity (SPE) scores of 76 and 78 percent respectively. The combination of these "True Positive Rate" and "True Negative Rate" is the best way to move forward in identifying Swing Voters in Arizona. After discussing this thoroughly with the team, the decision was made towards the end of segment two after exhausting 7 different ML models and even more optimizations.

- **Current Model Results:** Our current model accuracy is 77 percent. As we understand Accuracy, it is the model's ability to predict how many have a High Chance or Low Chance of being a Swing Voter. Since we are trying to predict the possibility of someone being a Swing Voter, we ended up focusing more on recall (TP), specificity (TN) and f1 (Pre/Rec) score rather than accurary or precision. The results of our Classification Report are as follows:

<img width="564" alt="Screen Shot 2022-02-26 at 7 47 35 PM" src="https://user-images.githubusercontent.com/90356052/155866157-0713a2af-84b6-4057-af88-fb0d66d8ecae.png">


Click here to view where we ran 7 different supervised and unsupervised machine learning models: [Supervised_Exhaustion](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Legislative_Districts_MachineLearning.ipynb) | [More_Supervised](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Logistic_Regression_LD4.ipynb) | [Deep_Learning](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/Deep_Learning_Neural_Network_LD4.ipynb) | [Unsupervised_K-Means](https://github.com/leomerits/Arizona_Election_Project/blob/Josh/KMeans_Clusters_withPCA_LD4.ipynb)


## Conclusion

### Assumptions

If you analyze the Arizona election studies and exit poll data over the last three elections, regardless of what party won the state that cycle, the victor won by less than 4 points. This is what classifies Arizona a battleground state. A battleground state is a state where each party has a virtual equal shot at winning the state. This also translates to the elections held at the legislative level. Given it is this close, whatever party persuades these Swing Voters, then that party will likely win the State, as well as take control over the legislature. These studies and polling data have pushed the narrative that Arizona Swing Voters are mostly made up of college-educated Republican white women between the ages of 35 and 44 and reside entirely in Maricopa County suburbs. That said, these studies and exit polling do not always employ rigorous scientific methodologies. Additionally, as the American electorate becomes hyper-partisan and more polarized each year, the Swing Voter population has shrunk in half of what it was at the start of the 21st Century. 

All this led us to pose the question of "Are we able to create a sound machine learning model that identifies Swing Voters in four of Arizona's competitive legislative districs?" "And if so, does our model and analyses reinforce or counter the assumptions of what makes-up a Swing Voter demographically and geograhically?" Should we be able to not only predict Swing Voters with our model and identify the most important features in so doing, then this project would be significantly beneficial to both the campaigns of the Republican and Democratic parties. The same Swing Voters we are seeking to identify in these legislative districts, are also the ones needed to win statewide by Presidential, Gubernatorial and other statewide campaigns.

### Findings

As we engaged in data analysis and machine learning models with the voters of the four competitive legislative districts, we learned a great deal about Swing Voters in Arizona. In fact, some analyses reasserted the assumptions established at the start of our project. The findings are as follows:

   - The consensus that most Swing Voters are women is simply not the case. When we analyzed the distribution of Swing Voters across four districts, we found that women consisted of 51 percent of total Swing Voters, whereas men made up 49 percent. While there are technically more women Swing Voters, the difference is quite marginal.
   -  The second assumption was that most of these women were between the ages of 35 and 44. A considerable number of Swing Voters were in fact between the ages of 35 and 44, but there is an equal number of Swing Voters between the ages of 25-34, as well as Swing Voters above the age of 45 years. If we were advising a campaign on how they should spend their voter communication resources and age was used to build their audience, then we would recommend targeting both sexes between the age of 25 and 64. In terms of raw count, there are many Swing Voters above the age of 65 but we also found that group to have the largest disparity between Swing Voters and non-Swing Voters. From a cost-efficiency perspective, communicating with the 65+ age group is the most inefficient. We suspect there are the least Swing Voters to total voters older than 65, is because as voters get older, they get more set in their ways and theerefore are more restitant to political persuasion.
   -  Thirdly, the notion that campaigns must focus on persuading Republican women is also misguided. Unsurprisingly, the largest bloc of Swing Voters in Arizona are voters registered as "Other", which we colloquially refer to as Independent voters. Voters that score closest to 50 are truly Independent voters and, those that did were by and large registered Independent. Having said that, roughly 5 to 7 percent of Republicans and Democrats consisted of Swing Voters. And we hear so much about Democrats having to persuade Republicans to win in Arizona but there's equal amount of Democrats that need persuading each cycle in order for Democrats to win. This point was not only asserted by our data analysis but strongly reinforced when we ran an "rf model important features." This resulted in "Party_Other" as the most important feature at 56 percent. To the gender findings above, it also showed that male and female were equal with 4 percent. Second and third most important features behind "Party_Other" were features "Party_Republican" and "Party_Democrat" with 20 and 13 percent respectively. The feature "Age" had a respectable 8 percent. In Republicans being second with predictive powere at 20 percent, there is some validity with the assumption that focusing on Republican voters is important in identifying and communicating with Swing Voters.  
   -  As for whether these Swing Voters reside entirely in Maricopa County, this is mostly true. The map shows that all four competitive legislative districts reside in Maricopa County, apart from two zip codes. It's not to say that there aren't additional Swing Voters in other parts of the state but nearly 80 percent of them do live in these four districts. If this pertains to resource allocation, then mapping where these Swing Voters reside would be critical to campaigns. The backbone of most winning campaigns are their field operations, which is when they deploy hundreds of canvassers to go door to door to inform you of the election and ultimately persuade you to vote for their candidate. Given this, the map shows where there are dense geographic clusters of Swing Voters residing next to one another. You cannot effectively deploy canvassers by demographics so mapping Swing Voters by zip code would increase your operational and cost efficiency and thus give your campaign a strategic advantage. But first you must be able to identify Swing Voters with limited data - as we were able to do with Logistic Regression Undersampling at a rate of nearly 80 percent.
   -  And lastly, part of this Swing Voter mantra has been that these voters are mostly college-educated. Unfortunately, we were unable to acquire these voters' level of education attainment nor their median or household income. However, we were able to add an additional map layer of census median houselhold income data within the Zip Code Swing Voter map. Two things were illustrated here: 1) these four competitive districts do align with the middle to high-income zip codes of Maricopa County and 2) most high-density Swing Voter zip codes also align with higher income zip codes of Maricopa County. Nevertheless, we are reluctant to make the leap that most Swing Voters are college educated as a result of this data and mapping overlap. As many know, just because there is some overlap between higher median income and Swing Voters, it does not inidicate all these voters are college educated. Furthermore, we would advise campaigns not to include "college-educated" as a qualifier to target Swing Voters. In fact, Arizona (30%) falls below the national average of 33 percent of percent of those with a college degree. If campaigns assumed this, then they would be missing out on a lot of potential Swing Voters.       

### Challenges

In preparing, analyzing and running machine learning models with this data, we encountered a number of challenges. By accounting for these, it helps add further clarity on the project and ways in which we could improve any future election projects. The challenges are as follows:

   - First and foremost, we had to run over 20 different versions of various models to find classification scores to produce a sound predictive model. We were also required to transform the data into many different DataFrames and introducing many different ML techniques to optimize our models. This speaks to the problem with the American electorate and its increasing polarization. As more and more voters become hyper-partisan, then the voters that are willing to hear different ideas and consider voting for another party is shrinking. Swing Voters were 13 percent of the total voters across these four districts and this is why we had to exhaust so many models with various optimizations.
   - As a result of the aforementioned, we desired some more data points such as "Level of Education Attainment" and/or "Income." This would have added further context to the make-up of an Arizona Swing Voter. Moreover, these additional data points could have improved the accuracy and precision of our predictive model.
   - Another challenge was that most of our data points were categorical variables. This required substantial amount of label encoding and/or getDummies. In addition to this, it's much more challenging to run linear regression analysis. This type of analysis can be instrumential in learning early on which data points are beneficial to our target. It also helps in developing and structuring our ML models. 

## Google Slides

Click here for initial draft of Google Slides draft of presentation: [Dashboard mockup](https://docs.google.com/presentation/d/1niBqt4rMpW65NBb7cFWH2UJPZE_gq36iIZQ91IrVoC0/edit#slide=id.g1147b030573_0_1) | [Draft Presentation](https://docs.google.com/presentation/d/1kg2Wtakuq2NBjBmaiVa10OS5loL1bqqo6kbOCEo29Kk/edit#slide=id.p)
 
