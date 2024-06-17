--Select orders within a specific date range.
SELECT orderID, orderPrice, orderStatus, orderDate
FROM Orders
WHERE orderDate BETWEEN TO_DATE((&<name="s_date" hint="In format DD-MM-YYYY" type="string" required=true>), 'DD-MM-YYYY') AND TO_DATE((&<name="e_date" hint="In format DD-MM-YYYY" type="string" required=true>), 'DD-MM-YYYY');


--Select products provided by a specific provider.
SELECT prodName, prodPrice
FROM Product
WHERE provID = (SELECT provID FROM Providers WHERE provName = &<name="provider name" list="Kurt-Osbourne, Hex-England, Jodie-Drive, Natalie-Rea, Jared-Van Damme, Rosco-Bonham" type="string" required=true>);


--Select the meals that contain a specific ingredient.
SELECT m.mealName, m.mealPrice
FROM Meal m
JOIN Ingredients i ON m.mealID = i.mealID
JOIN Product p ON i.prodID = p.prodID
WHERE p.prodName = &<name="product name" list="Sugar, salt, turmeric, chicken soup, paprika, black-pepper, chicken-breast, eggs, potatoes, shawarma, tomato, cucumber, pickles, hummus, tahini, ketchup, chicken, steak, eggplant" type="string" required=true>;


--Select all products that are in a spesific meal
SELECT 
    Product.prodName, 
    Ingredients.ingredAmount 
FROM 
    Ingredients
JOIN 
    Product ON Ingredients.prodID = Product.prodID
JOIN 
    Meal ON Ingredients.mealID = Meal.mealID
WHERE 
    Meal.mealName = &<name="meal name" list="Schnitzel, shawarma, chicken-skewer, entrecote-skewer, kebab-skewer, chicken, steak, kebab, chips, salad, water, cola, beer" type="string">;
