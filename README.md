# E-Commerce Product Catalog Database Schema

This schema defines the core structure for an e-commerce product catalog system, designed with extensibility and auditability in mind. It includes tables for managing products, brands, categories, variations, attributes, and more.
-----
![Bookstore Schema](assets/ERD.png)
-----
## Key Features

- **Audit Fields**: Every table includes fields for tracking record creation, updates, and soft-deletion:
  - `created_at`, `updated_at`, `deleted_at` (timestamps)
  - `created_by`, `updated_by`, `deleted_by` (user IDs)

- **Product Structure**:
  - Products belong to both a `brand` and a `product_category`.
  - Each product can have multiple images and variations.
  - Variations are defined by combinations of `color` and `size_option`.

- **Attribute System**:
  - Products can have custom attributes linked to an `attribute_type` and `attribute_category`.

- **Inventory**:
  - Each product variation can have multiple `product_items` representing stock, SKU, and price override.

## Tables Included

- `brand`: Brand information.
- `product_category`: Category each product falls under.
- `product`: Core product data including brand and category associations.
- `product_image`: Images associated with a product.
- `color`: Color options for product variations.
- `size_category`, `size_option`: Size structure for variations.
- `product_variation`: Combination of color and size for a specific product.
- `product_item`: Individual SKUs tied to a variation with stock data.
- `attribute_type`, `attribute_category`: Metadata structure for attributes.
- `product_attribute`: Custom attributes per product.

## Usage

Use this schema as a starting point for building scalable, feature-rich e-commerce platforms. The schema is compatible with tools like dbdiagram.io for easy visualization and collaboration.

## Notes

- Foreign keys to `created_by`, `updated_by`, and `deleted_by` are intended to reference a `users` table.
- Soft deletes are implemented via the `deleted_at` field; actual deletions are not enforced by the schema.

