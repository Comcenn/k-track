import { integer, pgTable, serial, timestamp } from "drizzle-orm/pg-core";
import { asset } from "./asset";

export const value = pgTable('values', {
    id: serial('id').primaryKey(),
    currentValue: integer('current_value'),
    assetNumber: integer('asset_number').references( () => asset.assetNumber ),
    createdAt: timestamp('created_at').defaultNow(),
});