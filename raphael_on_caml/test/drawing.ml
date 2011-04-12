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
let cell_size = 25
let cell_count = 10

(*The canvas on which the game board is drawn*)
let paper =
  Raphael.raphael
    ((Js.Opt.get
       (Dom_html.document##getElementById(Js.string "paper"))
       (fun () ->
          Dom_html.window##alert
            (Js.string ("Can't get Element paper By Id"));
          failwith "getElementById failed")
     ) :> Dom.node Js.t)
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
        let r = paper##rect(i*cell_size, j*cell_size, cell_size, cell_size) in
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
      a##fill <- Js.string "rgba(26,26,26,.95)";
      r##animate(a, 250); (*smooth animation*)
      board.(x).(y) <- (false, r)
    end else begin
      a##fill <- Js.string "rgba(230,230,230,.95)";
      r##animate(a, 250);
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

let _ = (*initialize the board*)
  Array.iteri
    (fun i arr -> Array.iteri
      (fun j (_, r) -> (*for each cell,*)
        let a = r##attr in
        a##fill <- Js.string "rgba(26,26,26,.95)";
        r##animate(a, 250);
        r##click (Js.wrap_callback (fun _ -> flip i j));
        if Random.int 2 = 0 then flip_1 i j
      )
      arr
    )
    board


(*controls*)

let control_panel =
  Raphael.raphael
    ((Js.Opt.get
       (Dom_html.document##getElementById(Js.string "controls"))
       (fun () ->
          Dom_html.window##alert
            (Js.string ("Can't get Element controls By Id"));
          failwith "getElementById failed")
     ) :> Dom.node Js.t)
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
  "M%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %dL%d %d"
  c1 c2 c1 c3 c2 c3 c2 c4 c3 c4 c3 c3 c4 c3 c4 c2 c3 c2 c3 c1 c2 c1 c2 c2 c1 c2
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


let button =
  let s = control_panel##path(Js.string "M 0 0") in
  let is_plus = ref false in
  let callback _ =
      if !is_plus then begin
        is_plus := false;
        set_x ();
        let a = s##attr in
        a##path <- x_path;
        a##stroke <- Js.string "rgba(128,128,128,.95)";
        a##fill <- Js.string "rgba(26,26,26,.95)";
        s##animate(a, 250)
      end else begin
        is_plus := true;
        set_plus ();
        let a = s##attr in
        a##path <- plus_path;
        a##stroke <- Js.string "rgba(26,26,26,.95)";
        a##fill <- Js.string "rgba(128,128,128,.95)";
        s##animate(a, 250)
      end
  in
  callback ();
  s##click(Js.wrap_callback callback);
  s


