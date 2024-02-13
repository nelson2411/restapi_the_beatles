export interface StudioAlbum {
  album_id: number
  title: string
  Length: string
  releasedDate: string
  numberOfTracks: number
  label: string
}

export interface LiveAlbum {
  album_id: number
  title: string
  Length: string
  date: string
  location: string
  country: string
}

export interface CompilationAlbum {
  album_id: number
  title: string
  Length: string
  releasedDate: string
  numberOfTracks: number
  label: string
}

interface Author {
  name: string
}

export interface Song {
  song_id: number
  title: string
  length: string
  author: Author[] // Array of authors
  album_id: number
}
