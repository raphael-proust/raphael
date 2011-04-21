(* {{{ LICENSE
 * raphael_on_a_caml
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
 }}} *)


(*A simple game in a simplified version*)

(* {{{ constants*)
let cell_size  = 25
let cell_count = 10
let light_grey = Raffaello.paint Raffaello.Lightslategrey
let dark_grey  = Raffaello.paint Raffaello.Darkslategrey
(* }}} *)


(* {{{ The canvas on which the game board is drawn*)
let paper =
  Raphael.raphael_byId
    (Js.string ("board"))
    (cell_size * cell_count)
    (cell_size * cell_count)
(* }}} *)


(* {{{ Drawing a grid in the background*)
let () =
  let line x0 y0 x1 y1 =
    Js.string (Printf.sprintf "M%d %dL%d %d" x0 y0 x1 y1)
  in
  let begining = 0 and ending = cell_size * cell_count in
  for i = 0 to cell_count do
    ignore (paper##path (line begining (i * cell_size) ending (i * cell_size)));
    ignore (paper##path (line (i * cell_size) begining (i * cell_size) ending))
  done
(* }}} *)


(* {{{ The game board: a matrix of squares with a boolean flag*)
let board =
  Array.init cell_count
    (fun i -> Array.init cell_count
      (fun j ->
        let r = paper##rect
            ( i * cell_size + 1
            , j * cell_size + 1
            , cell_size - 2
            , cell_size - 2 )
        in
        (false, r)
      )
    )
(* }}} *)


(* {{{ flip one cell on the board*)
let flip_1 x y =
  if x < 0 || x >= cell_count || y < 0 || y >= cell_count then
    ()
  else
    let (b, r) = board.(x).(y) in
    let a = r##attr in
    if b then begin
      a##fill <- light_grey;
      r##animate(a, 150); (*smooth animation*)
      board.(x).(y) <- (false, r)
    end else begin
      a##fill <- dark_grey;
      r##animate(a, 150);
      board.(x).(y) <- (true, r)
    end
(* }}} *)


(* {{{ flip an horizontal-vertical cross (AKA "plus" sign)*)
let flip i j =
  List.iter (fun (x, y) -> flip_1 x y)
    [ (i, j); (i, succ j); (i, pred j); (succ i, j); (pred i, j); ]
(* }}} *)


(* {{{ initialize the board*)
let () =
  Array.iteri
    (fun i arr -> Array.iteri
      (fun j (_, r) -> (*for each cell,*)
        let a = r##attr in
        a##fill <- light_grey;
        r##animate(a, 100);
        r##click (Js.wrap_callback (fun _ -> flip i j));
        if Random.int 2 = 0 then flip_1 i j
      )
      arr
    )
    board
(* }}} *)

