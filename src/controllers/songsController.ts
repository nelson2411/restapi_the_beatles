import { Request, Response, NextFunction } from "express"
import { pool } from "../db"
import AppError from "../utils/appError"
import catchASync from "../utils/catchAsync"

// get all songs
export const getSongs = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  try {
    const results = await pool.query("SELECT * FROM songs")
    response.status(200).json(results)
  } catch (error) {
    return next(new AppError("Error fetching songs", 500))
  }
}
// get songs by album_id

export const getSongsByAlbumId = (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  const album_id = parseInt(request.params.album_id)
  const results = pool.query("SELECT * FROM songs WHERE album_id = ?", [
    album_id,
  ])

  if (!results) return next(new AppError("No songs found for this album", 404))
  response.status(200).json(results)
}

// get song by id

export const getSongById = (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  const id = parseInt(request.params.id)
  const results = pool.query("SELECT * FROM songs WHERE id = ?", [id])

  if (!results) return next(new AppError("No song found with this id", 404))
  response.status(200).json(results)
}
