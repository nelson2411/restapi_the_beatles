import app from "./app"
import dotenv from "dotenv"
import { checkConnection } from "./db"
import AppError from "./utils/appError"

dotenv.config({
  path: "../.env",
})

checkConnection()
  .then(() => {
    app.listen(process.env.PORT, () => {
      console.log(`Server is running on port ${process.env.PORT}`)
    })
  })
  .catch((error) => {
    console.error(
      new AppError(`Error connecting to the database: ${error}`, 500)
    )
    process.exit(1)
  })
