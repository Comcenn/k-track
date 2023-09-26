import { integer, pgTable, serial, text } from "drizzle-orm/pg-core";
import { asset } from "./asset";

export const fault = pgTable('faults', {
    id: serial('id').primaryKey(),
    faultDescription: text('fault_description'),
    assetNumber: integer('asset_number').references(() => asset.assetNumber),
});