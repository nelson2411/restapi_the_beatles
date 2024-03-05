import express from "express"
import {
  getSongById,
  getSongsByAlbumId,
  getSongs,
} from "../controllers/songsController"

const router = express.Router()

router.get("/", getSongs)
router.get("/:song_id", getSongById)
router.get("/album/:album_id", getSongsByAlbumId)

export default router
