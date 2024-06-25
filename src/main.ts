import express from 'express'
import path from 'node:path'
import { parseArgs, type ParseArgsConfig } from 'node:util'

const __dirname = import.meta.dirname

const argsOptions = {
  port: {
    type: "string"
  }
} satisfies ParseArgsConfig['options']

const ARGS = parseArgs({ options: argsOptions, args: process.argv.slice(2) })
const PORT = ARGS.values.port ?? 3003

const app = express()

app.use(express.static(path.resolve(__dirname, "static")))

app.listen(PORT, () => {
  console.log(`Listening on port: ${PORT}`)
})
