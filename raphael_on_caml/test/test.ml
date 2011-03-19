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

let (>>=) = Lwt.(>>=)
let (>|=) = Lwt.(>|=)

let test name func =
  let paper =
    Raphael.raphael
      ((Js.Opt.get
         (Dom_html.document##getElementById(Js.string name))
         (fun () ->
            Dom_html.window##alert
              (Js.string ("Can't get Element " ^ name ^ " By Id"));
            failwith "getElementById failed")
       ) :> Dom.node Js.t)
      300 100
  in
  func paper


(* Base figures *)

let _ =
  test "shapes"
    (fun p ->
       ignore (p##rect(10, 15, 30, 30));
       ignore (p##circle(60, 30, 20));
       ignore (p##rect_rounded(80, 15, 30, 30, 10));
       ignore (p##ellipse(140, 30, 30, 20))
    )

let _ =
  test "showhide"
    (fun p ->
       let r = p##rect(10,15,30,30) in
       let c = p##circle(60, 30, 20) in
       let rr = p##rect_rounded(80, 15, 30, 30, 10) in
       let e = p##ellipse(140, 30, 30, 20) in

       let rec flickr () =
         r##hide(()); c##show(()); rr##hide(()); e##show(());
         Lwt_js.sleep 1. >>= fun () ->
         r##show(()); c##hide(()); rr##show(()); e##hide(());
         Lwt_js.sleep 1. >>= fun () ->
         flickr ()
       in
         flickr()
    )

let _ = test "text" (fun p -> p##text(50, 10, Js.string "It Works!"))

let _ =
  test "image"
    (fun p ->
        let url = Js.string "http://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Raffael_030b.jpg/100px-Raffael_030b.jpg"
        in
        p##setSize(106, 136);
        p##image(url, 3, 3, 100, 127)
    )

