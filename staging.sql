create database air2Staging
use air2Staging
 go

 --1. get data from neibourhood 


select  neighbourhood_id, host_neighbourhood, neighbourhood , neighbourhood_cleansed , propertyId
 into air2Staging.dbo.[neighbourhood]
from air2.dbo.[neighbourhood]

--2. get data from amenities and amenitieslist
 -- propertyId, amenityId, amenity

 select propertyId, air2.[dbo].amenities.amenityid, amenity
 into air2Staging.dbo.[amenities]
 from air2.dbo.[amenities]
 inner join air2.[dbo].amenitieslist 
	on air2.[dbo].amenities.amenityid = air2.[dbo].amenitieslist.amenityid 

 --3. get data from  availabilities
 select propertyid, has_availability , availability_30, availability_60, availability_90, availability_365,
calendar_last_scraped
into air2Staging.dbo.[availabilities]
from air2.dbo.[availabilities]

--4. get data from calculated 
select propertyid, calculated_host_listings_count,calculated_host_listings_count_entire_homes,
calculated_host_listings_count_private_rooms,calculated_host_listings_count_shared_rooms, reviews_per_month
into air2Staging.dbo.[calculated]
from air2.dbo.[calculated]

--5. get data from calendar 
select listing_id, date, available, price, adjusted_price, minimum_nights, maximum_nights
into air2Staging.dbo.[calendar]
from air2.dbo.[calendar]

--6. get data from constraints
select propertyid, minimum_nights, maximum_nights, minimum_minimum_nights,maximum_minimum_nights,
minimum_maximum_nights, maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm
into air2Staging.dbo.[constraints]
from air2.dbo.[constraints]

--7. get data from hosts
select host_id, host_url, host_name, host_since, host_location, host_about, host_response_time,host_response_rate,
host_acceptance_rate, host_is_superhost, host_thumbnail_url, host_picture_url, host_neighbourhood, host_listings_count,
host_total_listings_count, host_has_profile_pic , host_identity_verified
into air2Staging.dbo.[hosts]
from air2.dbo.[hosts]

--8. get data from property
select air2.[dbo].property.propertyid, description,latitude, longitude, neighborhood_overview, accommodates,
bathrooms_text, bedrooms, beds, price, instant_bookable, host_id,air2.[dbo].property.property_typeId, room_typeId, property_type, minimum_nights,
maximum_nights, neighbourhood_cleansed
into air2Staging.dbo.[property]
from air2.dbo.[property]
inner join air2.[dbo].property_types
	on air2.[dbo].property_types.property_typeId = air2.[dbo].property.property_typeId
inner join air2.[dbo].constraints
	on air2.[dbo].constraints.propertyid = air2.[dbo].property.propertyid
inner join air2.[dbo].neighbourhood
	on air2.[dbo].neighbourhood.propertyid = air2.[dbo].property.propertyid


--9. get data from reviews
select listing_id, id, date, reviewer_id, reviewer_name, comments
into air2Staging.dbo.[reviews]
from air2.dbo.[reviews]

--10. get data from reviewsSummary
select propertyid, number_of_reviews, number_of_reviews_ltm, number_of_reviews_l30d,first_review,last_review,
review_scores_rating,review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication,
review_scores_location, review_scores_value
into air2Staging.dbo.[reviewsSummary]
from air2.dbo.[reviewsSummary]

--11. get data from room_types
select room_typeId, room_type
into air2Staging.dbo.[room_types]
from air2.dbo.[room_types]

--12. get data from verifications
select host_id, verificationid
into air2Staging.dbo.[verifications]
from air2.dbo.[verifications]

--13. get data from verificationslist
select id, verification
into air2Staging.dbo.[verificationslist]
from air2.dbo.[verificationslist]

--rename column id to idVer
exec SP_RENAME 'air2Staging.dbo.[verificationslist].id', 'idVer', 'COLUMN'

--14. date dimension
--select min(date) minDate, max(date) maxDate from calendar
--select min(date) minDate, max(date) maxDate from reviews