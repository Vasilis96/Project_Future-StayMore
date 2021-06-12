# Project_Future-StayMore
This is the final project from Project Future

This project is about Stay More, a (fictitious) property management company which operates in a certain city. The administration office already 
has a custom CRM system with a database server and the functionality to provide csv files. In terms 
of data content, the StayMore office provides information about house listings, rental calendars, 
customer reviews. The project focused exclusively on the extraction, transformation, 
management to create the OLAP system. Furthermore, data visualization, intelligence gathering, and 
presentation of the company data was organized and implemented. 

The company’s dataset represents house listings, rental calendars and customer reviews. 
  House listings: detailed house listings data including full house descriptions and average 
review scores. 
  Rental calendar: detailed rental calendar data for house listings, including listing id, rental 
price and availability for each calendar day. 
  Customer reviews: detailed review data for house listings including a unique id for each 
reviewer and their detailed comments for the property. 

**The tools used for this project were:** 

<br/>**SQL with the software SQL Server Management Studio,**

<br/>**Python and**

<br/>**Power BI Desktop.**

Using the above I was able to create an OLAP Data Warehouse where the relevant and most important data to the business was extracted (from the OLTP database), transformed and loaded,
according to the ETL procedure. Controlled denormalization was also applied to the final database in order to increase efficiency when running demanding queries. After cleaning the data, further data cleaning protocols were established at all data entry points

Moving on to Power BI Desktop, the database was imported and several visualizations and explanatory reports for analysis and forecasting were created to provide the stakeholders and the decision makers of the company with valuable insights and give them the power to make informed data-driven decisions.
