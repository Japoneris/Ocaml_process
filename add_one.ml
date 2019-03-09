(* Add +1 to received integer
 *
 * Compile with
 *
 * ocamlfind opt -linkpkg -package lwt.unix -package lwt_ppx add_one.ml -o script_1.out
 *
 * *)
open Lwt;;
open Lwt_unix;;


let to_int line =
        Scanf.sscanf line "%d " (fun x -> x)
;;

let () =
  let rec echo_loop () =
    let%lwt line = Lwt_io.(read_line stdin) in
    
    
    if line = "exit" then
      Lwt.return_unit
    else
      (*Int matching*)
      let v = to_int line in
      Printf.printf "%d => %d, " v (v+1);
      print_newline ();

      let%lwt () = Lwt_io.(write_line stdout line) in
      echo_loop ()
  in

Printf.printf "Print integer or exit";
print_newline();
  Lwt_main.run (echo_loop ())

