/**
 * Genera seed-inserts.sql con todos los INSERT en orden de dependencias (FK).
 * Uso: node seed/generate-inserts.js
 * Luego: mysql -u root -p emarket < seed/seed-inserts.sql
 */

const fs = require('fs');
const path = require('path');

const escape = (v) => {
  if (v === null || v === undefined) return 'NULL';
  if (typeof v === 'number') return String(v);
  return "'" + String(v).replace(/\\/g, '\\\\').replace(/'/g, "\\'").replace(/\n/g, '\\n').replace(/\r/g, '\\r') + "'";
};

const base = path.join(__dirname);

const companies = require('./companies.json');
const users = require('./users.json');
const categories = require('./categories.json');
const subCategories = require('./subCategories.json');
const subSubCategories = require('./subSubCategories.json');
const products = require('./products.json');
const showcases = require('./showcases.json');
const orders = require('./orders.json');
const orderItems = require('./orderItems.json');
const reviews = require('./reviews.json');
const wishlists = require('./wishlists.json');

const out = [];

out.push('-- eMarket - INSERTs en orden de dependencias (FK)');
out.push('-- Ejecutar sobre la BD emarket con tablas ya creadas (ej. por Sequelize sync)');
out.push('-- mysql -u root -p emarket < seed/seed-inserts.sql');
out.push('');
out.push('SET FOREIGN_KEY_CHECKS = 0;');
out.push('');

// 1. Companies (sin FK)
out.push('-- 1. Companies');
out.push('DELETE FROM Companies;');
companies.forEach((r) => {
  const cols = ['id','name','email','phoneNo','icon','logo','code','header','motive','details','location'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO Companies (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 2. Users (CompanyId)
out.push('-- 2. Users');
out.push('DELETE FROM Users;');
users.forEach((r) => {
  const cols = ['id','username','firstName','lastName','email','phoneNo','password','registerToken','resetPasswordToken','profileImage','userType','variant','priority','CompanyId'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO Users (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 3. Categories (sin FK)
out.push('-- 3. Categories');
out.push('DELETE FROM Categories;');
categories.forEach((r) => {
  const cols = ['id','name'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO Categories (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 4. SubCategories (CategoryId)
out.push('-- 4. SubCategories');
out.push('DELETE FROM SubCategories;');
subCategories.forEach((r) => {
  const cols = ['id','name','CategoryId'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO SubCategories (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 5. SubSubCategories (SubCategoryId)
out.push('-- 5. SubSubCategories');
out.push('DELETE FROM SubSubCategories;');
subSubCategories.forEach((r) => {
  const cols = ['id','name','SubCategoryId'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO SubSubCategories (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 6. Products (CategoryId, SubCategoryId, SubSubCategoryId)
out.push('-- 6. Products');
out.push('DELETE FROM Products;');
const productCols = ['id','code','title','subtitle','description','amount','rating','peopleRated','currency','sales','image1','image2','image3','image4','image5','image6','image7','image8','image9','image10','CategoryId','SubCategoryId','SubSubCategoryId'];
products.forEach((r) => {
  const vals = productCols.map(c => escape(r[c]));
  out.push(`INSERT INTO Products (${productCols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 7. Showcases (CompanyId)
out.push('-- 7. Showcases');
out.push('DELETE FROM Showcases;');
showcases.forEach((r) => {
  const cols = ['id','type','caption','image','routerLink','priority','CompanyId'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO Showcases (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 8. Orders (sin FK en el modelo)
out.push('-- 8. Orders');
out.push('DELETE FROM Orders;');
const orderCols = ['id','name','phoneNo','email','address','status','variant','checkoutSessionId','productCost','currency','shippingCost'];
orders.forEach((r) => {
  const vals = orderCols.map(c => escape(r[c]));
  out.push(`INSERT INTO Orders (${orderCols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 9. OrderItems (OrderId, ProductId)
out.push('-- 9. OrderItems');
out.push('DELETE FROM OrderItems;');
orderItems.forEach((r) => {
  const cols = ['id','quantity','ProductId','OrderId'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO OrderItems (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 10. Reviews (UserId, ProductId)
out.push('-- 10. Reviews');
out.push('DELETE FROM Reviews;');
reviews.forEach((r) => {
  const cols = ['id','rating','comment','UserId','ProductId'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO Reviews (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

// 11. Wishlists (UserId, ProductId)
out.push('-- 11. Wishlists');
out.push('DELETE FROM Wishlists;');
wishlists.forEach((r) => {
  const cols = ['id','UserId','ProductId'];
  const vals = cols.map(c => escape(r[c]));
  out.push(`INSERT INTO Wishlists (${cols.join(',')}) VALUES (${vals.join(',')});`);
});
out.push('');

out.push('SET FOREIGN_KEY_CHECKS = 1;');
out.push('');

const sql = out.join('\n');
const outPath = path.join(__dirname, 'seed-inserts.sql');
fs.writeFileSync(outPath, sql, 'utf8');
console.log('Generado:', outPath);
