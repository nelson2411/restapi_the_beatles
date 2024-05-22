import { Request, Response, NextFunction } from "express"
import { pool } from "../db"
import AppError from "../utils/appError"
import catchAsync from "../utils/catchAsync"

// get all albums

export const getAlbums = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  try {
    const results = await pool.query("SELECT * FROM studio_albums")
    response.status(200).json(results[0])
  } catch (error) {
    return next(new AppError("Error fetching albums", 500))
  }
}

// get album by id

export const getAlbumById = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  const id = parseInt(request.params.id)
  const results = await pool.query("SELECT * FROM albums WHERE album_id = ?", [
    id,
  ])

  if (!results) return next(new AppError("No album found with this id", 404))
  response.status(200).json(results)
}
