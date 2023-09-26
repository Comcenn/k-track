import { Config } from 'drizzle-kit';
import * as dotenv from 'dotenv';


dotenv.config()


export default {
    schema: './src/database/schema/*',
    out: './migrations',
    driver: 'pg',
    dbCredentials: {
        connectionString: process.env.DB_URL || '',
    }
} satisfies Config;