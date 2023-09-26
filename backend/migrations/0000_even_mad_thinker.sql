CREATE TABLE IF NOT EXISTS "assets" (
	"id" serial PRIMARY KEY NOT NULL,
	"asset_number" integer,
	"colour" varchar(256),
	"purchase_price" integer,
	"date_purchased" date,
	"product_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "checks" (
	"id" serial PRIMARY KEY NOT NULL,
	"location" varchar(256),
	"condition" text,
	"checked_on" date,
	"notes" text,
	"asset_number" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "faults" (
	"id" serial PRIMARY KEY NOT NULL,
	"fault_description" text,
	"asset_number" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "products" (
	"id" serial PRIMARY KEY NOT NULL,
	"model" varchar(256),
	"dimensions" varchar(256),
	"descriptions" text,
	"manufacturer" varchar(256)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "values" (
	"id" serial PRIMARY KEY NOT NULL,
	"current_value" integer,
	"asset_number" integer,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "assets" ADD CONSTRAINT "assets_product_id_products_id_fk" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "checks" ADD CONSTRAINT "checks_asset_number_assets_asset_number_fk" FOREIGN KEY ("asset_number") REFERENCES "assets"("asset_number") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "faults" ADD CONSTRAINT "faults_asset_number_assets_asset_number_fk" FOREIGN KEY ("asset_number") REFERENCES "assets"("asset_number") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "values" ADD CONSTRAINT "values_asset_number_assets_asset_number_fk" FOREIGN KEY ("asset_number") REFERENCES "assets"("asset_number") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
