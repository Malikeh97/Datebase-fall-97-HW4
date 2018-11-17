
select booking_id, room_type_requested 
from booking B, guest G
where G.last_name LIKE 'A%'  AND  B.guest_id=G.id;
 
select count(B.booking_id) as bcount
from booking B
where B.room_type_requested = 'twin';

select B.booking_id, E.amount
from booking B, extra E
where B.booking_id=E.booking_id AND E.booking_id>5000 AND E.booking_id<5041;

select Temp.first_name, Temp.last_name
from (select G.id, G.first_name, G.last_name, count(*) as gcount
      from guest G, booking B
          where G.id=B.guest_id
          group by G.id) as Temp
where Temp.gcount  = (select count(*) as cnt
									 from guest G, booking B
									 where G.id=B.guest_id
									 group by G.id
                                     order by cnt DESC
                                     LIMIT 1);

select B.booking_date, count(*) as bcount
from booking B
group by B.booking_date;

select sum(B.occupants)
from booking B
where '2016-11-21' between B.booking_date and (select date_add(B.booking_date, INTERVAL B.nights-1 DAY) as deadline);









