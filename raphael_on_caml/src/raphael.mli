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

class type point =
  object
    method alpha : int Js.readonly_prop
    method x : int Js.readonly_prop
    method y : int Js.readonly_prop
  end
class type bbox =
  object
    method height : int Js.readonly_prop
    method width : int Js.readonly_prop
    method x : int Js.readonly_prop
    method y : int Js.readonly_prop
  end
class type ['a] element =
  object ('b)
    method animate : 'a Js.t -> int -> unit Js.meth
    method animateWith : 'a element -> 'a Js.t -> int -> unit Js.meth
    method animateWith_callback :
      'a element ->
      'a Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith_easing :
      'a element -> 'a Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animateWith_easingcallback :
      'a element ->
      'a Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_callback :
      'a Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_easing :
      'a Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animate_easingcallback :
      'a Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method attr : 'a Js.t Js.readonly_prop
    method click : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method clone : unit -> 'b Js.t Js.meth
    method dblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method drag :
      (unit -> unit) Js.callback ->
      (int -> int -> unit) Js.callback ->
      (unit -> unit) Js.callback -> unit Js.meth
    method getBBox : unit -> bbox Js.t Js.meth
    method hide : unit -> unit Js.meth
    method hover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method insertAfter : 'a element Js.t -> unit Js.meth
    method insertBefore : 'a element Js.t -> unit Js.meth
    method mousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method node : Dom.node Js.t Js.readonly_prop
    method onAnimation : (unit -> unit) Js.callback -> unit Js.meth
    method remove : unit -> unit Js.meth
    method rotate : int -> unit Js.meth
    method rotate_absolute : int -> bool -> unit Js.meth
    method rotate_center : int -> int -> int -> unit Js.meth
    method scale : int -> int -> int -> int -> unit Js.meth
    method show : unit -> unit Js.meth
    method stop : unit -> unit Js.meth
    method toBack : unit -> unit Js.meth
    method toFront : unit -> unit Js.meth
    method translate : int -> int -> unit Js.meth
    method unclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method undblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unhover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  end
class type circle =
  object ('a)
    method animate : Svg.circle_attr Js.t -> int -> unit Js.meth
    method animateAlong : path -> int -> unit Js.meth
    method animateAlongBack : path -> int -> unit Js.meth
    method animateAlongBack_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlongBack_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlongBack_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlong_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith :
      Svg.circle_attr element -> Svg.circle_attr Js.t -> int -> unit Js.meth
    method animateWith_callback :
      Svg.circle_attr element ->
      Svg.circle_attr Js.t ->
      int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith_easing :
      Svg.circle_attr element ->
      Svg.circle_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animateWith_easingcallback :
      Svg.circle_attr element ->
      Svg.circle_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_callback :
      Svg.circle_attr Js.t ->
      int -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_easing :
      Svg.circle_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animate_easingcallback :
      Svg.circle_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method attr : Svg.circle_attr Js.t Js.readonly_prop
    method click : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method clone : unit -> 'a Js.t Js.meth
    method dblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method drag :
      (unit -> unit) Js.callback ->
      (int -> int -> unit) Js.callback ->
      (unit -> unit) Js.callback -> unit Js.meth
    method getBBox : unit -> bbox Js.t Js.meth
    method hide : unit -> unit Js.meth
    method hover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method insertAfter : Svg.circle_attr element Js.t -> unit Js.meth
    method insertBefore : Svg.circle_attr element Js.t -> unit Js.meth
    method mousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method node : Dom.node Js.t Js.readonly_prop
    method onAnimation : (unit -> unit) Js.callback -> unit Js.meth
    method paper : paper Js.t Js.readonly_prop
    method remove : unit -> unit Js.meth
    method rotate : int -> unit Js.meth
    method rotate_absolute : int -> bool -> unit Js.meth
    method rotate_center : int -> int -> int -> unit Js.meth
    method scale : int -> int -> int -> int -> unit Js.meth
    method show : unit -> unit Js.meth
    method stop : unit -> unit Js.meth
    method toBack : unit -> unit Js.meth
    method toFront : unit -> unit Js.meth
    method translate : int -> int -> unit Js.meth
    method unclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method undblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unhover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  end
and rect =
  object ('a)
    method animate : Svg.rect_attr Js.t -> int -> unit Js.meth
    method animateAlong : path -> int -> unit Js.meth
    method animateAlongBack : path -> int -> unit Js.meth
    method animateAlongBack_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlongBack_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlongBack_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlong_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith :
      Svg.rect_attr element -> Svg.rect_attr Js.t -> int -> unit Js.meth
    method animateWith_callback :
      Svg.rect_attr element ->
      Svg.rect_attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith_easing :
      Svg.rect_attr element ->
      Svg.rect_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animateWith_easingcallback :
      Svg.rect_attr element ->
      Svg.rect_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_callback :
      Svg.rect_attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_easing :
      Svg.rect_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animate_easingcallback :
      Svg.rect_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method attr : Svg.rect_attr Js.t Js.readonly_prop
    method click : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method clone : unit -> 'a Js.t Js.meth
    method dblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method drag :
      (unit -> unit) Js.callback ->
      (int -> int -> unit) Js.callback ->
      (unit -> unit) Js.callback -> unit Js.meth
    method getBBox : unit -> bbox Js.t Js.meth
    method hide : unit -> unit Js.meth
    method hover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method insertAfter : Svg.rect_attr element Js.t -> unit Js.meth
    method insertBefore : Svg.rect_attr element Js.t -> unit Js.meth
    method mousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method node : Dom.node Js.t Js.readonly_prop
    method onAnimation : (unit -> unit) Js.callback -> unit Js.meth
    method paper : paper Js.t Js.readonly_prop
    method remove : unit -> unit Js.meth
    method rotate : int -> unit Js.meth
    method rotate_absolute : int -> bool -> unit Js.meth
    method rotate_center : int -> int -> int -> unit Js.meth
    method scale : int -> int -> int -> int -> unit Js.meth
    method show : unit -> unit Js.meth
    method stop : unit -> unit Js.meth
    method toBack : unit -> unit Js.meth
    method toFront : unit -> unit Js.meth
    method translate : int -> int -> unit Js.meth
    method unclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method undblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unhover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  end
and ellipse =
  object ('a)
    method animate : Svg.ellipse_attr Js.t -> int -> unit Js.meth
    method animateAlong : path -> int -> unit Js.meth
    method animateAlongBack : path -> int -> unit Js.meth
    method animateAlongBack_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlongBack_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlongBack_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlong_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith :
      Svg.ellipse_attr element ->
      Svg.ellipse_attr Js.t -> int -> unit Js.meth
    method animateWith_callback :
      Svg.ellipse_attr element ->
      Svg.ellipse_attr Js.t ->
      int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith_easing :
      Svg.ellipse_attr element ->
      Svg.ellipse_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animateWith_easingcallback :
      Svg.ellipse_attr element ->
      Svg.ellipse_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_callback :
      Svg.ellipse_attr Js.t ->
      int -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_easing :
      Svg.ellipse_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animate_easingcallback :
      Svg.ellipse_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method attr : Svg.ellipse_attr Js.t Js.readonly_prop
    method click : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method clone : unit -> 'a Js.t Js.meth
    method dblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method drag :
      (unit -> unit) Js.callback ->
      (int -> int -> unit) Js.callback ->
      (unit -> unit) Js.callback -> unit Js.meth
    method getBBox : unit -> bbox Js.t Js.meth
    method hide : unit -> unit Js.meth
    method hover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method insertAfter : Svg.ellipse_attr element Js.t -> unit Js.meth
    method insertBefore : Svg.ellipse_attr element Js.t -> unit Js.meth
    method mousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method node : Dom.node Js.t Js.readonly_prop
    method onAnimation : (unit -> unit) Js.callback -> unit Js.meth
    method paper : paper Js.t Js.readonly_prop
    method remove : unit -> unit Js.meth
    method rotate : int -> unit Js.meth
    method rotate_absolute : int -> bool -> unit Js.meth
    method rotate_center : int -> int -> int -> unit Js.meth
    method scale : int -> int -> int -> int -> unit Js.meth
    method show : unit -> unit Js.meth
    method stop : unit -> unit Js.meth
    method toBack : unit -> unit Js.meth
    method toFront : unit -> unit Js.meth
    method translate : int -> int -> unit Js.meth
    method unclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method undblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unhover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  end
and image =
  object ('a)
    method animate : Svg.image_attr Js.t -> int -> unit Js.meth
    method animateAlong : path -> int -> unit Js.meth
    method animateAlongBack : path -> int -> unit Js.meth
    method animateAlongBack_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlongBack_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlongBack_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlong_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith :
      Svg.image_attr element -> Svg.image_attr Js.t -> int -> unit Js.meth
    method animateWith_callback :
      Svg.image_attr element ->
      Svg.image_attr Js.t ->
      int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith_easing :
      Svg.image_attr element ->
      Svg.image_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animateWith_easingcallback :
      Svg.image_attr element ->
      Svg.image_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_callback :
      Svg.image_attr Js.t ->
      int -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_easing :
      Svg.image_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animate_easingcallback :
      Svg.image_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method attr : Svg.image_attr Js.t Js.readonly_prop
    method click : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method clone : unit -> 'a Js.t Js.meth
    method dblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method drag :
      (unit -> unit) Js.callback ->
      (int -> int -> unit) Js.callback ->
      (unit -> unit) Js.callback -> unit Js.meth
    method getBBox : unit -> bbox Js.t Js.meth
    method hide : unit -> unit Js.meth
    method hover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method insertAfter : Svg.image_attr element Js.t -> unit Js.meth
    method insertBefore : Svg.image_attr element Js.t -> unit Js.meth
    method mousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method node : Dom.node Js.t Js.readonly_prop
    method onAnimation : (unit -> unit) Js.callback -> unit Js.meth
    method paper : paper Js.t Js.readonly_prop
    method remove : unit -> unit Js.meth
    method rotate : int -> unit Js.meth
    method rotate_absolute : int -> bool -> unit Js.meth
    method rotate_center : int -> int -> int -> unit Js.meth
    method scale : int -> int -> int -> int -> unit Js.meth
    method show : unit -> unit Js.meth
    method stop : unit -> unit Js.meth
    method toBack : unit -> unit Js.meth
    method toFront : unit -> unit Js.meth
    method translate : int -> int -> unit Js.meth
    method unclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method undblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unhover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  end
and text =
  object ('a)
    method animate : Svg.text_attr Js.t -> int -> unit Js.meth
    method animateAlong : path -> int -> unit Js.meth
    method animateAlongBack : path -> int -> unit Js.meth
    method animateAlongBack_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlongBack_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlongBack_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlong_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith :
      Svg.text_attr element -> Svg.text_attr Js.t -> int -> unit Js.meth
    method animateWith_callback :
      Svg.text_attr element ->
      Svg.text_attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith_easing :
      Svg.text_attr element ->
      Svg.text_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animateWith_easingcallback :
      Svg.text_attr element ->
      Svg.text_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_callback :
      Svg.text_attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_easing :
      Svg.text_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animate_easingcallback :
      Svg.text_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method attr : Svg.text_attr Js.t Js.readonly_prop
    method click : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method clone : unit -> 'a Js.t Js.meth
    method dblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method drag :
      (unit -> unit) Js.callback ->
      (int -> int -> unit) Js.callback ->
      (unit -> unit) Js.callback -> unit Js.meth
    method getBBox : unit -> bbox Js.t Js.meth
    method hide : unit -> unit Js.meth
    method hover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method insertAfter : Svg.text_attr element Js.t -> unit Js.meth
    method insertBefore : Svg.text_attr element Js.t -> unit Js.meth
    method mousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method node : Dom.node Js.t Js.readonly_prop
    method onAnimation : (unit -> unit) Js.callback -> unit Js.meth
    method paper : paper Js.t Js.readonly_prop
    method remove : unit -> unit Js.meth
    method rotate : int -> unit Js.meth
    method rotate_absolute : int -> bool -> unit Js.meth
    method rotate_center : int -> int -> int -> unit Js.meth
    method scale : int -> int -> int -> int -> unit Js.meth
    method show : unit -> unit Js.meth
    method stop : unit -> unit Js.meth
    method toBack : unit -> unit Js.meth
    method toFront : unit -> unit Js.meth
    method translate : int -> int -> unit Js.meth
    method unclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method undblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unhover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  end
and path =
  object ('a)
    method animate : Svg.path_attr Js.t -> int -> unit Js.meth
    method animateAlong : path -> int -> unit Js.meth
    method animateAlongBack : path -> int -> unit Js.meth
    method animateAlongBack_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlongBack_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlongBack_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlong_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith :
      Svg.path_attr element -> Svg.path_attr Js.t -> int -> unit Js.meth
    method animateWith_callback :
      Svg.path_attr element ->
      Svg.path_attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith_easing :
      Svg.path_attr element ->
      Svg.path_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animateWith_easingcallback :
      Svg.path_attr element ->
      Svg.path_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_callback :
      Svg.path_attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_easing :
      Svg.path_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animate_easingcallback :
      Svg.path_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method attr : Svg.path_attr Js.t Js.readonly_prop
    method click : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method clone : unit -> 'a Js.t Js.meth
    method dblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method drag :
      (unit -> unit) Js.callback ->
      (int -> int -> unit) Js.callback ->
      (unit -> unit) Js.callback -> unit Js.meth
    method getBBox : unit -> bbox Js.t Js.meth
    method getPointAtLength : int -> point Js.t Js.meth
    method getSubpath : int -> int -> path Js.t Js.meth
    method getTotalLength : unit -> int Js.meth
    method hide : unit -> unit Js.meth
    method hover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method insertAfter : Svg.path_attr element Js.t -> unit Js.meth
    method insertBefore : Svg.path_attr element Js.t -> unit Js.meth
    method mousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method node : Dom.node Js.t Js.readonly_prop
    method onAnimation : (unit -> unit) Js.callback -> unit Js.meth
    method paper : paper Js.t Js.readonly_prop
    method remove : unit -> unit Js.meth
    method rotate : int -> unit Js.meth
    method rotate_absolute : int -> bool -> unit Js.meth
    method rotate_center : int -> int -> int -> unit Js.meth
    method scale : int -> int -> int -> int -> unit Js.meth
    method show : unit -> unit Js.meth
    method stop : unit -> unit Js.meth
    method toBack : unit -> unit Js.meth
    method toFront : unit -> unit Js.meth
    method translate : int -> int -> unit Js.meth
    method unclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method undblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unhover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  end
and set =
  object ('a)
    method animate : Svg.set_attr Js.t -> int -> unit Js.meth
    method animateAlong : path -> int -> unit Js.meth
    method animateAlongBack : path -> int -> unit Js.meth
    method animateAlongBack_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlongBack_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlongBack_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_callback :
      path -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateAlong_rotate : path -> int -> bool Js.t -> unit Js.meth
    method animateAlong_rotatecallback :
      path -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith :
      Svg.set_attr element -> Svg.set_attr Js.t -> int -> unit Js.meth
    method animateWith_callback :
      Svg.set_attr element ->
      Svg.set_attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animateWith_easing :
      Svg.set_attr element ->
      Svg.set_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animateWith_easingcallback :
      Svg.set_attr element ->
      Svg.set_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_callback :
      Svg.set_attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
    method animate_easing :
      Svg.set_attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
    method animate_easingcallback :
      Svg.set_attr Js.t ->
      int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth
    method attr : Svg.set_attr Js.t Js.readonly_prop
    method click : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method clone : unit -> 'a Js.t Js.meth
    method dblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method drag :
      (unit -> unit) Js.callback ->
      (int -> int -> unit) Js.callback ->
      (unit -> unit) Js.callback -> unit Js.meth
    method getBBox : unit -> bbox Js.t Js.meth
    method hide : unit -> unit Js.meth
    method hover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method insertAfter : Svg.set_attr element Js.t -> unit Js.meth
    method insertBefore : Svg.set_attr element Js.t -> unit Js.meth
    method items : 'b element Js.t Js.js_array Js.t Js.readonly_prop
    method length : int Js.readonly_prop
    method mousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method mouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method node : Dom.node Js.t Js.readonly_prop
    method onAnimation : (unit -> unit) Js.callback -> unit Js.meth
    method paper : paper Js.t Js.readonly_prop
    method push : 'c element Js.t -> unit Js.meth
    method push_2 : 'd element Js.t -> 'd element Js.t -> unit Js.meth
    method push_3 :
      'e element Js.t -> 'e element Js.t -> 'e element Js.t -> unit Js.meth
    method push_4 :
      'f element Js.t ->
      'f element Js.t -> 'f element Js.t -> 'f element Js.t -> unit Js.meth
    method push_5 :
      'g element Js.t ->
      'g element Js.t ->
      'g element Js.t -> 'g element Js.t -> 'g element Js.t -> unit Js.meth
    method remove : unit -> unit Js.meth
    method rotate : int -> unit Js.meth
    method rotate_absolute : int -> bool -> unit Js.meth
    method rotate_center : int -> int -> int -> unit Js.meth
    method scale : int -> int -> int -> int -> unit Js.meth
    method show : unit -> unit Js.meth
    method stop : unit -> unit Js.meth
    method toBack : unit -> unit Js.meth
    method toFront : unit -> unit Js.meth
    method translate : int -> int -> unit Js.meth
    method unclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method undblclick : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unhover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousedown : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmousemove : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseout : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseover : (Dom_html.mouseEvent -> unit) Js.callback -> unit
    method unmouseup : (Dom_html.mouseEvent -> unit) Js.callback -> unit
  end
and paper =
  object
    method angle : int -> int -> int -> int -> int -> int -> int Js.meth
    method angle_hz : int -> int -> int -> int -> int Js.meth
    method circle : int -> int -> int -> circle Js.t Js.meth
    method clear : unit -> unit Js.meth
    method deg : int -> int Js.meth
    method ellipse : int -> int -> int -> int -> ellipse Js.t Js.meth
    method getFont : Js.js_string Js.t -> Svg.font Js.t Js.meth
    method getFont_stretched :
      Js.js_string Js.t ->
      int -> Js.js_string Js.t -> Js.js_string Js.t -> Svg.font Js.t Js.meth
    method getFont_styled :
      Js.js_string Js.t -> int -> Js.js_string Js.t -> Svg.font Js.t Js.meth
    method getFont_weighted :
      Js.js_string Js.t -> int -> Svg.font Js.t Js.meth
    method getRGB : Js.js_string -> Svg.paint Js.t Js.meth
    method image :
      Js.js_string Js.t -> int -> int -> int -> int -> image Js.t Js.meth
    method path : Js.js_string Js.t -> path Js.t Js.meth
    method print :
      int ->
      int -> Js.js_string Js.t -> Svg.font Js.t -> int -> set Js.t Js.meth
    method rad : int -> int Js.meth
    method rect : int -> int -> int -> int -> rect Js.t Js.meth
    method rect_rounded :
      int -> int -> int -> int -> int -> rect Js.t Js.meth
    method set : unit -> set Js.t Js.meth
    method setSize : int -> int -> unit Js.meth
    method snapTo : int Js.js_array Js.t -> int -> int Js.meth
    method snapTo_multiple : int -> int -> int Js.meth
    method text : int -> int -> Js.js_string Js.t -> text Js.t Js.meth
  end
val element_of_circle : circle Js.t -> Svg.circle_attr element Js.t
val circle_of_element : Svg.circle_attr element Js.t -> circle Js.t
val element_of_ellipse : ellipse Js.t -> Svg.ellipse_attr element Js.t
val ellipse_of_element : Svg.ellipse_attr element Js.t -> ellipse Js.t
val element_of_rect : rect Js.t -> Svg.rect_attr element Js.t
val rect_of_element : Svg.rect_attr element Js.t -> rect Js.t
val element_of_image : image Js.t -> Svg.image_attr element Js.t
val image_of_element : Svg.image_attr element Js.t -> image Js.t
val element_of_text : text Js.t -> Svg.text_attr element Js.t
val text_of_element : Svg.text_attr element Js.t -> text Js.t
val element_of_path : path Js.t -> Svg.path_attr element Js.t
val path_of_element : Svg.path_attr element Js.t -> path Js.t
val element_of_set : set Js.t -> Svg.set_attr element Js.t
val set_of_element : Svg.set_attr element Js.t -> set Js.t
external raphael : Dom.node Js.t -> int -> int -> paper Js.t = "Raphael"
