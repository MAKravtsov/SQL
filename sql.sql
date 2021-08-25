-- Продукты
DECLARE @Products TABLE (ID INT, Name NVARCHAR(100))
INSERT INTO @Products VALUES (1, 'Помидор'), (2, 'Хлеб'), (3, 'Морковь'), (4, 'Вода')
	
-- Категории
DECLARE @Categories TABLE (ID INT, Name NVARCHAR(100))
INSERT INTO @Categories VALUES (1, 'Овощи'), (2, 'Мучное'), (3, 'Красный')

-- Связь "многие ко многим" осуществляется с помощью промежуточной таблицы
DECLARE @ProductCategories TABLE (ProductId INT, CategoryId INT NULL)
INSERT INTO @ProductCategories VALUES (1, 1), (1, 3), (2, 2), (3, 1)

SELECT p.ID AS [ProductId]
	, pc.CategoryId AS [CategoryId]
FROM @Products p
	LEFT JOIN @ProductCategories pc ON p.ID = pc.ProductId