class AppError extends Error {
  public status: "fail" | "error" // This is used to check if the error is a fail or an error
  public isOperational: boolean // This is used to check if the error is operational or not
  constructor(message: string, public statusCode: number) {
    super(message)

    this.statusCode = statusCode
    this.status = `${statusCode}`.startsWith("4") ? "fail" : "error"
    this.isOperational = true

    Error.captureStackTrace(this, this.constructor)
  }
}

export default AppError
