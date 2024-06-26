import express from 'express'
import path from 'node:path'
import morgan from 'morgan'
import { parseArgs, type ParseArgsConfig } from 'node:util'

const __dirname = import.meta.dirname

const ARGS = parseArgs({ options: {
  port: {
    type: "string"
  }
}, args: process.argv.slice(2) })
const PORT = ARGS.values.port ?? 3003

const app = express()

app.use(morgan("short"))
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(express.static(path.resolve(__dirname, "static")))

app.listen(PORT, () => {
  console.log(`Listening on port: ${PORT}`)
})

export default app

