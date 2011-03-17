
class type element = object

  method node: Dom.node Js.t Js.readonly_prop

  method paper: paper Js.readonly_prop

  method remove: unit -> unit Js.meth
  method hide: unit -> unit Js.meth
  method show: unit -> unit Js.meth

  method rotate: int -> int -> int -> unit Js.meth
  method translate: int -> int -> unit Js.meth
  method scale: int -> int -> int -> int -> unit Js.meth

  (*TODO*)

end

  and set = object

  inherit element

  method push: element -> unit Js.meth
  method push_2: element -> element -> unit Js.meth
  method push_3: element -> element -> element -> unit Js.meth
  method push_4: element -> element -> element -> element -> unit Js.meth
  method push_5: element -> element -> element -> element -> element -> unit Js.meth
  method push_6: element -> element -> element -> element -> element -> element -> unit Js.meth
  method push_7: element -> element -> element -> element -> element -> element -> element -> unit Js.meth

end

  and paper = object

  method circle: int -> int -> int -> element Js.meth
  method rect: int -> int -> int -> int -> element Js.meth
  method rounded_rect: int -> int -> int -> int -> int -> element Js.meth
  method ellipse: int -> int -> int -> int -> element Js.meth
  method image: Url.url -> int -> int -> int -> int -> element Js.meth
  method text: int -> int -> Js.js_string -> element Js.meth
  method path: Js.js_string -> element Js.meth

  method set: unit -> set Js.meth

  method clear: unit -> unit Js.meth

end

external raphael: Dom.node Js.t -> int -> int -> paper Js.t = "caml_js_raphael"
