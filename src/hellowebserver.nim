## hellowebserver.nim

import asynchttpserver, asyncdispatch
import hellowebserverpkg/submodule

var server = newAsyncHttpServer()
proc cb(req: Request) {.async.} =
  await req.respond(Http200, getWelcomeMessage())

when isMainModule:
    echo "WebServer Started visit http://localhost:8080/"
    echo "Control+C to interrupt."
    waitFor server.serve(Port(8080), cb)
