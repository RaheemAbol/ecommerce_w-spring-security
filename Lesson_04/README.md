# Lesson 4 — Spring Security

The lesson, code guide, and frontend have been aligned. The backend Java files, package names, dependencies, and endpoint definitions are identical to the original complete lesson pack.

## Continue your existing lesson project

1. Use `Lesson_04_Code.md` for the security additions already shown in the slides.
2. **Include section 5's five cart files.** The earlier guide listed these separately; the frontend needs them to load `/api/cart` after login. If they are already present, keep the existing copies.
3. Run `sql/02_Add_Users.sql` and `sql/03_Add_Cart_Demo.sql` in your existing `ecommerce_day2` database. Both preserve existing rows. Keep `spring.jpa.hibernate.ddl-auto=validate` and your current credentials.
4. Restart that backend on 8080.
5. In the supplied `frontend` folder, run `npm install` and `npm run dev`. Open http://localhost:5173.

No replacement Product/Vendor classes or new cart endpoints are required.

## For a separate fresh demonstration database only

The retained `sql/01_Ecommerce_Setup_FRESH_ONLY.sql` resets Product/Vendor tables. Do not run it against your existing lesson data. To initialize a brand-new demonstration database, run 01, 02, and 03 in order, set the MySQL password in `backend/src/main/resources/application.properties`, open `backend/pom.xml`, and run `com.example.ecommerce.Application` with JDK 17 or 21.

## Files

- `Lesson_04_Spring_Security.pdf`: the 39-slide lesson with corrected build requirements and browser instructions.
- `Lesson_04_Code.md`: complete security and cart additions in one build sequence.
- `Cart_Demo_Additions.md`: focused reference for the same original cart files.
- `Frontend_Security_Changes.md`: all frontend source, matching the supplied frontend folder.
- `Instructor_Guide.md`: demonstration sequence and troubleshooting.
- `Verification.md`: exact scope and results of the checks performed.
