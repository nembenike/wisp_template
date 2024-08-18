import app/router
import gleam/erlang/process
import mist
import wisp

pub fn main() {
  // Logging
  wisp.configure_logger()

  // Secret key for wisp
  let secret_key_base = wisp.random_string(64)

  // Starting the mist web server
  let assert Ok(_) =
    wisp.mist_handler(router.handle_request, secret_key_base)
    |> mist.new
    |> mist.port(3000)
    |> mist.start_http

  process.sleep_forever()
}
