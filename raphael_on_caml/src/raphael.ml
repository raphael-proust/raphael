(* raphael_on_a_caml
 * Copyright (C) 2011 Raphaël Proust
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)

class type point = object

  method x: int Js.readonly_prop
  method y: int Js.readonly_prop
  method alpha: int Js.readonly_prop

end

class type bbox = object

  method x: int Js.readonly_prop
  method y: int Js.readonly_prop

  method width: int Js.readonly_prop
  method height: int Js.readonly_prop

end

(* Attributes *)
class type ['attr] with_attr = object
  method attr: 'attr Js.t Js.readonly_prop
  method animate: 'attr Js.t -> int -> unit Js.meth
  method animate_easing: 'attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
  method animate_callback: 'attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
  method animate_callbackeasing: 'attr Js.t -> int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
end


class type element = object

  method node: Dom.node Js.t Js.readonly_prop

  method paper: paper Js.t Js.readonly_prop

  method remove: unit -> unit Js.meth
  method hide: unit -> unit Js.meth
  method show: unit -> unit Js.meth

  method rotate: int -> unit Js.meth
  method rotate_absolute: int -> bool -> unit Js.meth
  method rotate_center: int -> int -> int -> unit Js.meth
  method translate: int -> int -> unit Js.meth
  method scale: int -> int -> int -> int -> unit Js.meth

  method getBBox: unit -> bbox Js.t Js.meth

  method toFront: unit -> unit Js.meth
  method toBack: unit -> unit Js.meth

  method insertBefore: element Js.t -> unit Js.meth
  method insertAfter: element Js.t -> unit Js.meth

  method clone: unit -> element Js.t Js.meth

end

and circle = object
  inherit element
  inherit [Svg.circle_attr] with_attr
end


and rect = object
  inherit element
  inherit [Svg.rect_attr] with_attr
end


and ellipse = object
  inherit element
  inherit [Svg.ellipse_attr] with_attr
end


and image = object
  inherit element
  inherit [Svg.image_attr] with_attr
end

and text = object
  inherit element
  inherit [Svg.text_attr] with_attr
end

and path = object

  inherit element
  inherit [Svg.path_attr] with_attr

  method getTotalLength: unit -> int Js.meth
  method getPointAtLength: int -> point Js.t Js.meth
  method getSubpath: int -> int -> path Js.t Js.meth

end

and set = object

  inherit element

  method push:   element Js.t -> unit Js.meth
  method push_2: element Js.t-> element Js.t-> unit Js.meth
  method push_3: element Js.t-> element Js.t-> element Js.t-> unit Js.meth
  method push_4: element Js.t-> element Js.t-> element Js.t-> element Js.t-> unit Js.meth
  method push_5: element Js.t-> element Js.t-> element Js.t-> element Js.t-> element Js.t-> unit Js.meth

  method items: element Js.t Js.js_array Js.t Js.readonly_prop
  method length: int Js.readonly_prop

end

and paper = object

  method circle: int -> int -> int -> circle Js.t Js.meth
  method rect: int -> int -> int -> int -> rect Js.t Js.meth
  method rect_rounded: int -> int -> int -> int -> int -> rect Js.t Js.meth
  method ellipse: int -> int -> int -> int -> ellipse Js.t Js.meth
  method image: Js.js_string Js.t -> int -> int -> int -> int -> image Js.t Js.meth
  method text: int -> int -> Js.js_string Js.t -> text Js.t Js.meth
  method path: Js.js_string Js.t -> path Js.t Js.meth

  method set: unit -> set Js.t Js.meth

  method clear: unit -> unit Js.meth

  method setSize: int -> int -> unit Js.meth

  (*TODO: Raphael functions (getRGB, angle, etc.) *)

  method getFont: Js.js_string Js.t -> Svg.font Js.t Js.meth
  method getFont_weighted: Js.js_string Js.t -> int -> Svg.font Js.t Js.meth
  method getFont_styled: Js.js_string Js.t -> int -> Js.js_string Js.t -> Svg.font Js.t Js.meth
  method getFont_stretched: Js.js_string Js.t -> int -> Js.js_string Js.t -> Js.js_string Js.t -> Svg.font Js.t Js.meth

  method print: int -> int -> Js.js_string Js.t -> Svg.font Js.t -> int -> set Js.t Js.meth

end

external raphael: Dom.node Js.t -> int -> int -> paper Js.t = "Raphael"
