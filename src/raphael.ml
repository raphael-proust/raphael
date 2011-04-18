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

class type with_events = object

  (* Raphael wrappers for event handlers *)
  method click  :
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method unclick:
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method dblclick  :
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method undblclick:
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method mousedown  :
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method unmousedown:
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method mousemove  :
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method unmousemove:
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method mouseout  :
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method unmouseout:
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method mouseover  :
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method unmouseover:
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method mouseup  :
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method unmouseup:
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method hover  :
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth
  method unhover:
    (Dom_html.mouseEvent Js.t -> unit) Js.callback -> unit Js.meth

end


class type ['attr] element = object ('self)

  (* The associated DOM node (if necessary) *)
  method node: Dom.node Js.t Js.readonly_prop

  (* To display or not to display... *)
  method remove:  unit Js.meth
  method hide:  unit Js.meth
  method show:  unit Js.meth
  method toFront:  unit Js.meth
  method toBack:   unit Js.meth
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

  (* Synchronized animation *) (*TODO: fix weirdness with 'a*)
  method animateWith:                'a element Js.t -> 'attr Js.t -> int -> unit Js.meth
  method animateWith_easing:         'a element Js.t -> 'attr Js.t -> int -> Js.js_string Js.t -> unit Js.meth
  method animateWith_callback:       'a element Js.t -> 'attr Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
  method animateWith_easingcallback: 'a element Js.t -> 'attr Js.t -> int -> Js.js_string Js.t -> (unit -> unit) Js.callback -> unit Js.meth

  (* Stop the animation *)
  method stop:  unit Js.meth

  (* Event handler called at each step of the animation *)
  method onAnimation: (unit -> unit) Js.callback -> unit Js.meth

  (* The box the elements fits in *)
  method getBBox:  bbox Js.t Js.meth

  (* Gimme moar! *)
  method clone:  'self Js.t Js.meth

  (* Three stage dragging   /!\ argument order: move, start, end  *)
  method drag:
      (int -> int -> unit) Js.callback
    -> (Dom_html.mouseEvent Js.t -> unit) Js.callback
    -> (unit -> unit) Js.callback -> unit Js.meth
  method undrag:
      (int -> int -> unit) Js.callback
    -> (Dom_html.mouseEvent Js.t -> unit) Js.callback
    -> (unit -> unit) Js.callback -> unit Js.meth

  inherit with_events

end

class type rechack = object

  method paper: paper Js.t Js.readonly_prop

  (* Animation along a path *)
  method animateAlong:                path Js.t -> int -> unit Js.meth
  method animateAlong_rotate:         path Js.t -> int -> bool Js.t -> unit Js.meth
  method animateAlong_callback:       path Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
  method animateAlong_rotatecallback: path Js.t -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth

  (* Animation along a path reversed *)
  method animateAlongBack:                path Js.t -> int -> unit Js.meth
  method animateAlongBack_rotate:         path Js.t -> int -> bool Js.t -> unit Js.meth
  method animateAlongBack_callback:       path Js.t -> int -> (unit -> unit) Js.callback -> unit Js.meth
  method animateAlongBack_rotatecallback: path Js.t -> int -> bool Js.t -> (unit -> unit) Js.callback -> unit Js.meth

end

and circle = object
  inherit [Attr.circle_attr] element
  inherit rechack
end

and rect = object
  inherit [Attr.rect_attr] element
  inherit rechack
end

and ellipse = object
  inherit [Attr.ellipse_attr] element
  inherit rechack
end

and image = object
  inherit [Attr.image_attr] element
  inherit rechack
end

and text = object
  inherit [Attr.text_attr] element
  inherit rechack
end

and path = object

  inherit [Attr.path_attr] element
  inherit rechack

  method getTotalLength:  int Js.meth
  method getPointAtLength: int -> point Js.t Js.meth
  method getSubpath: int -> int -> path Js.t Js.meth

end

and set = object

  inherit [Attr.set_attr] element
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

  method circle:  int -> int -> int -> circle Js.t Js.meth
  method ellipse: int -> int -> int -> int -> ellipse Js.t Js.meth

  method rect:         int -> int -> int -> int        -> rect Js.t Js.meth
  method rect_rounded: int -> int -> int -> int -> int -> rect Js.t Js.meth

  method image: Js.js_string Js.t -> int -> int -> int -> int -> image Js.t Js.meth

  method text: int -> int -> Js.js_string Js.t -> text Js.t Js.meth

  method path: Js.js_string Js.t -> path Js.t Js.meth

  method set: set Js.t Js.meth

  method clear:  unit Js.meth

  method setSize: int -> int -> unit Js.meth

  method getRGB: Js.js_string Js.t -> Attr.paint Js.t Js.meth

  method angle_hz: int -> int -> int -> int -> int Js.meth
  method angle:    int -> int -> int -> int -> int -> int -> int Js.meth

  method rad: int -> int Js.meth
  method deg: int -> int Js.meth

  method snapTo_multiple: int -> int -> int Js.meth
  method snapTo: int Js.js_array Js.t -> int -> int Js.meth

  method getFont: Js.js_string Js.t -> Attr.font Js.t Js.meth
  method getFont_weighted: Js.js_string Js.t -> int -> Attr.font Js.t Js.meth
  method getFont_styled: Js.js_string Js.t -> int -> Js.js_string Js.t
                         -> Attr.font Js.t Js.meth
  method getFont_stretched: Js.js_string Js.t -> int -> Js.js_string Js.t
                            -> Js.js_string Js.t -> Attr.font Js.t Js.meth

  method print: int -> int -> Js.js_string Js.t -> Attr.font Js.t -> int
                -> set Js.t Js.meth

end

let raphael node w h =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Raphael")
    [|Js.Unsafe.inject node; Js.Unsafe.inject w; Js.Unsafe.inject h|]
let raphael_byId id w h =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Raphael")
    [|Js.Unsafe.inject id; Js.Unsafe.inject w; Js.Unsafe.inject h|]
let raphael_coord x y w h =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Raphael")
    [|Js.Unsafe.inject x; Js.Unsafe.inject y;
      Js.Unsafe.inject w; Js.Unsafe.inject h
    |]
