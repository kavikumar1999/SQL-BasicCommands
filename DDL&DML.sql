--Creating table by using CREATE keyword
CREATE TABLE recipes (
  recipe_id INT NOT NULL,
  recipe_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (recipe_id),
  UNIQUE (recipe_name)
);


--Inserting values into the table
INSERT INTO recipes 
    (recipe_id, recipe_name) 
VALUES 
    (1,'Dosa'),
    (2,'Tomato Soup'),
	(3,'Chicken Curry'),
	(4,'Noodles');


--To read the table SELECT keyword is used
SELECT * FROM recipes

/*By using ALTER keyword we can drop,delete,add the columns*/
ALTER TABLE recipes
ADD recipe_price INT 

--To change the data type
ALTER TABLE recipes
ALTER COLUMN recipe_price VARCHAR(255)

--To delete the column 
ALTER TABLE recipes
DROP COLUMN recipe_price

--To delete the entire table.it will be lost
DROP table recipes

--To delete the data inside the table not the table itslef
TRUNCATE TABLE recipes

-->To delete the data inside the table by using condition
DELETE FROM recipes where recipe_id=1

-->Update the existing values
UPDATE recipes SET recipe_price=20 WHERE recipe_id=1


CREATE TABLE ingredients (
  ingredient_id INT NOT NULL, 
  ingredient_name VARCHAR(30) NOT NULL,
  ingredient_price INT NOT NULL,
  PRIMARY KEY (ingredient_id),  
  UNIQUE (ingredient_name)
);

INSERT INTO ingredients
    (ingredient_id, ingredient_name, ingredient_price)
VALUES 
    (1, 'Chicken', 5),
    (2, 'Rice Flour', 1),
    (3, 'Tomatoes', 2),
    (4, 'Masala', 2),
    (5, 'Onion', 3),
    (6, 'Milk', 1),
    (7, 'Bread', 2);

SELECT * FROM ingredients

CREATE TABLE recipe_ingredients (
  recipe_id int NOT NULL, 
  ingredient_id INT NOT NULL, 
  amount INT NOT NULL,
  PRIMARY KEY (recipe_id,ingredient_id)
);

INSERT INTO recipe_ingredients 
    (recipe_id, ingredient_id, amount)
VALUES
    (1,1,1),(1,2,2),(1,3,2),(1,4,3),(1,5,1),(2,3,2),(3,5,1),(3,7,2);

SELECT * FROM recipe_ingredients
