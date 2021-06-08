go
use air2DW
go
 

--only for the first time
/*
truncate table [dbo].[DimAmenities] ;
truncate table [dbo].[DimAvailabilities];
truncate table [dbo].[DimCalculated];
truncate table [dbo].[DimConstraints];
truncate table [dbo].[DimHosts];
truncate table [dbo].[DimNeighbourhood];
truncate table [dbo].[DimProperty];
truncate table [dbo].[DimReviewsSummary];
truncate table  [dbo].[DimRoom_types];
truncate table [dbo].[DimVerificationlist];
truncate table [dbo].[DimVerifications];
truncate table [dbo].[factCalendar];
truncate table [dbo].[factReviews];
/*


-- 1
insert into DimAmenities ([amenityid],	[propertyId] , [amenity] )
  select  [amenityid],[propertyId] , [amenity] 
  from [air2Staging].[dbo].[amenities]
  

--2

insert into DimAvailabilities([propertyid],[has_availability],[availability_30],[availability_60],[availability_90],
[availability_365],[calendar_last_scraped])
	select [propertyid],[has_availability],[availability_30],[availability_60],[availability_90],[availability_365],[calendar_last_scraped]
	   from [air2Staging].[dbo].[availabilities]

--3
insert into DimCalculated([propertyid],[calculated_host_listings_count], [calculated_host_listings_count_entire_homes],
[calculated_host_listings_count_private_rooms], [calculated_host_listings_count_shared_rooms],[reviews_per_month])
select [propertyid],[calculated_host_listings_count],[calculated_host_listings_count_entire_homes],[calculated_host_listings_count_private_rooms],
[calculated_host_listings_count_shared_rooms],[reviews_per_month]
		from [air2Staging].[dbo].[calculated]

--4
insert into DimConstraints([propertyid], [minimum_nights],[maximum_nights],[minimum_minimum_nights], [maximum_minimum_nights],
[minimum_maximum_nights],[maximum_maximum_nights],[minimum_nights_avg_ntm],[maximum_nights_avg_ntm])
select [propertyid], [minimum_nights],[maximum_nights],[minimum_minimum_nights], [maximum_minimum_nights],
[minimum_maximum_nights],[maximum_maximum_nights],[minimum_nights_avg_ntm],[maximum_nights_avg_ntm]
from [air2Staging].[dbo].[constraints]

--5
insert into DimHosts([host_id],[host_url],[host_name],[host_since],[host_location],[host_about],[host_response_time],[host_response_rate],
[host_acceptance_rate],[host_is_superhost],[host_thumbnail_url],[host_picture_url],[host_neighbourhood],[host_listings_count] ,
[host_total_listings_count],[host_has_profile_pic],[host_identity_verified])
select [host_id],[host_url],[host_name],[host_since],[host_location],[host_about],[host_response_time],[host_response_rate],
[host_acceptance_rate],[host_is_superhost],[host_thumbnail_url],[host_picture_url],[host_neighbourhood],[host_listings_count] ,
[host_total_listings_count],[host_has_profile_pic],[host_identity_verified]
from [air2Staging].[dbo].[hosts]

--6
insert into DimNeighbourhood([neighbourhood_id],[host_neighbourhood],[neighbourhood],[neighbourhood_cleansed],[propertyId])
select [neighbourhood_id],[host_neighbourhood],[neighbourhood],[neighbourhood_cleansed],[propertyId]
from [air2Staging].[dbo].[neighbourhood]

--7
insert into DimProperty([propertyid],[description],[latitude],[longitude],[neighborhood_overview],[accommodates],
[bathrooms_text],[bedrooms],[beds],[price],[instant_bookable],[host_id],[property_typeId],[room_typeId],[property_type],
[minimum_nights],[maximum_nights],[neighbourhood_cleansed])
select [propertyid],[description],[latitude],[longitude],[neighborhood_overview],[accommodates],
[bathrooms_text],[bedrooms],[beds],[price],[instant_bookable],[host_id],[property_typeId],[room_typeId],[property_type],
[minimum_nights],[maximum_nights],[neighbourhood_cleansed]
from [air2Staging].[dbo].[property]

--8
insert into DimReviewsSummary([propertyid],[number_of_reviews],[number_of_reviews_ltm],[number_of_reviews_l30d],[first_review],
[last_review],[review_scores_rating],[review_scores_accuracy],[review_scores_cleanliness],[review_scores_checkin],[review_scores_communication],
[review_scores_location],[review_scores_value])
select  [propertyid],[number_of_reviews],[number_of_reviews_ltm],[number_of_reviews_l30d],[first_review],
[last_review],[review_scores_rating],[review_scores_accuracy],[review_scores_cleanliness],[review_scores_checkin],[review_scores_communication],
[review_scores_location],[review_scores_value]
from [air2Staging].[dbo].[reviewsSummary]

--9
insert into DimRoom_types([room_typeId],[room_type])
select [room_typeId],[room_type] 
from [air2Staging].[dbo].[room_types]

--10
insert into DimVerifications([host_id],[verificationid])
select [host_id],[verificationid]
from [air2Staging].[dbo].[verifications]

--11
insert into DimVerificationslist([idVer],[verification])
select [idVer],[verification]
from [air2Staging].[dbo].[verificationslist]

--12 
insert into DimDate([DateKey],[Date],[FullDateUK],[FullDateUSA],[DayOfMonth],[DaySuffix], [DayName], [DayOfWeekUSA],
    [DayOfWeekUK] ,[DayOfWeekInMonth], [DayOfWeekInYear],[DayOfQuarter],[DayOfYear] ,[WeekOfMonth], [WeekOfQuarter],
    [WeekOfYear] , [Month] ,[MonthName] ,[MonthOfQuarter],[Quarter] ,[QuarterName] ,[Year] ,[YearName] ,[MonthYear] ,
    [MMYYYY] ,[FirstDayOfMonth] ,[LastDayOfMonth] ,[FirstDayOfQuarter] ,[LastDayOfQuarter] ,[FirstDayOfYear] ,[LastDayOfYear] ,
    [IsHolidayUSA] ,[IsWeekday],[HolidayUSA] ,[IsHolidayUK] ,[HolidayUK])
select [DateKey],[Date],[FullDateUK],[FullDateUSA],[DayOfMonth],[DaySuffix], [DayName], [DayOfWeekUSA],
    [DayOfWeekUK] ,[DayOfWeekInMonth], [DayOfWeekInYear],[DayOfQuarter],[DayOfYear] ,[WeekOfMonth], [WeekOfQuarter],
    [WeekOfYear] , [Month] ,[MonthName] ,[MonthOfQuarter],[Quarter] ,[QuarterName] ,[Year] ,[YearName] ,[MonthYear] ,
    [MMYYYY] ,[FirstDayOfMonth] ,[LastDayOfMonth] ,[FirstDayOfQuarter] ,[LastDayOfQuarter] ,[FirstDayOfYear] ,[LastDayOfYear] ,
    [IsHolidayUSA] ,[IsWeekday],[HolidayUSA] ,[IsHolidayUK] ,[HolidayUK]
from  [air2Staging].[dbo].[DimDate]

--13
insert into factCalendar([listing_id],[air2Staging].[dbo].[property].[propertyid],[date],[available],[price],[adjusted_price],[minimum_nights],[maximum_nights])
select [listing_id],[propertyid],[air2Staging].[dbo].[calendar].[date],[available],[air2Staging].[dbo].[calendar].[price],[adjusted_price],[air2Staging].[dbo].[calendar].[minimum_nights],[air2Staging].[dbo].[calendar].[maximum_nights]
from [air2Staging].[dbo].[calendar]

inner join air2DW.dbo.DimProperty
on [DimProperty].[propertyid]=[air2Staging].[dbo].[property].[propertyid]

inner join air2DW.dbo.DimDate
on [DimDate].DateKey=[air2Staging].[dbo].[DimDate].DateKey

--14
insert into factReviews([DateKey],[listing_id],[propertyid],[amenityid],[host_id],[neighbourhood_id],[room_typeId],[idVer],
[id],[date],[reviewer_id],[reviewer_name],[comments])
select [DateKey],[listing_id],[propertyid],[amenityid],[host_id],[neighbourhood_id],[room_typeId],[idVer],
[id],[air2Staging].[dbo].[reviews].[date],[reviewer_id],[reviewer_name],[comments]
from [air2Staging].[dbo].[reviews]

inner join air2DW.dbo.DimProperty
on [air2DW].dbo.[DimProperty].[propertyid]=[air2Staging].[dbo].[property].[propertyid]

inner join air2DW.dbo.DimDate
on [air2DW].[dbo].[DimDate].DateKey= [air2Staging].[dbo].[DimDate].DateKey

inner join air2DW.dbo.DimAmenities
on [air2DW].dbo.DimAmenities.amenityid=[air2Staging].[dbo].[amenities].amenityid

inner join air2DW.dbo.DimHosts
on [air2DW].dbo.DimHosts.host_id=[air2Staging].[dbo].[hosts].[host_id]

inner join air2DW.dbo.DimNeighbourhood
on [air2DW].dbo.DimNeighbourhood.neighbourhood_id=[air2Staging].[dbo].[neighbourhood].neighbourhood_id

inner join air2DW.dbo.DimRoom_types
on [air2DW].dbo.DimRoom_types.room_typeId=[air2Staging].[dbo].[room_types].[room_typeId]

inner join air2DW.dbo.DimVerificationlist
on [air2DW].dbo.DimVerificationslist.idVer= air2Staging.[dbo].[verificationslist].idVer
