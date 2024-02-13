import express from "express"
import {
  getSongById,
  getSongsByAlbumId,
  getSongs,
} from "../controllers/songsController"

const router = express.Router()

router.get("/", getSongs)
router.get("/:album_id", getSongsByAlbumId)
router.get("/:id", getSongById)

export default router
