# Lesson 4 ecommerce frontend — vendor administration included

## Start this copy

1. Stop the previous frontend terminal with Ctrl+C.
2. Extract this ZIP into a new folder. Do not merge its files into the old frontend.
3. Keep your existing Lesson 4 Spring Boot backend running on port 8080, connected to ecommerce_app.
4. Use Node 22.12 or newer. From the directory containing lesson4-vendor-admin, run:

```bash
cd lesson4-vendor-admin/frontend
npm install
npm run dev
```

5. Open http://localhost:5173. Keep using localhost throughout the demonstration.

The frontend uses the existing lesson backend endpoints. No database reset is needed for this frontend update.

## Open vendor management

Log in with an ADMIN account. The top-right header must show ADMIN. Select the Vendors tab below the page heading. It contains the vendor directory, Add a vendor form, and Edit/Delete buttons.

If you do not have an admin account yet, register admin@example.test through this frontend using a password you choose. Then run this in MySQL Workbench:

```sql
USE ecommerce_app;
UPDATE app_users
SET role = 'ADMIN'
WHERE email = 'admin@example.test';

SELECT email, role
FROM app_users
WHERE email = 'admin@example.test';
```

Log out and log back in after changing the role. An existing session retains its previous authorities. This SQL changes an existing account; it does not create one or change its password.

Registration creates CUSTOMER accounts. There is intentionally no public Admin registration option. A CUSTOMER sees the catalog and cart, not vendor or product management controls.

## Verified behavior

- Admin: list, create, edit and delete vendors.
- A newly created vendor appears in the product form's vendor selector.
- Renaming a vendor refreshes the vendor name on its products.
- Deleting a vendor with products produces a clear conflict message; reassign or delete those products first.
- Customer: vendor and product management controls are hidden, and direct write requests are rejected with HTTP 403.
- Customer cart operations, session reload and the existing demo checkout still work.

The screenshot Admin_Vendors_Preview.png was captured from this frontend running against the lesson backend in an isolated test database. Its test accounts and extra vendor are not pre-created in your database.

The existing demo checkout calculates a total and clears the cart. It does not yet decrement inventory or save orders.
