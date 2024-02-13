import { Request, Response } from "express"
import { pool } from "../db"

export const getSongs = (request: Request, response: Response) => {
  pool.query("SELECT * FROM songs", (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results)
  })
}

// get songs by album_id

export const getSongsByAlbumId = (request: Request, response: Response) => {
  const album_id = parseInt(request.params.album_id)
  pool.query(
    "SELECT * FROM songs WHERE album_id = ?",
    [album_id],
    (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results)
    }
  )
}

// get song by id

export const getSongById = (request: Request, response: Response) => {
  const id = parseInt(request.params.id)
  pool.query("SELECT * FROM songs WHERE id = ?", [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results)
  })
}
