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


type easing =
  | Decrescendo
  | Cresencdo
  | CresencdoDecrescendo
  | BackIn
  | BackOut
  | Bounce
  | Elastic
  | CubicBezier of (float * float * float * float)

val js_string_of_easing : easing -> Js.js_string Js.t



type color =
  | Aliceblue
  | Antiquewhite
  | Aqua
  | Aquamarine
  | Azure
  | Beige
  | Bisque
  | Black
  | Blanchedalmond
  | Blue
  | Blueviolet
  | Brown
  | Burlywood
  | Cadetblue
  | Chartreuse
  | Chocolate
  | Coral
  | Cornflowerblue
  | Cornsilk
  | Crimson
  | Cyan
  | Darkblue
  | Darkcyan
  | Darkgoldenrod
  | Darkgray
  | Darkgreen
  | Darkgrey
  | Darkkhaki
  | Darkmagenta
  | Darkolivegreen
  | Darkorange
  | Darkorchid
  | Darkred
  | Darksalmon
  | Darkseagreen
  | Darkslateblue
  | Darkslategray
  | Darkslategrey
  | Darkturquoise
  | Darkviolet
  | Deeppink
  | Deepskyblue
  | Dimgray
  | Dimgrey
  | Dodgerblue
  | Firebrick
  | Floralwhite
  | Forestgreen
  | Fuchsia
  | Gainsboro
  | Ghostwhite
  | Gold
  | Goldenrod
  | Gray
  | Grey
  | Green
  | Greenyellow
  | Honeydew
  | Hotpink
  | Indianred
  | Indigo
  | Ivory
  | Khaki
  | Lavender
  | Lavenderblush
  | Lawngreen
  | Lemonchiffon
  | Lightblue
  | Lightcoral
  | Lightcyan
  | Lightgoldenrodyellow
  | Lightgray
  | Lightgreen
  | Lightgrey
  | Lightpink
  | Lightsalmon
  | Lightseagreen
  | Lightskyblue
  | Lightslategray
  | Lightslategrey
  | Lightsteelblue
  | Lightyellow
  | Lime
  | Limegreen
  | Linen
  | Magenta
  | Maroon
  | Mediumaquamarine
  | Mediumblue
  | Mediumorchid
  | Mediumpurple
  | Mediumseagreen
  | Mediumslateblue
  | Mediumspringgreen
  | Mediumturquoise
  | Mediumvioletred
  | Midnightblue
  | Mintcream
  | Mistyrose
  | Moccasin
  | Navajowhite
  | Navy
  | Oldlace
  | Olive
  | Olivedrab
  | Orange
  | Orangered
  | Orchid
  | Palegoldenrod
  | Palegreen
  | Paleturquoise
  | Palevioletred
  | Papayawhip
  | Peachpuff
  | Peru
  | Pink
  | Plum
  | Powderblue
  | Purple
  | Red
  | Rosybrown
  | Royalblue
  | Saddlebrown
  | Salmon
  | Sandybrown
  | Seagreen
  | Seashell
  | Sienna
  | Silver
  | Skyblue
  | Slateblue
  | Slategray
  | Slategrey
  | Snow
  | Springgreen
  | Steelblue
  | Tan
  | Teal
  | Thistle
  | Tomato
  | Turquoise
  | Violet
  | Wheat
  | White
  | Whitesmoke
  | Yellow
  | Yellowgreen
  | RGB of (int * int * int)
  | RGB_percent of (int * int * int)
  | RGBA of (int * int * int * float)
  | RGBA_percent of (int * int * int * float)
  | HSB of (float * float * float)
  | HSB_deg of (int * float * float)
  | HSB_percent of (int * int * int)
  | HSBA of (float * float * float * float)
  | HSBA_deg of (int * float * float * float)
  | HSBA_percent of (int * int * int * float)
  | HSL of (float * float * float)
  | HSL_deg of (int * float * float)
  | HSL_percent of (int * int * int)
  | HSLA of (float * float * float * float)
  | HSLA_deg of (int * float * float * float)
  | HSLA_percent of (int * int * int * float)

val js_string_of_color : color -> Js.js_string Js.t

val paint : color -> Attr.paint Js.t
