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


class type ['attr] element = object ('self)

  (* The associated DOM node (if necessary) *)
  method node: Dom.node Js.t Js.readonly_prop

  (* To display or not to display... *)
  method remove: unit -> unit Js.meth
  method hide: unit -> unit Js.meth
  method show: unit -> unit Js.meth
  method toFront: unit -> unit Js.meth
  method toBack:  unit -> unit Js.meth
  method insertBefore: 'a element Js.t -> unit Js.meth
  method insertAfter:  'a element Js.t -> unit Js.meth


  (* Basic geometric transformation *)
  method rotate:          int -> unit Js.meth
  method rotate_absolute: int -> bool -> unit Js.meth
  method rotate_center:   int -> int -> int -> unit Js.meth
  method translate:       int -> int -> unit Js.meth
  method scale:           int -> int -> int -> int -> unit Js.meth

  (* The attributes of the object *)
  method attr: 'attr Js.t Js.readonly_prop

  (* Animation *)
  method animate:                'attr Js.t -> int -> unit Js.meth
  method animate_easing:         'attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
  method animate_callback:       'attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
  method animate_easingcallback: 'attr Js.t -> int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth

  (* Synchronized animation *)
  method animateWith:                'a element -> 'attr Js.t -> int -> unit Js.meth
  method animateWith_easing:         'a element -> 'attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
  method animateWith_callback:       'a element -> 'attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
  method animateWith_easingcallback: 'a element -> 'attr Js.t -> int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth

(*
 *)

(*
 *)

  (* Stop the animation *)
  method stop: unit -> unit Js.meth

  (* Event handler called at each step of the animation *)
  method onAnimation: (unit -> unit) Js.callback -> unit Js.meth

  (* The box the elements fits in *)
  method getBBox: unit -> bbox Js.t Js.meth

  (* Gimme moar! *)
  method clone: unit -> 'self Js.t Js.meth

  (* Three stage dragging *)
  method drag: (unit -> unit) Js.callback -> (int -> int -> unit) Js.callback -> (unit -> unit) Js.callback -> unit Js.meth

  (* Wrappers for other event handlers *)
  method click  : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method unclick: (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method dblclick  : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method undblclick: (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method mousedown  : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method unmousedown: (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method mousemove  : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method unmousemove: (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method mouseout  : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method unmouseout: (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method mouseover  : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method unmouseover: (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method mouseup  : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method unmouseup: (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method hover  : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  method unhover: (Dom_html.mouseEvent -> unit) Js.callback -> unit

end

class type rechack = object

  method paper: paper Js.t Js.readonly_prop

  (* Animation along a path *)
  method animateAlong:                path -> int -> unit Js.meth
  method animateAlong_rotate:         path -> int -> bool Js.t -> unit Js.meth
  method animateAlong_callback:       path -> int -> (unit -> unit) Js.callback -> unit Js.meth
  method animateAlong_rotatecallback: path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth

  (* Animation along a path reversed *)
  method animateAlongBack:                path -> int -> unit Js.meth
  method animateAlongBack_rotate:         path -> int -> bool Js.t -> unit Js.meth
  method animateAlongBack_callback:       path -> int -> (unit -> unit) Js.callback -> unit Js.meth
  method animateAlongBack_rotatecallback: path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth

end

and circle = object
  inherit [Svg.circle_attr] element
  inherit rechack
end

and rect = object
  inherit [Svg.rect_attr] element
  inherit rechack
end

and ellipse = object
  inherit [Svg.ellipse_attr] element
  inherit rechack
end

and image = object
  inherit [Svg.image_attr] element
  inherit rechack
end

and text = object
  inherit [Svg.text_attr] element
  inherit rechack
end

and path = object

  inherit [Svg.path_attr] element
  inherit rechack

  method getTotalLength: unit -> int Js.meth
  method getPointAtLength: int -> point Js.t Js.meth
  method getSubpath: int -> int -> path Js.t Js.meth

end

and set = object

  inherit [Svg.set_attr] element
  inherit rechack

  method push:   'a element Js.t -> unit Js.meth
  method push_2: 'a element Js.t-> 'a element Js.t-> unit Js.meth
  method push_3: 'a element Js.t-> 'a element Js.t-> 'a element Js.t-> unit Js.meth
  method push_4: 'a element Js.t-> 'a element Js.t-> 'a element Js.t-> 'a element Js.t-> unit Js.meth
  method push_5: 'a element Js.t-> 'a element Js.t-> 'a element Js.t-> 'a element Js.t-> 'a element Js.t-> unit Js.meth

  method items: 'a element Js.t Js.js_array Js.t Js.readonly_prop
  method length: int Js.readonly_prop

end

and paper = object

  method circle:       int -> int -> int -> circle Js.t Js.meth

  method ellipse:      int -> int -> int -> int -> ellipse Js.t Js.meth

  method rect:         int -> int -> int -> int        -> rect Js.t Js.meth
  method rect_rounded: int -> int -> int -> int -> int -> rect Js.t Js.meth

  method image:        Js.js_string Js.t -> int -> int -> int -> int -> image Js.t Js.meth

  method text:         int -> int -> Js.js_string Js.t -> text Js.t Js.meth

  method path:         Js.js_string Js.t -> path Js.t Js.meth

  method set: unit -> set Js.t Js.meth

  method clear: unit -> unit Js.meth

  method setSize: int -> int -> unit Js.meth

  method getRGB: Js.js_string -> Svg.paint Js.t Js.meth

  method angle_hz: int -> int -> int -> int -> int Js.meth
  method angle:    int -> int -> int -> int -> int -> int -> int Js.meth

  method rad: int -> int Js.meth
  method deg: int -> int Js.meth

  method snapTo_multiple: int -> int -> int Js.meth
  method snapTo: int Js.js_array Js.t -> int -> int Js.meth

  method getFont: Js.js_string Js.t -> Svg.font Js.t Js.meth
  method getFont_weighted: Js.js_string Js.t -> int -> Svg.font Js.t Js.meth
  method getFont_styled: Js.js_string Js.t -> int -> Js.js_string Js.t -> Svg.font Js.t Js.meth
  method getFont_stretched: Js.js_string Js.t -> int -> Js.js_string Js.t -> Js.js_string Js.t -> Svg.font Js.t Js.meth

  method print: int -> int -> Js.js_string Js.t -> Svg.font Js.t -> int -> set Js.t Js.meth

end

let element_of_circle : circle Js.t -> Svg.circle_attr element Js.t = Js.Unsafe.coerce
let circle_of_element : Svg.circle_attr element Js.t ->  circle Js.t = Js.Unsafe.coerce
let element_of_ellipse : ellipse Js.t -> Svg.ellipse_attr element Js.t = Js.Unsafe.coerce
let ellipse_of_element : Svg.ellipse_attr element Js.t ->  ellipse Js.t = Js.Unsafe.coerce
let element_of_rect : rect Js.t -> Svg.rect_attr element Js.t = Js.Unsafe.coerce
let rect_of_element : Svg.rect_attr element Js.t ->  rect Js.t = Js.Unsafe.coerce
let element_of_image : image Js.t -> Svg.image_attr element Js.t = Js.Unsafe.coerce
let image_of_element : Svg.image_attr element Js.t ->  image Js.t = Js.Unsafe.coerce
let element_of_text : text Js.t -> Svg.text_attr element Js.t = Js.Unsafe.coerce
let text_of_element : Svg.text_attr element Js.t ->  text Js.t = Js.Unsafe.coerce
let element_of_path : path Js.t -> Svg.path_attr element Js.t = Js.Unsafe.coerce
let path_of_element : Svg.path_attr element Js.t ->  path Js.t = Js.Unsafe.coerce
let element_of_set : set Js.t -> Svg.set_attr element Js.t = Js.Unsafe.coerce
let set_of_element : Svg.set_attr element Js.t -> set Js.t = Js.Unsafe.coerce

external raphael: Dom.node Js.t -> int -> int -> paper Js.t = "Raphael"
