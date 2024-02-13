import { createPool } from "mysql2"
require("dotenv").config()

export const pool = createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: Number(process.env.DB_PORT),
})

pool.getConnection((err, connection) => {
  if (err) {
    console.error("Something went wrong connecting to the database ...")
    throw err
  }
  if (connection) connection.release()
  console.log("Successfully connected to the database ✨")
  return
})
