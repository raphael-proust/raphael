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



class type font = object  end
class type paint = object  end
class type common_attr = object  end
class type graphic_attr =
  object
    method fill : Js.js_string Js.t Js.prop
    method opacity : float Js.prop
    method rotation : int Js.prop
    method stroke : Js.js_string Js.t Js.prop
  end
class type basic_shape_attr =
  object
    method fill : Js.js_string Js.t Js.prop
    method opacity : float Js.prop
    method rotation : int Js.prop
    method stroke : Js.js_string Js.t Js.prop
  end
class type shape_attr =
  object
    method fill : Js.js_string Js.t Js.prop
    method opacity : float Js.prop
    method rotation : int Js.prop
    method stroke : Js.js_string Js.t Js.prop
  end
class type centered_attr =
  object method cx : int Js.prop method cy : int Js.prop end
class type dimensioned_attr =
  object method height : int Js.prop method width : int Js.prop end
class type positioned_attr =
  object method x : int Js.prop method y : int Js.prop end
class type circle_attr =
  object
    method cx : int Js.prop
    method cy : int Js.prop
    method fill : Js.js_string Js.t Js.prop
    method opacity : float Js.prop
    method r : int Js.prop
    method rotation : int Js.prop
    method stroke : Js.js_string Js.t Js.prop
  end
class type ellipse_attr =
  object
    method cx : int Js.prop
    method cy : int Js.prop
    method fill : Js.js_string Js.t Js.prop
    method opacity : float Js.prop
    method rotation : int Js.prop
    method rx : int Js.prop
    method ry : int Js.prop
    method stroke : Js.js_string Js.t Js.prop
  end
class type rect_attr =
  object
    method fill : Js.js_string Js.t Js.prop
    method height : int Js.prop
    method opacity : float Js.prop
    method rotation : int Js.prop
    method stroke : Js.js_string Js.t Js.prop
    method width : int Js.prop
    method x : int Js.prop
    method y : int Js.prop
  end
class type image_attr =
  object
    method fill : Js.js_string Js.t Js.prop
    method height : int Js.prop
    method opacity : float Js.prop
    method rotation : int Js.prop
    method src : Js.js_string Js.t Js.prop
    method stroke : Js.js_string Js.t Js.prop
    method width : int Js.prop
    method x : int Js.prop
    method y : int Js.prop
  end
class type path_attr =
  object
    method fill : Js.js_string Js.t Js.prop
    method opacity : float Js.prop
    method path : Js.js_string Js.t Js.prop
    method rotation : int Js.prop
    method stroke : Js.js_string Js.t Js.prop
  end
class type text_attr =
  object
    method fill : Js.js_string Js.t Js.prop
    method font : font Js.prop
    method opacity : float Js.prop
    method rotation : int Js.prop
    method stroke : Js.js_string Js.t Js.prop
    method x : int Js.prop
    method y : int Js.prop
  end
class type set_attr = object  end
