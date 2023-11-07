DELIMITER $$ 

create procedure GetMaxQuantity()
begin
	select max(quantity) as 'Max Quantity in Order' from Orders;

end$$