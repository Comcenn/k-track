import { integer, pgTable, serial, date, varchar } from "drizzle-orm/pg-core";
import { product } from "./product";

export const asset = pgTable('assets',{
    id: serial('id').primaryKey(),
    assetNumber: integer('asset_number').unique(),
    colour: varchar('colour', {length: 256}),
    purchasePrice: integer('purchase_price'),
    datePurchased: date('date_purchased'),
    productId: integer('product_id').references(() => product.id)
});