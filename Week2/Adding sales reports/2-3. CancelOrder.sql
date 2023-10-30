DELIMITER $$ 
create procedure CancelOrder(in in_order_id int)
begin
	delete from Orders where orderID = in_order_id;
end$$