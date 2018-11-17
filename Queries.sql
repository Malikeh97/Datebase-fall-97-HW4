
select booking_id, room_type_requested  -- 1
from booking B, guest G
where G.last_name LIKE 'A%'  AND  B.guest_id=G.id;
 
select count(B.booking_id) as bcount -- 2
from booking B
where B.room_type_requested = 'twin';

select B.booking_id, E.amount -- 3
from booking B, extra E
where B.booking_id=E.booking_id AND E.booking_id>5000 AND E.booking_id<5041;

select Temp.first_name, Temp.last_name -- 4
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

select B.booking_date, count(*) as bcount -- 5
from booking B
group by B.booking_date;

select sum(B.occupants)  -- 6
from booking B
where '2016-11-21' between B.booking_date and (select date_add(B.booking_date, INTERVAL B.nights-1 DAY) as deadline);


ALTER TABLE booking -- 8
ADD CHECK(occupants <11);

ALTER TABLE booking -- 9
ADD CHECK(((select R.amount from rate R, room RO where RO.id=room_no and R.room_type=RO.room_type and R.occupancy=occupants ) * nights )<=2000);


DELIMITER $$
CREATE TRIGGER noBookingAgainCurrentGuest  -- 10
						BEFORE INSERT ON booking 
                        FOR EACH ROW
                        BEGIN
							IF((select count(*)
                                from booking B
                                where B.guest_id=NEW.guest_id and (CURDATE() between B.booking_date and (select date_add(B.booking_date, INTERVAL B.nights-1 DAY) as deadline))
                                )!=0) THEN
							    SET NEW.guest_id=NULL;
						    END IF;
                        END$$ 
DELIMITER ;

CREATE TABLE `new_amount` ( -- 11
  `id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `first_name` varchar(72) NOT NULL,
  `last_name` varchar(72) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DELIMITER $$
CREATE TRIGGER newExtraAmountAdded  
						AFTER INSERT ON extra 
                        FOR EACH ROW
                        BEGIN
                             insert  into `new_amount`
                                                         
							set first_name = (select G.first_name
														from guest G, booking B
														where new.booking_id=B.booking_id and G.id=B.guest_id),
							      last_name = (select G.last_name
														from guest G, booking B
														where new.booking_id=B.booking_id and G.id=B.guest_id),
								  id = NULL,
                            
								amount = new.amount;
                            
						   

                        END$$ 
DELIMITER ;

CREATE VIEW `total_guest_number` AS -- 12
SELECT count(*)
FROM booking B
WHERE CURDATE() between B.booking_date and (select date_add(B.booking_date, INTERVAL B.nights-1 DAY) as deadline);





  
  







