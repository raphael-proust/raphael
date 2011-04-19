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
  match e with
  | Decrescendo          -> Js.string "<"
  | Cresencdo            -> Js.string ">"
  | CresencdoDecrescendo -> Js.string "<>"
  | BackIn               -> Js.string "backIn"
  | BackOut              -> Js.string "backOut"
  | Bounce               -> Js.string "bounce"
  | Elastic              -> Js.string "elastic"
  | CubicBezier (p1, p2, p3, p4)
  -> Js.string (Printf.sprintf "cubic-bezier(%f,%f,%f,%f)" p1 p2 p3 p4)



(*The type of colors. For documentation see:
  http://www.w3.org/TR/css3-color/ *)
type color =

  (*Extended color by names (Thank you vi regexps)*)
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
  match c with
  | Aliceblue            -> Js.string "aliceblue"
  | Antiquewhite         -> Js.string "antiquewhite"
  | Aqua                 -> Js.string "aqua"
  | Aquamarine           -> Js.string "aquamarine"
  | Azure                -> Js.string "azure"
  | Beige                -> Js.string "beige"
  | Bisque               -> Js.string "bisque"
  | Black                -> Js.string "black"
  | Blanchedalmond       -> Js.string "blanchedalmond"
  | Blue                 -> Js.string "blue"
  | Blueviolet           -> Js.string "blueviolet"
  | Brown                -> Js.string "brown"
  | Burlywood            -> Js.string "burlywood"
  | Cadetblue            -> Js.string "cadetblue"
  | Chartreuse           -> Js.string "chartreuse"
  | Chocolate            -> Js.string "chocolate"
  | Coral                -> Js.string "coral"
  | Cornflowerblue       -> Js.string "cornflowerblue"
  | Cornsilk             -> Js.string "cornsilk"
  | Crimson              -> Js.string "crimson"
  | Cyan                 -> Js.string "cyan"
  | Darkblue             -> Js.string "darkblue"
  | Darkcyan             -> Js.string "darkcyan"
  | Darkgoldenrod        -> Js.string "darkgoldenrod"
  | Darkgray             -> Js.string "darkgray"
  | Darkgreen            -> Js.string "darkgreen"
  | Darkgrey             -> Js.string "darkgrey"
  | Darkkhaki            -> Js.string "darkkhaki"
  | Darkmagenta          -> Js.string "darkmagenta"
  | Darkolivegreen       -> Js.string "darkolivegreen"
  | Darkorange           -> Js.string "darkorange"
  | Darkorchid           -> Js.string "darkorchid"
  | Darkred              -> Js.string "darkred"
  | Darksalmon           -> Js.string "darksalmon"
  | Darkseagreen         -> Js.string "darkseagreen"
  | Darkslateblue        -> Js.string "darkslateblue"
  | Darkslategray        -> Js.string "darkslategray"
  | Darkslategrey        -> Js.string "darkslategrey"
  | Darkturquoise        -> Js.string "darkturquoise"
  | Darkviolet           -> Js.string "darkviolet"
  | Deeppink             -> Js.string "deeppink"
  | Deepskyblue          -> Js.string "deepskyblue"
  | Dimgray              -> Js.string "dimgray"
  | Dimgrey              -> Js.string "dimgrey"
  | Dodgerblue           -> Js.string "dodgerblue"
  | Firebrick            -> Js.string "firebrick"
  | Floralwhite          -> Js.string "floralwhite"
  | Forestgreen          -> Js.string "forestgreen"
  | Fuchsia              -> Js.string "fuchsia"
  | Gainsboro            -> Js.string "gainsboro"
  | Ghostwhite           -> Js.string "ghostwhite"
  | Gold                 -> Js.string "gold"
  | Goldenrod            -> Js.string "goldenrod"
  | Gray                 -> Js.string "gray"
  | Grey                 -> Js.string "grey"
  | Green                -> Js.string "green"
  | Greenyellow          -> Js.string "greenyellow"
  | Honeydew             -> Js.string "honeydew"
  | Hotpink              -> Js.string "hotpink"
  | Indianred            -> Js.string "indianred"
  | Indigo               -> Js.string "indigo"
  | Ivory                -> Js.string "ivory"
  | Khaki                -> Js.string "khaki"
  | Lavender             -> Js.string "lavender"
  | Lavenderblush        -> Js.string "lavenderblush"
  | Lawngreen            -> Js.string "lawngreen"
  | Lemonchiffon         -> Js.string "lemonchiffon"
  | Lightblue            -> Js.string "lightblue"
  | Lightcoral           -> Js.string "lightcoral"
  | Lightcyan            -> Js.string "lightcyan"
  | Lightgoldenrodyellow -> Js.string "lightgoldenrodyellow"
  | Lightgray            -> Js.string "lightgray"
  | Lightgreen           -> Js.string "lightgreen"
  | Lightgrey            -> Js.string "lightgrey"
  | Lightpink            -> Js.string "lightpink"
  | Lightsalmon          -> Js.string "lightsalmon"
  | Lightseagreen        -> Js.string "lightseagreen"
  | Lightskyblue         -> Js.string "lightskyblue"
  | Lightslategray       -> Js.string "lightslategray"
  | Lightslategrey       -> Js.string "lightslategrey"
  | Lightsteelblue       -> Js.string "lightsteelblue"
  | Lightyellow          -> Js.string "lightyellow"
  | Lime                 -> Js.string "lime"
  | Limegreen            -> Js.string "limegreen"
  | Linen                -> Js.string "linen"
  | Magenta              -> Js.string "magenta"
  | Maroon               -> Js.string "maroon"
  | Mediumaquamarine     -> Js.string "mediumaquamarine"
  | Mediumblue           -> Js.string "mediumblue"
  | Mediumorchid         -> Js.string "mediumorchid"
  | Mediumpurple         -> Js.string "mediumpurple"
  | Mediumseagreen       -> Js.string "mediumseagreen"
  | Mediumslateblue      -> Js.string "mediumslateblue"
  | Mediumspringgreen    -> Js.string "mediumspringgreen"
  | Mediumturquoise      -> Js.string "mediumturquoise"
  | Mediumvioletred      -> Js.string "mediumvioletred"
  | Midnightblue         -> Js.string "midnightblue"
  | Mintcream            -> Js.string "mintcream"
  | Mistyrose            -> Js.string "mistyrose"
  | Moccasin             -> Js.string "moccasin"
  | Navajowhite          -> Js.string "navajowhite"
  | Navy                 -> Js.string "navy"
  | Oldlace              -> Js.string "oldlace"
  | Olive                -> Js.string "olive"
  | Olivedrab            -> Js.string "olivedrab"
  | Orange               -> Js.string "orange"
  | Orangered            -> Js.string "orangered"
  | Orchid               -> Js.string "orchid"
  | Palegoldenrod        -> Js.string "palegoldenrod"
  | Palegreen            -> Js.string "palegreen"
  | Paleturquoise        -> Js.string "paleturquoise"
  | Palevioletred        -> Js.string "palevioletred"
  | Papayawhip           -> Js.string "papayawhip"
  | Peachpuff            -> Js.string "peachpuff"
  | Peru                 -> Js.string "peru"
  | Pink                 -> Js.string "pink"
  | Plum                 -> Js.string "plum"
  | Powderblue           -> Js.string "powderblue"
  | Purple               -> Js.string "purple"
  | Red                  -> Js.string "red"
  | Rosybrown            -> Js.string "rosybrown"
  | Royalblue            -> Js.string "royalblue"
  | Saddlebrown          -> Js.string "saddlebrown"
  | Salmon               -> Js.string "salmon"
  | Sandybrown           -> Js.string "sandybrown"
  | Seagreen             -> Js.string "seagreen"
  | Seashell             -> Js.string "seashell"
  | Sienna               -> Js.string "sienna"
  | Silver               -> Js.string "silver"
  | Skyblue              -> Js.string "skyblue"
  | Slateblue            -> Js.string "slateblue"
  | Slategray            -> Js.string "slategray"
  | Slategrey            -> Js.string "slategrey"
  | Snow                 -> Js.string "snow"
  | Springgreen          -> Js.string "springgreen"
  | Steelblue            -> Js.string "steelblue"
  | Tan                  -> Js.string "tan"
  | Teal                 -> Js.string "teal"
  | Thistle              -> Js.string "thistle"
  | Tomato               -> Js.string "tomato"
  | Turquoise            -> Js.string "turquoise"
  | Violet               -> Js.string "violet"
  | Wheat                -> Js.string "wheat"
  | White                -> Js.string "white"
  | Whitesmoke           -> Js.string "whitesmoke"
  | Yellow               -> Js.string "yellow"
  | Yellowgreen          -> Js.string "yellowgreen"

  | RGB          (r,g,b) -> Js.string (Printf.sprintf "rgb(%d,%d,%d)" r g b)
  | RGB_percent  (r,g,b) -> Js.string (Printf.sprintf "rgb(%d%%,%d%%,%d%%)" r g b)

  | RGBA         (r,g,b,a) -> Js.string (Printf.sprintf "rgb(%d,%d,%d,%f)" r g b a)
  | RGBA_percent (r,g,b,a) -> Js.string (Printf.sprintf "rgb(%d%%,%d%%,%d%%,%f)" r g b a)

  | HSB         (h,s,b) -> Js.string (Printf.sprintf "hsb(%f,%f,%f)" h s b)
  | HSB_deg     (h,s,b) -> Js.string (Printf.sprintf "hsb(%ddeg,%f,%f)" h s b)
  | HSB_percent (h,s,b) -> Js.string (Printf.sprintf "hsb(%d%%,%d%%,%d%%)" h s b)

  | HSBA         (h,s,b,a) -> Js.string (Printf.sprintf "hsb(%f,%f,%f,%f)" h s b a)
  | HSBA_deg     (h,s,b,a) -> Js.string (Printf.sprintf "hsb(%ddeg,%f,%f,%f)" h s b a)
  | HSBA_percent (h,s,b,a) -> Js.string (Printf.sprintf "hsb(%d%%,%d%%,%d%%,%f)" h s b a)

  | HSL         (h,s,l) -> Js.string (Printf.sprintf "hsl(%f,%f,%f)" h s l)
  | HSL_deg     (h,s,l) -> Js.string (Printf.sprintf "hsl(%ddeg,%f,%f)" h s l)
  | HSL_percent (h,s,l) -> Js.string (Printf.sprintf "hsl(%d%%,%d%%,%d%%)" h s l)

  | HSLA         (h,s,l,a) -> Js.string (Printf.sprintf "hsl(%f,%f,%f,%f)" h s l a)
  | HSLA_deg     (h,s,l,a) -> Js.string (Printf.sprintf "hsl(%ddeg,%f,%f,%f)" h s l a)
  | HSLA_percent (h,s,l,a) -> Js.string (Printf.sprintf "hsl(%d%%,%d%%,%d%%,%f)" h s l a)





