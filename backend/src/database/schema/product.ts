import { pgTable, serial, text, varchar } from "drizzle-orm/pg-core";
 
export const product = pgTable('products', {
  id: serial('id').primaryKey(),
  model: varchar('model', { length: 256}),
  dimensions: varchar('dimensions', {length: 256}),
  description: text('descriptions'),
  manufacturer: varchar('manufacturer', {length: 256})
});