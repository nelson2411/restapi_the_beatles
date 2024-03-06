/*
No PUT, Patch, or DELETE methods are going to be defined for this controller.
*/

import { Request, Response, NextFunction } from "express"
import { pool } from "../db"
import AppError from "../utils/appError"
import catchASync from "../utils/catchAsync"

// get all songs
export const getSongs = catchASync(
  async (request: Request, response: Response) => {
    const results = await pool.query("SELECT * FROM songs")

    if ((results as any).length === 0) {
      throw new AppError("No songs found", 404)
    }

    response.status(200).json(results[0])
  }
)
// get songs by album_id

export const getSongsByAlbumId = catchASync(
  async (request: Request, response: Response) => {
    const album_id = parseInt(request.params.album_id)
    const results = await pool.query("SELECT * FROM songs WHERE album_id = ?", [
      album_id,
    ])

    if ((results as any).length === 0) {
      throw new AppError("No songs found for this album", 404)
    }

    response.status(200).json(results[0])
  }
)

// get song by id

export const getSongById = catchASync(
  async (request: Request, response: Response) => {
    const song_id = parseInt(request.params.song_id)
    const results = await pool.query("SELECT * FROM songs WHERE id = ?", [
      song_id,
    ])

    if ((results as any).length === 0) {
      throw new AppError("No song found with this id", 404)
    }

    response.status(200).json(results[0])
  }
)
