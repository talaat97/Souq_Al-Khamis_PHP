CREATE OR REPLACE VIEW iteams1view AS
SELECT items.* , categories. * FROM items
INNER JOIN categories on items. itens_cat = categories.categories_id;


SELECT iteams1view.*,1 as favorite , (iteams_price - iteams_price * iteams_discount/100)as iteamPriceDescount 
FROM iteams1view 
INNER join favorite 
on favorite.favorite_iteamsid = iteams1view.iteams_id 
and favorite.favorite_userid = $userid 
where categories_name = '$categoryname'
UNION all 
SELECT iteams1view.* ,0 as favorite , (iteams_price - iteams_price * iteams_discount/100)as iteamPriceDescount
from iteams1view 
where categories_name = '$categoryname' and iteams1view.iteams_id not in (
    SELECT iteams1view.iteams_id 
    FROM iteams1view 
    INNER join favorite 
    on favorite.favorite_iteamsid = iteams1view.iteams_id and favorite.favorite_userid = $userid
)


CREATE OR REPLACE VIEW myfavorte AS
SELECT favorite.* , iteams.* , users.user_id
FROM favorite INNER JOIN users ON users.user_id = favorite.favorite_userid
INNER JOIN iteams ON iteams.iteams_id = favorite.favorite_iteamsid;


CREATE or REPLACE VIEW cartview AS
SELECT Sum(iteams.iteams_price - iteams.iteams_price * iteams.iteams_discount /100) as iteamsPrice , COUNT(cart.cart_itemsid) as countItems,cart.*,iteams.*
from cart INNER JOIN iteams on iteams.iteams_id = cart.cart_itemsid
WHERE cart.cart_orders != 0
GROUP by cart.cart_itemsid , cart.cart_userid ;

CREATE  or REPLACE view ordersview AS 
SELECT customerorders.* , address.* FROM customerorders 
LEFT JOIN address ON address.address_id = customerorders.order_address ;

CREATE or REPLACE VIEW orderDetailsView AS
SELECT COUNT(cart.cart_itemsid) as countItems, ordersview.*, iteams.*,cart.*
from cart INNER JOIN iteams on cart.cart_itemsid = iteams.iteams_id     
inner join ordersview on ordersview.order_id = cart.cart_orders
WHERE cart.cart_orders != 0
GROUP by cart.cart_itemsid , cart.cart_userid , cart.cart_orders;


CREATE OR REPLACE VIEW ItemsView_WithRating AS
SELECT iteams1view.* , rating.* ,AVG(rating.rating_rateiteam) as ratingAvr FROM iteams1view
LEFT JOIN rating on iteams1view.iteams_id = rating.rating_iiteamid 
GROUP by iteams1view.iteams_id;


CREATE or REPLACE VIEW TopSailerView AS
SELECT iteams1view.*, COUNT(cart.cart_itemsid) as TopSailer , (iteams_price - iteams_price * iteams_discount/100)as iteamPriceDescount FROM cart
LEFT JOIN iteams1view on cart.cart_itemsid = iteams1view.iteams_id 	
GROUP BY cart.cart_itemsid
ORDER by TopSailer DESC
LIMIT 10;
