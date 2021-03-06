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

(* These bindings are not complete and are not intended as such. They are only
 * provided so that it's possible to use the classes defined in Raphael.
 *
 * All of this module was written using the content of:
 * http://www.w3.org/TR/SVG/ and http://raphaeljs.com/reference.html
 *)

open Js

(*TODO: font and paint classes *)
class type font = object
end

(* Super classes: just there as a coding good practice. *)

class type common_attr = object
end

class type graphic_attr = object
  method opacity: float prop
  method rotation: int prop
  method fill: CSS.Color.js_t prop
  method stroke: CSS.Color.js_t prop
end

(* Attributes of shapes *)
class type shape_attr = object
  inherit graphic_attr
end

class type centered_attr = object
  method cx: int prop
  method cy: int prop
end

class type dimensioned_attr = object
  method width: int prop
  method height: int prop
end

class type positioned_attr = object
  method x: int prop
  method y: int prop
end



(* Attributes for each element class of Raphael *)

class type circle_attr = object
  inherit shape_attr
  inherit centered_attr

  method r: int prop
end

class type ellipse_attr = object
  inherit shape_attr
  inherit centered_attr

  method rx: int prop
  method ry: int prop
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

  method src: js_string t prop

end

class type path_attr = object
  inherit shape_attr

  method path: js_string t prop
end

class type text_attr = object
  inherit graphic_attr
  inherit positioned_attr

  method font: font prop
end

class type set_attr = object
  inherit positioned_attr
  inherit dimensioned_attr
end

