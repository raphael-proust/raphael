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


(*A simple game*)

(*constants*)
let cell_size  = 25
let cell_count = 10
let light_grey = (CSS.color (CSS.Color_name CSS.Lightslategrey) :> Js.js_string Js.t)
let grey       = (CSS.color (CSS.Color_name CSS.Slategrey) :> Js.js_string Js.t)
let dark_grey  = (CSS.color (CSS.Color_name CSS.Darkslategrey) :> Js.js_string Js.t)
let ( >>= )    = Lwt.( >>= )

(*The canvas on which the game board is drawn*)
let paper =
  Raphael.raphael_byId
    (Js.string "board")
    (cell_size * cell_count)
    (cell_size * cell_count)


let _ = (*The grid*)
  let line x0 y0 x1 y1 =
    Js.string (Printf.sprintf "M%d %dL%d %d" x0 y0 x1 y1)
  in
  let begining = 0 and ending = cell_size * cell_count in
  for i = 0 to cell_count do
    ignore (paper##path (line begining (i * cell_size) ending (i * cell_size)));
    ignore (paper##path (line (i * cell_size) begining (i * cell_size) ending))
  done


let board = (*The game board: a matrix of squares with a boolean flag*)
  Array.init cell_count
    (fun i -> Array.init cell_count
      (fun j ->
        let r =
          paper##rect_rounded
            ( i*cell_size + 1
            , j*cell_size + 1
            , cell_size - 2
            , cell_size - 2
            , 2)
        in
        (false, r)
      )
    )

let flip_1 x y = (*flip one cell on the board*)
  if x < 0 || x >= cell_count || y < 0 || y >= cell_count then
    ()
  else
    let (b, r) = board.(x).(y) in
    let a = r##attr in
    if b then begin
      a##fill <- light_grey;
      r##animate(a, 200); (*smooth animation*)
      board.(x).(y) <- (false, r)
    end else begin
      a##fill <- dark_grey;
      r##animate(a, 200);
      board.(x).(y) <- (true, r)
    end

let flip_plus i j = (*flip an horizontal-vertical cross (AKA "plus" sign)*)
  List.iter (fun (x, y) -> flip_1 x y)
    [ (i, j); (i, succ j); (i, pred j); (succ i, j); (pred i, j); ]

let flip_x i j = (*flip a diagonal cross (AKA "x")*)
  List.iter (fun (x, y) -> flip_1 x y)
    [ (i, j);
      (succ i, succ j); (succ i, pred j);
      (pred i, succ j); (pred i, pred j);
    ]

let flip, set_plus, set_x =
  let f = ref flip_plus in
  ((fun x y -> !f x y),
    (fun () -> f := flip_plus),
    (fun () -> f := flip_x)
  )

let update_hint i j = ()

let _ = (*initialize the board*)
  Array.iteri
    (fun i arr -> Array.iteri
      (fun j (_, r) -> (*for each cell,*)
        let a = r##attr in
        a##fill <- light_grey;
        r##animate(a, 100);
        r##click (Js.wrap_callback (fun _ -> flip i j));
        r##mouseover (Js.wrap_callback (fun _ -> update_hint i j));
        if Random.int 2 = 0 then flip_1 i j
      )
      arr
    )
    board


(*controls*)

let control_panel =
  Raphael.raphael_byId
    (Js.string "controls")
    (cell_size * 8)
    (cell_size * 4)

let c1 = cell_size / 2
let c2 = 3  * c1
let c3 = 5  * c1
let c4 = 7  * c1
let c5 = 9  * c1
let c6 = 11 * c1
let c7 = 13 * c1
let c8 = 15 * c1

let plus_path =
  Js.string (Printf.sprintf
  "M%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %d"
  c1 c2
  c1 c3
  c2 c3 c2 c3 c2 c3
  c2 c4
  c3 c4
  c3 c3 c3 c3 c3 c3
  c4 c3
  c4 c2
  c3 c2 c3 c2 c3 c2
  c3 c1
  c2 c1
  c2 c2 c2 c2 c2 c2
  c1 c2
  )

let x_path =
  Js.string (Printf.sprintf
  "M%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %d"
  c5 c2
  c6 c2
  c6 c3
  c5 c3
  c5 c4
  c6 c4
  c6 c3
  c7 c3
  c7 c4
  c8 c4
  c8 c3
  c7 c3
  c7 c2
  c8 c2
  c8 c1
  c7 c1
  c7 c2
  c6 c2
  c6 c1
  c5 c1
  c5 c2
  )

let () =
  let background = control_panel##rect (0, 0, cell_size * 8, cell_size * 4) in
  let ab = background##attr in
  ab##fill <- grey;
  background##animate_easing (ab, 100 ,Js.string "<>");
  background##toBack()

let flip_button =
  let s = control_panel##path(Js.string "M 0 0") in
  let is_plus = ref false in
  let callback _ =
      if !is_plus then begin
        is_plus := false;
        set_x ();
        let a = s##attr in
        a##path <- x_path;
        a##fill <- light_grey;
        s##animate_easing(a, 500, Js.string "<>")
      end else begin
        is_plus := true;
        set_plus ();
        let a = s##attr in
        a##path <- plus_path;
        a##fill <- dark_grey;
        s##animate_easing(a, 500, Js.string "<>")
      end
  in
  callback ();
  s##click(Js.wrap_callback callback);
  s


let load new_board =
  Array.iteri
    (fun i arr -> Array.iteri
      (fun j b ->
        if b then
          if not (fst board.(i).(j)) then
            flip_1 i j
          else
            ()
        else
          if fst board.(i).(j) then
            flip_1 i j
          else
            ()
      )
      arr
    )
    new_board


