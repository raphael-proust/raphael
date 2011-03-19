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
class type paint = object
end

(* Super classes: just there as a coding good practice. *)

class type common_attr = object
end

class type graphic_attr = object
  method opacity: float prop
  method rotation: int prop
end

(* Attributes of shapes *)
class type basic_shape_attr = object
  method fill: paint prop
  method stroke: paint prop
end
class type shape_attr = object
  inherit basic_shape_attr
end

class type centered_attr = object
  method cx: int prop
  method cy: int prop
end

class type dimensioned_attr = object
  method width: int prop
  method height: int prop
  method rx: int prop
  method ry: int prop
end

class type positioned_attr = object
  method x: int prop
  method y: int prop
end



(* Attributes for each element class of Raphael *)

class type circle_attr = object
  inherit common_attr
  inherit shape_attr
  inherit centered_attr

  method r: int prop

end

class type ellipse_attr = object
  inherit common_attr
  inherit shape_attr
  inherit centered_attr

end

class type rect_attr = object
  inherit common_attr
  inherit shape_attr
  inherit dimensioned_attr
  inherit positioned_attr

end

class type image_attr = object
  inherit common_attr
  inherit shape_attr
  inherit dimensioned_attr
  inherit positioned_attr

  method src: js_string t prop

end

class type path_attr = object
  inherit basic_shape_attr

  method path: js_string t prop
end

class type text_attr = object
  inherit graphic_attr
  inherit positioned_attr

  method font: font prop
end

class type set_attr = object

end

