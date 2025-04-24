# Data Catalog for Gold Layer

## Overview
The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. 
It consists of **dimension tables** and **fact tables** for specific business metrics.

---

### 1. **public_gold.dim_customers_gold**
- **Purpose:** Stores customer details enriched with demographic and geographic data.
- **Columns:**

| Column Name      | Data Type     | Description                                                                                   |
|------------------|---------------|-----------------------------------------------------------------------------------------------|
| customer_key     | INT           | Surrogate key uniquely identifying each customer record in the dimension table.               |
| customer_id      | INT           | Unique numerical identifier assigned to each customer.                                        |
| customer_number  | TEXT          | Alphanumeric identifier representing the customer, used for tracking and referencing.         |
| first_name       | TEXT          | The customer's first name, as recorded in the system.                                         |
| last_name        | TEXT          | The customer's last name or family name.                                                     |
| country          | TEXT          | The country of residence for the customer (e.g., 'Australia').                               |
| marital_status   | TEXT          | The marital status of the customer (e.g., 'Married', 'Single').                              |
| gender           | TEXT          | The gender of the customer (e.g., 'Male', 'Female', 'n/a').                                  |
| birthdate        | DATE          | The date of birth of the customer, formatted as YYYY-MM-DD (e.g., 1971-10-06).               |
| create_date      | DATE          | The date and time when the customer record was created in the system|

---

### 2. **public_gold.dim_products_gold**
- **Purpose:** Provides information about the products and their attributes.
- **Columns:**

| Column Name         | Data Type     | Description                                                                                   |
|---------------------|---------------|-----------------------------------------------------------------------------------------------|
| product_key         | INT           | Surrogate key uniquely identifying each product record in the product dimension table.         |
| product_id          | INT           | A unique identifier assigned to the product for internal tracking and referencing.            |
| product_number      | TEXT          | A structured alphanumeric code representing the product, often used for categorization or inventory. |
| product_name        | TEXT          | Descriptive name of the product, including key details such as type, color, and size.         |
| category_id         | TEXT          | A unique identifier for the product's category, linking to its high-level classification.     |
| category            | TEXT          | The broader classification of the product (e.g., Bikes, Components) to group related items.  |
| subcategory         | TEXT          | A more detailed classification of the product within the category, such as product type.      |
| maintenance_required| TEXT          | Indicates whether the product requires maintenance (e.g., 'Yes', 'No').                       |
| cost                | INT           | The cost or base price of the product, measured in monetary units.                            |
| product_line        | TEXT          | The specific product line or series to which the product belongs (e.g., Road, Mountain).      |
| start_date          | DATE          | The date when the product became available for sale or use, stored in|

---

### 3. **public_gold.fact_sales_gold**
- **Purpose:** Stores transactional sales data for analytical purposes.
- **Columns:**

| Column Name     | Data Type     | Description                                                                                   |
|-----------------|---------------|-----------------------------------------------------------------------------------------------|
| order_number    | TEXT          | A unique alphanumeric identifier for each sales order (e.g., 'SO54496').                      |
| product_key     | INT           | Surrogate key linking the order to the product dimension table.                               |
| customer_key    | INT           | Surrogate key linking the order to the customer dimension table.                              |
| order_date      | DATE          | The date when the order was placed.                                                           |
| shipping_date   | DATE          | The date when the order was shipped to the customer.                                          |
| due_date        | DATE          | The date when the order payment was due.                                                      |
| sales_amount    | INT           | The total monetary value of the sale for the line item, in whole currency units (e.g., 25).   |
| quantity        | INT           | The number of units of the product ordered for the line item (e.g., 1).                       |
| price           | INT           | The price per unit of the product for the line item, in whole currency units (e.g., 25).      |

---

# References
- [DataWithBaraa](https://github.com/DataWithBaraa/sql-data-warehouse-project/blob/main/docs/data_catalog.md)