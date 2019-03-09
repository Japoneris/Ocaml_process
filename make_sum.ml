(* Make the sum of integers
 *
 * Compile with
 * 
 * ocamlfind opt -linkpkg -package lwt.unix -package lwt_ppx make_sum.ml -o script_2.out
 *
 * *)

open Lwt;;
open Lwt_unix;;

let to_int line = Scanf.sscanf line "%d " (fun x -> x);;

let () =
  let rec echo_loop mem =
    let%lwt line = Lwt_io.(read_line stdin) in
    
    if line = "exit" then
      Lwt.return_unit
    else
      (*Int matching*)
      let v = to_int line in
      Printf.printf "Total: %d, \n" (mem+v);
      Printf.printf "%d => %d, " v (v+1);
      print_newline ();

      let%lwt () = Lwt_io.(write_line stdout line) in
      echo_loop (mem + v)
  in

Printf.printf "Print integer or exit";
print_newline();
  Lwt_main.run (echo_loop 0)
