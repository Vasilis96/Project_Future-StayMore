--
 create database air2DW
go

use air2DW
go


drop table if exists DimAmenities;
drop table if exists DimAvailabilities;
drop table if exists DimCalculated;
drop table if exists DimConstraints;
drop table if exists DimHosts;
drop table if exists DimNeighbourhood;
drop table if exists DimProperty;
drop table if exists DimReviewsSummary;
drop table if exists DimRoom_types;
drop table if exists DimVerifications;
drop table if exists DimVerificationslist;
drop table if exists DimDate;
drop table if exists FactReviews;
drop table if exists FactCalendar;

-- DimProperty dimension will need to include:
create table DimProperty(
	[propertyid] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[description] nvarchar(max) NOT NULL,
	[latitude] float NOT NULL,
	[longitude] float NOT NULL,
	[neighborhood_overview] nvarchar(max) NOT NULL,
	[accommodates] int NOT NULL,
    [bathrooms_text] nvarchar(max) NOT NULL,
    [bedrooms] int NOT NULL,
    [beds] int NOT NULL,
	[price] float NOT NULL,
	[instant_bookable] char(1) NOT NULL,
	[host_id] int NOT NULL,
	[property_typeId] int NOT NULL,
	[room_typeId] int NOT NULL,
	[property_type] nvarchar(100) NOT NULL,
	[minimum_nights] float NOT NULL,
	[maximum_nights] float NOT NULL,
	[neighbourhood_cleansed] nvarchar(max) NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '1899-12-31' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
	);

---- DimAmenities dimension will need to include:
create table DimAmenities (
	[amenityid] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[propertyId] INT NOT NULL,
	[amenity] nvarchar(100) NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '2009-01-01' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);

-- DimAvailabilities dimension will need to include:
create table DimAvailabilities(
	[propertyid] INT NOT NULL,
	[has_availability] VARCHAR(255) NOT NULL,
	[availability_30] float NOT NULL,
	[availability_60] float NOT NULL,
	[availability_90] float NOT NULL,
	[availability_365] float NOT NULL,
	[calendar_last_scraped] datetime NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '1899-12-31' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason VARCHAR(200) NULL
);
 

-- DimCalculated dimension will need to include:
create table DimCalculated(
	[propertyid] INT NOT NULL,
	[calculated_host_listings_count] float NOT NULL,
	[calculated_host_listings_count_entire_homes] float NOT NULL,
	[calculated_host_listings_count_private_rooms] float NOT NULL,
	[calculated_host_listings_count_shared_rooms] float NOT NULL,
	[reviews_per_month] float NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '1899-12-31' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);

-- DimConstraints dimension will need to include:
create table DimConstraints(
	[propertyid] INT NOT NULL,
	[minimum_nights] float NOT NULL,
	[maximum_nights] float NOT NULL,
	[minimum_minimum_nights] float NOT NULL,
	[maximum_minimum_nights] float NOT NULL,
	[minimum_maximum_nights] float NOT NULL,
    [maximum_maximum_nights] float NOT NULL,
    [minimum_nights_avg_ntm] float NOT NULL,
    [maximum_nights_avg_ntm] float NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '1899-12-31' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);

-- DimHosts dimension will need to include:
create table DimHosts(
	[host_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[host_url] nvarchar(max) NOT NULL,
	[host_name] nvarchar(max) NOT NULL,
	[host_since] date NOT NULL,
	[host_location] nvarchar(max) NOT NULL,
	[host_about] nvarchar(max) NOT NULL,
    [host_response_time] nvarchar(max) NOT NULL,
    [host_response_rate] nvarchar(max) NOT NULL,
    [host_acceptance_rate] nvarchar(max) NOT NULL,
	[host_is_superhost] nvarchar(max) NOT NULL,
	[host_thumbnail_url] nvarchar(max) NOT NULL,
	[host_picture_url] nvarchar(max) NOT NULL,
	[host_neighbourhood] nvarchar(max) NOT NULL,
	[host_listings_count] int NOT NULL,
	[host_total_listings_count] int NOT NULL,
	[host_has_profile_pic] char(1) NOT NULL,
	[host_identity_verified] char(1) NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '1899-12-31' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);
 
 -- DimNeighbourhood dimension will need to include:
create table DimNeighbourhood(
	[neighbourhood_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[host_neighbourhood] nvarchar(max) NOT NULL,
	[neighbourhood] nvarchar(max) NOT NULL,
	[neighbourhood_cleansed] nvarchar(max) NOT NULL,
	[propertyId] int NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '1899-12-31' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);


-- DimReviewsSummary dimension will need to include:
create table DimReviewsSummary(
	[propertyid] INT NOT NULL,
	[number_of_reviews] float NOT NULL,
	[number_of_reviews_ltm]float NOT NULL,
	[number_of_reviews_l30d] float NOT NULL,
	[first_review] datetime NOT NULL,
	[last_review] datetime NOT NULL,
    [review_scores_rating] float NOT NULL,
    [review_scores_accuracy] float NOT NULL,
    [review_scores_cleanliness] float NOT NULL,
	[review_scores_checkin] float NOT NULL,
	[review_scores_communication] float NOT NULL,
	[review_scores_location] float NOT NULL,
	[review_scores_value] float NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '1899-12-31' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);


---- DimRoom_types dimension will need to include:
create table DimRoom_types (
	[room_typeId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[room_type] nvarchar(max) NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '2009-01-01' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);

---- DimVerifications dimension will need to include:
create table DimVerifications (
	[host_id] INT NOT NULL,
	[verificationid] INT NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '2009-01-01' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);

---- DimVerificaionlist dimension will need to include:
create table DimVerificationslist (
	[idVer] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[verification] nvarchar(100) NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '2009-01-01' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);

---- DimDate dimension will need to include:
create table  DimDate(
	[DateKey] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Date] datetime NOT NULL,
    [FullDateUK] char(10) NOT NULL,
    [FullDateUSA] char(10) NOT NULL,
    [DayOfMonth] varchar(2) NOT NULL,
    [DaySuffix] varchar(4) NOT NULL,
    [DayName] varchar(9) NOT NULL,
    [DayOfWeekUSA] char(1) NOT NULL,
    [DayOfWeekUK] char(1) NOT NULL,
    [DayOfWeekInMonth] varchar(2) NOT NULL,
    [DayOfWeekInYear] varchar(2) NOT NULL,
    [DayOfQuarter] varchar(2) NOT NULL,
    [DayOfYear] varchar(3) NOT NULL,
    [WeekOfMonth] varchar(1) NOT NULL,
	[WeekOfQuarter] varchar(2) NOT NULL,
    [WeekOfYear] varchar(2) NOT NULL,
    [Month] varchar(2) NOT NULL,
    [MonthName] varchar(9) NOT NULL,
    [MonthOfQuarter] varchar(2) NOT NULL,
    [Quarter] char(1) NOT NULL,
    [QuarterName] varchar(9) NOT NULL,
    [Year] char(4) NOT NULL,
    [YearName] char(7) NOT NULL,
    [MonthYear] char(10) NOT NULL,
    [MMYYYY] char(6) NOT NULL,
	[FirstDayOfMonth] date NOT NULL,
    [LastDayOfMonth] date NOT NULL,
    [FirstDayOfQuarter] date NOT NULL,
    [LastDayOfQuarter] date NOT NULL,
    [FirstDayOfYear] date NOT NULL,
    [LastDayOfYear] date NOT NULL,
    [IsHolidayUSA] bit NOT NULL,
    [IsWeekday] bit NOT NULL,
	[HolidayUSA] varchar(50) NOT NULL,
    [IsHolidayUK] bit NOT NULL,
    [HolidayUK] varchar(50) NOT NULL,
	RowIsCurrent INT DEFAULT 1 NOT NULL,
	RowStartDate DATE DEFAULT '2009-01-01' NOT NULL,
	RowEndDate DATE DEFAULT '9999-12-31' NOT NULL,
	RowChangeReason varchar(200) NULL
);

create table factCalendar(
    [DateKey] INT NOT NULL,
	[listing_id] INT NOT NULL,
	[propertyid] INT NOT NULL,
	[date] date NOT NULL,
	[available] char(1) NOT NULL,
	[price] float NOT NULL,
	[adjusted_price] float NOT NULL  ,
	[minimum_nights] INT NOT NULL,
	[maximum_nights] INT NOT NULL,
);

create table factReviews(
    [DateKey] INT NOT NULL,
	[listing_id] INT NOT NULL,
	[propertyid] INT NOT NULL,
	[amenityid] INT NOT NULL,
	[host_id] INT NOT NULL,
	[neighbourhood_id] INT NOT NULL,
	[room_typeId] INT NOT NULL,
	[idVer] int NOT NULL,
	[id] int NOT NULL,
	[date] datetime NOT NULL,
	[reviewer_id] int NOT NULL,
	[reviewer_name] nvarchar(50) NOT NULL  ,
	[comments] varchar(max) NOT NULL,
);