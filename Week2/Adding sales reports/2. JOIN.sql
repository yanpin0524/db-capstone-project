select Customers.customerID, Customers.name, Orders.orderID, Orders.totalCost, Menus.menuName, MenuItems.courseName, MenuItems.starterName
from Orders
inner join Customers on Orders.customerID = Customers.customerID
inner join Menus on Orders.menuID = Menus.menuID
inner join MenuAndMenuItems on Menus.menuID = MenuAndMenuItems.menuID
inner join MenuItems on MenuAndMenuItems.menuItemID = MenuItems.menuItemID
where Orders.totalCost >= 150
order by Orders.totalCost;