import { date, integer, pgTable, serial, text, varchar } from "drizzle-orm/pg-core";
import { asset } from "./asset";

export const check = pgTable('checks', {
    id: serial('id').primaryKey(),
    location: varchar('location', {length: 256}),
    condition: text('condition'),
    checkedOn: date('checked_on'),
    notes: text('notes'),
    assetNumber: integer('asset_number').references(() => asset.assetNumber),
});