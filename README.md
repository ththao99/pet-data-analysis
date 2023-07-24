
## Description
The project aimed at integrating a dataset about adopted pets into the SQL server. The tool used in the project is Microsoft Visual Studio. 
After the data is integrated into the SQL server, a number of SQL queries have been performed to explore the data and answer business questions. 


##  Entity Relationship Diagram (ERD)
The model is following the star schema. With Pet_Fact is the main fact table connected to the dimension tables. 

![ERD](assets/erd.png)

## Uploading data to SQL server

The Dimension tables were uploaded first. With Sequence Container, all the Dimension tables were uploaded at the same time to save time. 

![Dataflow](assets/image-2.png)

Then the fact table was loaded The fact table was linked to Dimension tables using the Lookup function. 

![Fact table ](assets/image-1.png)

## SQL queries
After the data was uploaded to the SQL server, a number of queries have been done to explore the data: 

1.	How many more-than-3-month-old cats have long fur?
Result: 
 ![image](https://github.com/ththao99/pet-data-analysis/assets/135719243/2c3b9096-ee56-4f08-883b-5cf7298e5c88)

2.	Top 5 states have the largest number of pets 
Result: 
![image](https://github.com/ththao99/pet-data-analysis/assets/135719243/d8be6015-7cee-4df0-ae8a-61fb50bc755a)


3.	The number of pets for each kind
Result: 
![query3](assets/image-5.png)

4.	How many more-than-1-month-old pets met the health requirements (Vaccinated, dewormed, Sterilized, and in a healthy state)? 
![image](https://github.com/ththao99/pet-data-analysis/assets/135719243/ecf64189-a190-48bd-8461-1a3b1f4ebd57)

