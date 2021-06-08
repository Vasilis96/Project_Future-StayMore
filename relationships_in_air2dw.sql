
alter table factReviews add foreign key(DateKey)
 references  DimDate(DateKey);

alter table factCalendar add foreign key(DateKey)
 references  DimDate(DateKey);

 alter table factReviews add foreign key(propertyid)
 references DimProperty(propertyid);

 
 alter table factCalendar add foreign key(propertyid)
 references DimProperty(propertyid);

 alter table factReviews add foreign key (amenityid)
 references DimAmenities (amenityid);
 
 alter table factReviews add foreign key (host_id)
 references DimHosts(host_id);


 alter table factReviews add foreign key (neighbourhood_id)
 references DimNeighbourhood (neighbourhood_id);

  alter table factReviews add foreign key (room_typeId)
 references DimRoom_types (room_typeId);

   alter table factReviews add foreign key (idVer)
 references DimVerificationslist (idVer);

alter table DimAvailabilities  add foreign key (propertyid)
		references DimProperty (propertyid);


 alter table DimCalculated  add foreign key (propertyid)
		references DimProperty (propertyid);

alter table DimReviewsSummary  add foreign key (propertyid)
		references DimProperty (propertyid);

alter table DimConstraints  add foreign key (propertyid)
		references DimProperty (propertyid);

alter table DimVerifications  add foreign key (host_id)
		references DimHosts (host_id);