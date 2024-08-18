import app/web
import gleam/string_builder
import wisp.{type Request, type Response}

// HTTP request handler
pub fn handle_request(req: Request) -> Response {
  // Apply middleware
  use _req <- web.middleware(req)

  let body = string_builder.from_string("<h1>Hello, World!</h1>")

  // Returns 200 OK response with body
  wisp.html_response(body, 200)
}
