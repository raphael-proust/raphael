(* raphael_on_a_caml
 * Copyright (C) 2011 Raphaël Proust
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)



class type font = object end


class type graphic_attr =
object
  method opacity: float Js.prop
  method rotation: int Js.prop
  method fill: CSS.js_color Js.prop
  method stroke: CSS.js_color Js.prop
end

(* Attributes of shapes *)
class type shape_attr = object
  inherit graphic_attr
end

(* Attributes depending on geometrical properties *)
class type centered_attr = object
  method cx: int Js.prop
  method cy: int Js.prop
end

class type dimensioned_attr = object
  method width:  int Js.prop
  method height: int Js.prop
end

class type positioned_attr = object
  method x: int Js.prop
  method y: int Js.prop
end



(* Attributes for each element class of Raphael *)

class type circle_attr = object
  inherit shape_attr
  inherit centered_attr

  method r: int Js.prop
end

class type ellipse_attr = object
  inherit shape_attr
  inherit centered_attr

  method rx: int Js.prop
  method ry: int Js.prop
end

class type rect_attr = object
  inherit shape_attr
  inherit dimensioned_attr
  inherit positioned_attr
end

class type image_attr = object
  inherit shape_attr
  inherit dimensioned_attr
  inherit positioned_attr

  method src: Js.js_string Js.t Js.prop
end

class type path_attr = object
  inherit shape_attr

  method path: Js.js_string Js.t Js.prop
end

class type text_attr = object
  inherit graphic_attr
  inherit positioned_attr

  method font: font Js.prop
end

class type set_attr = object
  inherit positioned_attr
  inherit dimensioned_attr
end

