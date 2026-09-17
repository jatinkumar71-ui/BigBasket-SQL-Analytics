USE bigbasket;
CREATE TABLE products (
    `index` INT,
    product VARCHAR(255),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    brand VARCHAR(100),
    sale_price DECIMAL(10,2),
    market_price DECIMAL(10,2),
    type VARCHAR(100),
    rating DECIMAL(3,2),
    description TEXT
);

-- =========================================
-- DATA EXPLORATION
-- =========================================

-- Count total rows
SELECT COUNT(*) AS total_products
FROM products;


-- View sample data
SELECT *
FROM products
LIMIT 10;


-- Check for NULL values
SELECT
    COUNT(*) AS total_rows,
    SUM(product IS NULL OR product = '') AS missing_product,
    SUM(category IS NULL OR category = '') AS missing_category,
    SUM(sub_category IS NULL OR sub_category = '') AS missing_sub_category,
    SUM(brand IS NULL OR brand = '') AS missing_brand,
    SUM(sale_price IS NULL) AS missing_sale_price,
    SUM(market_price IS NULL) AS missing_market_price,
    SUM(type IS NULL OR type = '') AS missing_type,
    SUM(rating IS NULL) AS missing_rating,
    SUM(description IS NULL OR description = '') AS missing_description
FROM products;


-- Find different product categories
SELECT DISTINCT category
FROM products
ORDER BY category;


-- Count products in each category
SELECT
    category,
    COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;


-- Count products in each sub-category
SELECT
    sub_category,
    COUNT(*) AS product_count
FROM products
GROUP BY sub_category
ORDER BY product_count DESC;


-- Top brands based on number of products
SELECT
    brand,
    COUNT(*) AS product_count
FROM products
GROUP BY brand
ORDER BY product_count DESC
LIMIT 10;


-- Check price statistics
SELECT
    MIN(sale_price) AS min_sale_price,
    MAX(sale_price) AS max_sale_price,
    ROUND(AVG(sale_price), 2) AS avg_sale_price,
    MIN(market_price) AS min_market_price,
    MAX(market_price) AS max_market_price,
    ROUND(AVG(market_price), 2) AS avg_market_price
FROM products;


-- Check rating statistics
SELECT
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    ROUND(AVG(rating), 2) AS avg_rating
FROM products;


-- Check products where sale price is greater than market price
SELECT *
FROM products
WHERE sale_price > market_price;
