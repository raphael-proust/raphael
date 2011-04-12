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

(*The canvas*)
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


let _ = (*draw the grid*)
  let line x0 y0 x1 y1 =
    Js.string (Printf.sprintf "M%d %dL%d %d" x0 y0 x1 y1)
  in
  let begining = 0
  and ending   = cell_size * cell_count
  in
  for i = 0 to cell_count do
    ignore (paper##path (line begining (i * cell_size) ending (i * cell_size)));
    ignore (paper##path (line (i * cell_size) begining (i * cell_size) ending))
  done


let board =
  Array.init cell_count
    (fun i -> Array.init cell_count
      (fun j ->
        let r = paper##rect(i*cell_size, j*cell_size, cell_size, cell_size) in
        (false, r)
      )
    )

let flip_1 x y =
  if x < 0 || x >= cell_count || y < 0 || y >= cell_count then
    ()
  else
    let (b, r) = board.(x).(y) in
    let a = r##attr in
    if b then begin
      a##fill <- Js.string "rgba(26,26,26,.95)";
      r##animate(a, 250);
      board.(x).(y) <- (false, r)
    end else begin
      a##fill <- Js.string "rgba(230,230,230,.95)";
      r##animate(a, 250);
      board.(x).(y) <- (true, r)
    end

let flip_plus i j =
  flip_1  i        j      ;
  flip_1  i       (succ j);
  flip_1  i       (pred j);
  flip_1 (succ i)  j      ;
  flip_1 (pred i)  j

let flip_x i j =
  flip_1  i        j      ;
  flip_1 (succ i) (succ j);
  flip_1 (pred i) (pred j);
  flip_1 (succ i) (pred j);
  flip_1 (pred i) (succ j)

let flip, set_plus, set_x =
  let f = ref flip_plus in
  ((fun x y -> !f x y),
    (fun () -> f := flip_plus),
    (fun () -> f := flip_x)
  )

let _ = (*initialize*)
  Array.iteri
    (fun i arr -> Array.iteri
      (fun j (_, r) ->
        let a = r##attr in
        a##fill <- Js.string "rgba(26,26,26,.95)";
        r##animate(a, 250);
        r##click (Js.wrap_callback (fun _ -> flip i j));
        if Random.int 2 = 0 then flip_1 i j
      )
      arr
    )
    board

let _ =
  begin
  ((Js.Opt.get
     (Dom_html.document##getElementById(Js.string "x"))
     (fun () ->
        Dom_html.window##alert
          (Js.string ("Can't get Element x By Id"));
        failwith "getElementById failed")
   ) :> Dom_html.element Js.t)##onclick <-
     (Dom_html.handler (fun _ -> set_x (); Js._false));
  ((Js.Opt.get
     (Dom_html.document##getElementById(Js.string "plus"))
     (fun () ->
        Dom_html.window##alert
          (Js.string ("Can't get Element plus By Id"));
        failwith "getElementById failed")
   ) :> Dom_html.element Js.t)##onclick <-
     (Dom_html.handler (fun _ -> set_plus (); Js._false))
  end


