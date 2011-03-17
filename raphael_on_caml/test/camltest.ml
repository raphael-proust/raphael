let log_success s =
  Firebug.console##log_2 (Js.string "\tSUCCESS: ", Js.string s)
let log_failure s =
  Firebug.console##log_2 (Js.string "\tFAILURE: ", Js.string s)

let log_start s =
  Firebug.console##log_2 (Js.string "START: ", Js.string s)
let log_stop s =
  Firebug.console##log_2 (Js.string "STOP: ", Js.string s)

let raw_log x =
  Firebug.console##log_2 (Js.string "\t\t", x)
let log s = raw_log (Js.string s)






let _ = log_start "Basic test"

let p = Raphael.raphael
          ((Js.Opt.get
             (Dom_html.document##getElementById(Js.string "canvasHolder"))
             (fun () -> failwith "toto")
          ) :> Dom.node Js.t)
          50 50
let _ = p##rect (10, 10, 30, 30)

let _ = log_stop "Basic test"
