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
