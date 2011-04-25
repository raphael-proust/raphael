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


