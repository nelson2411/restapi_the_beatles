import AppError from "../utils/appError"
import { NextFunction, Request, Response } from "express"

// create an error for inexistent routes

export const notFound = (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  const error = new AppError(
    `Can't find ${request.originalUrl} on this server!`,
    404
  )

  next(error)
}

// handle all errors

export const errorHandler = (
  error: AppError,
  request: Request,
  response: Response,
  next: NextFunction
) => {
  error.statusCode = error.statusCode || 500
  error.status = error.status || "error"

  response.status(error.statusCode).json({
    status: error.status,
    message: error.message,
  })
}
