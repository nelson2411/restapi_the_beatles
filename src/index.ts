import dotenv from "dotenv"
dotenv.config({
  path: "../.env",
})

import express, { Request, Response, NextFunction } from "express"

import { pool } from "./db"
import rateLimit from "express-rate-limit"
import helmet from "helmet"
import songsRouter from "./routes/songsRoutes"

const app = express()
const port = process.env.PORT || 8000

app.use(helmet())
app.use(
  rateLimit({
    windowMs: 60 * 1000,
    max: 5,
    message: "You have exceeded the 5 requests in 1 minute limit!",
  })
)

// Routes

app.use("/api/v1/songs", songsRouter)

app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error(err.stack)
  res.status(500).send("Something went wrong!")
})

app.listen(port, () => {
  console.log(`Server is running on port ${port}`)
})
