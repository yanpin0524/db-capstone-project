DELIMITER $$ 

create procedure GetMaxQuantity()
begin
	select orderID, max(quantity) as max_quantity from Orders
    group by orderID;

end$$