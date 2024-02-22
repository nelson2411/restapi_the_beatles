import { Request, Response, NextFunction } from "express"

// This function is a wrapper around the async function that we want to catch errors from.
// It takes a function as an argument and returns a new function that will call the original function and catch any errors that it throws.
// It then passes the error to the next middleware function.

type AsyncFunction = (
  req: Request,
  res: Response,
  next: NextFunction
) => Promise<any>

export = (fn: AsyncFunction) => {
  return (req: Request, res: Response, next: NextFunction) => {
    fn(req, res, next).catch(next)
  }
}
