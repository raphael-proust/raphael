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

(*for CubicBezier, see
  http://www.w3.org/TR/css3-transitions/#transition-timing-function_tag *)

let js_string_of_easing e =
  Js.string (match e with
    | Decrescendo          -> "<"
    | Cresencdo            -> ">"
    | CresencdoDecrescendo -> "<>"
    | BackIn               -> "backIn"
    | BackOut              -> "backOut"
    | Bounce               -> "bounce"
    | Elastic              -> "elastic"
    | CubicBezier (p1, p2, p3, p4)
    -> Printf.sprintf "cubic-bezier(%f,%f,%f,%f)" p1 p2 p3 p4
  )



(*The type of colors. For documentation see:
  http://www.w3.org/TR/css3-color/ *)
type color =

  (*Extended color by names*)
  | Aliceblue | Antiquewhite | Aqua | Aquamarine | Azure
  | Beige | Bisque | Black | Blanchedalmond | Blue | Blueviolet | Brown
  | Burlywood
  | Cadetblue | Chartreuse | Chocolate | Coral | Cornflowerblue | Cornsilk
  | Crimson | Cyan
  | Darkblue | Darkcyan | Darkgoldenrod | Darkgray | Darkgreen | Darkgrey
  | Darkkhaki | Darkmagenta | Darkolivegreen | Darkorange | Darkorchid
  | Darkred | Darksalmon | Darkseagreen | Darkslateblue | Darkslategray
  | Darkslategrey | Darkturquoise | Darkviolet | Deeppink | Deepskyblue
  | Dimgray | Dimgrey | Dodgerblue
  | Firebrick | Floralwhite | Forestgreen | Fuchsia
  | Gainsboro | Ghostwhite | Gold | Goldenrod | Gray | Grey | Green
  | Greenyellow
  | Honeydew | Hotpink
  | Indianred | Indigo | Ivory
  | Khaki
  | Lavender | Lavenderblush | Lawngreen | Lemonchiffon | Lightblue | Lightcoral
  | Lightcyan | Lightgoldenrodyellow | Lightgray | Lightgreen | Lightgrey
  | Lightpink | Lightsalmon | Lightseagreen | Lightskyblue | Lightslategray
  | Lightslategrey | Lightsteelblue | Lightyellow | Lime | Limegreen | Linen
  | Magenta | Maroon | Mediumaquamarine | Mediumblue | Mediumorchid
  | Mediumpurple | Mediumseagreen | Mediumslateblue | Mediumspringgreen
  | Mediumturquoise | Mediumvioletred | Midnightblue | Mintcream | Mistyrose
  | Moccasin
  | Navajowhite | Navy
  | Oldlace | Olive | Olivedrab | Orange | Orangered | Orchid
  | Palegoldenrod | Palegreen | Paleturquoise | Palevioletred | Papayawhip
  | Peachpuff | Peru | Pink | Plum | Powderblue | Purple
  | Red | Rosybrown | Royalblue
  | Saddlebrown | Salmon | Sandybrown | Seagreen | Seashell | Sienna | Silver
  | Skyblue | Slateblue | Slategray | Slategrey | Snow | Springgreen | Steelblue
  | Tan | Teal | Thistle | Tomato | Turquoise
  | Violet
  | Wheat | White | Whitesmoke
  | Yellow | Yellowgreen

  (*RGB*)
  | RGB         of (int * int * int)
  | RGB_percent of (int * int * int)

  (*RGB with alpha*)
  | RGBA         of (int * int * int * float)
  | RGBA_percent of (int * int * int * float)

  (*HSB*)
  | HSB              of (float * float * float)
  | HSB_deg          of (int   * float * float)
  | HSB_percent      of (int   * int   * int)

  (*HSB with alpha*)
  | HSBA             of (float * float * float * float)
  | HSBA_deg         of (int   * float * float * float)
  | HSBA_percent     of (int   * int   * int   * float)

  (*HSL*)
  | HSL              of (float * float * float)
  | HSL_deg          of (int   * float * float)
  | HSL_percent      of (int   * int   * int)

  (*HSL with alpha*)
  | HSLA             of (float * float * float * float)
  | HSLA_deg         of (int   * float * float * float)
  | HSLA_percent     of (int   * int   * int   * float)



let js_string_of_color c =
  Js.string (match c with
    | Aliceblue -> "aliceblue"
    | Antiquewhite -> "antiquewhite"
    | Aqua -> "aqua"
    | Aquamarine -> "aquamarine"
    | Azure -> "azure"
    | Beige -> "beige"
    | Bisque -> "bisque"
    | Black -> "black"
    | Blanchedalmond -> "blanchedalmond"
    | Blue -> "blue"
    | Blueviolet -> "blueviolet"
    | Brown -> "brown"
    | Burlywood -> "burlywood"
    | Cadetblue -> "cadetblue"
    | Chartreuse -> "chartreuse"
    | Chocolate -> "chocolate"
    | Coral -> "coral"
    | Cornflowerblue -> "cornflowerblue"
    | Cornsilk -> "cornsilk"
    | Crimson -> "crimson"
    | Cyan -> "cyan"
    | Darkblue -> "darkblue"
    | Darkcyan -> "darkcyan"
    | Darkgoldenrod -> "darkgoldenrod"
    | Darkgray -> "darkgray"
    | Darkgreen -> "darkgreen"
    | Darkgrey -> "darkgrey"
    | Darkkhaki -> "darkkhaki"
    | Darkmagenta -> "darkmagenta"
    | Darkolivegreen -> "darkolivegreen"
    | Darkorange -> "darkorange"
    | Darkorchid -> "darkorchid"
    | Darkred -> "darkred"
    | Darksalmon -> "darksalmon"
    | Darkseagreen -> "darkseagreen"
    | Darkslateblue -> "darkslateblue"
    | Darkslategray -> "darkslategray"
    | Darkslategrey -> "darkslategrey"
    | Darkturquoise -> "darkturquoise"
    | Darkviolet -> "darkviolet"
    | Deeppink -> "deeppink"
    | Deepskyblue -> "deepskyblue"
    | Dimgray -> "dimgray"
    | Dimgrey -> "dimgrey"
    | Dodgerblue -> "dodgerblue"
    | Firebrick -> "firebrick"
    | Floralwhite -> "floralwhite"
    | Forestgreen -> "forestgreen"
    | Fuchsia -> "fuchsia"
    | Gainsboro -> "gainsboro"
    | Ghostwhite -> "ghostwhite"
    | Gold -> "gold"
    | Goldenrod -> "goldenrod"
    | Gray -> "gray"
    | Grey -> "grey"
    | Green -> "green"
    | Greenyellow -> "greenyellow"
    | Honeydew -> "honeydew"
    | Hotpink -> "hotpink"
    | Indianred -> "indianred"
    | Indigo -> "indigo"
    | Ivory -> "ivory"
    | Khaki -> "khaki"
    | Lavender -> "lavender"
    | Lavenderblush -> "lavenderblush"
    | Lawngreen -> "lawngreen"
    | Lemonchiffon -> "lemonchiffon"
    | Lightblue -> "lightblue"
    | Lightcoral -> "lightcoral"
    | Lightcyan -> "lightcyan"
    | Lightgoldenrodyellow -> "lightgoldenrodyellow"
    | Lightgray -> "lightgray"
    | Lightgreen -> "lightgreen"
    | Lightgrey -> "lightgrey"
    | Lightpink -> "lightpink"
    | Lightsalmon -> "lightsalmon"
    | Lightseagreen -> "lightseagreen"
    | Lightskyblue -> "lightskyblue"
    | Lightslategray -> "lightslategray"
    | Lightslategrey -> "lightslategrey"
    | Lightsteelblue -> "lightsteelblue"
    | Lightyellow -> "lightyellow"
    | Lime -> "lime"
    | Limegreen -> "limegreen"
    | Linen -> "linen"
    | Magenta -> "magenta"
    | Maroon -> "maroon"
    | Mediumaquamarine -> "mediumaquamarine"
    | Mediumblue -> "mediumblue"
    | Mediumorchid -> "mediumorchid"
    | Mediumpurple -> "mediumpurple"
    | Mediumseagreen -> "mediumseagreen"
    | Mediumslateblue -> "mediumslateblue"
    | Mediumspringgreen -> "mediumspringgreen"
    | Mediumturquoise -> "mediumturquoise"
    | Mediumvioletred -> "mediumvioletred"
    | Midnightblue -> "midnightblue"
    | Mintcream -> "mintcream"
    | Mistyrose -> "mistyrose"
    | Moccasin -> "moccasin"
    | Navajowhite -> "navajowhite"
    | Navy -> "navy"
    | Oldlace -> "oldlace"
    | Olive -> "olive"
    | Olivedrab -> "olivedrab"
    | Orange -> "orange"
    | Orangered -> "orangered"
    | Orchid -> "orchid"
    | Palegoldenrod -> "palegoldenrod"
    | Palegreen -> "palegreen"
    | Paleturquoise -> "paleturquoise"
    | Palevioletred -> "palevioletred"
    | Papayawhip -> "papayawhip"
    | Peachpuff -> "peachpuff"
    | Peru -> "peru"
    | Pink -> "pink"
    | Plum -> "plum"
    | Powderblue -> "powderblue"
    | Purple -> "purple"
    | Red -> "red"
    | Rosybrown -> "rosybrown"
    | Royalblue -> "royalblue"
    | Saddlebrown -> "saddlebrown"
    | Salmon -> "salmon"
    | Sandybrown -> "sandybrown"
    | Seagreen -> "seagreen"
    | Seashell -> "seashell"
    | Sienna -> "sienna"
    | Silver -> "silver"
    | Skyblue -> "skyblue"
    | Slateblue -> "slateblue"
    | Slategray -> "slategray"
    | Slategrey -> "slategrey"
    | Snow -> "snow"
    | Springgreen -> "springgreen"
    | Steelblue -> "steelblue"
    | Tan -> "tan"
    | Teal -> "teal"
    | Thistle -> "thistle"
    | Tomato -> "tomato"
    | Turquoise -> "turquoise"
    | Violet -> "violet"
    | Wheat -> "wheat"
    | White -> "white"
    | Whitesmoke -> "whitesmoke"
    | Yellow -> "yellow"
    | Yellowgreen -> "yellowgreen"

    | RGB              (r,g,b) -> Printf.sprintf "rgb(%d,%d,%d)" r g b
    | RGB_percent      (r,g,b) -> Printf.sprintf "rgb(%d%%,%d%%,%d%%)" r g b
    | RGBA             (r,g,b,a) -> Printf.sprintf "rgb(%d,%d,%d,%f)" r g b a
    | RGBA_percent     (r,g,b,a) -> Printf.sprintf "rgb(%d%%,%d%%,%d%%,%f)" r g b a

    | HSB              (h,s,b) -> Printf.sprintf "hsb(%f,%f,%f)" h s b
    | HSB_deg          (h,s,b) -> Printf.sprintf "hsb(%ddeg,%f,%f)" h s b
    | HSB_percent      (h,s,b) -> Printf.sprintf "hsb(%d%%,%d%%,%d%%)" h s b

    | HSBA             (h,s,b,a) -> Printf.sprintf "hsb(%f,%f,%f,%f)" h s b a
    | HSBA_deg         (h,s,b,a) -> Printf.sprintf "hsb(%ddeg,%f,%f,%f)" h s b a
    | HSBA_percent     (h,s,b,a) -> Printf.sprintf "hsb(%d%%,%d%%,%d%%,%f)" h s b a

    | HSL              (h,s,l) -> Printf.sprintf "hsl(%f,%f,%f)" h s l
    | HSL_deg          (h,s,l) -> Printf.sprintf "hsl(%ddeg,%f,%f)" h s l
    | HSL_percent      (h,s,l) -> Printf.sprintf "hsl(%d%%,%d%%,%d%%)" h s l

    | HSLA             (h,s,l,a) -> Printf.sprintf "hsl(%f,%f,%f,%f)" h s l a
    | HSLA_deg         (h,s,l,a) -> Printf.sprintf "hsl(%ddeg,%f,%f,%f)" h s l a
    | HSLA_percent     (h,s,l,a) -> Printf.sprintf "hsl(%d%%,%d%%,%d%%,%f)" h s l a
  )




