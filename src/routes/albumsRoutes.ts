import express from "express"
import { getAlbumById, getAlbums } from "../controllers/albumController"

const router = express.Router()

router.get("/", getAlbums)
router.get("/:id", getAlbumById)

export default router
