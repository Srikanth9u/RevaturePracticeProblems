-- Write the query to generate all possible combinations of discount offers for products. 
-- Headers expected in output: |  ProductName   |  DiscountName   | DiscountPercentage | DiscountedPrice |
--Discount(DID)->products
select p.ProductName,d.DiscountName,d.DiscountPercentage,p.Price *(1-d.DiscountPercentage) as DiscountedPrice from products p cross join  Discounts d;
