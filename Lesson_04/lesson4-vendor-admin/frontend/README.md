# Lesson 4 frontend - products, vendors and shopping

Use this complete frontend with your existing Lesson 4 backend. The restored vendor screens call its existing endpoints; no new backend Java classes or endpoints are required.

## Run

1. Start your existing Spring Boot backend on **8080**, connected to **ecommerce_app**.
2. Use Node **22.12 or newer**. Stop the previous frontend, then open a terminal in this complete `frontend` folder.
3. Run:

```bash
npm install
npm run dev
```

4. Open **http://localhost:5173** and log in. Keep that hostname throughout the demonstration.

## What each account sees

| Account | Interface |
| --- | --- |
| Guest | Product catalog and registration/login. |
| CUSTOMER | Product catalog, add to cart, quantity changes, removal, clear cart and demo checkout. |
| ADMIN | Shopping plus **Shop & products** and **Vendors** tabs. Product and vendor create/edit/delete controls are available. |

The existing backend requires ADMIN for product and vendor writes. A CUSTOMER's direct POST, PUT or DELETE receives 403 even with a valid CSRF token. The original public GET rules remain in place; hiding a management tab does not turn those reads into admin-only endpoints. This frontend only fetches the separate vendor directory for an administrator.

## Demonstration administrator

Register `admin@example.test` through the frontend. In MySQL Workbench run:

```sql
USE ecommerce_app;
UPDATE app_users SET role = 'ADMIN'
WHERE email = 'admin@example.test';
```

Log out and log back in to load the new role. The database change does not update authorities already stored in a session.

## Vendor management

1. Open **Vendors**. The directory shows each vendor's ID, name and email.
2. Add a vendor with the form. It appears in the directory and in the product editor's vendor selector.
3. Select **Edit**, change the name/email and save. The form loads the vendor by ID through the existing GET endpoint.
4. Delete an unused vendor. If a vendor still has products, the backend returns 409 and the interface explains that the products must first be reassigned or removed.

Switch to **Shop & products** to create/edit/delete products. Newly loaded vendor names also appear on their associated products.

## Components

- `App.jsx`: account state, selected view and API event handlers.
- `api.js`, `auth.js`: requests, CSRF headers and session operations.
- `Header`, `AuthForm`: account controls.
- `ProductList`, `ProductForm`: shopping catalog and product management.
- `VendorList`, `VendorForm`: administrator vendor directory and editing.
- `CartPanel`: cart operations.

The ZIP includes every import, entry file, stylesheet and lockfile. Replace the complete frontend folder rather than merging a few files. Your current database can stay in place for this frontend update.

Demo checkout calculates the total and clears the cart; it still does not change product stock or save orders. Those additions and PDF receipts belong to the next lesson.
