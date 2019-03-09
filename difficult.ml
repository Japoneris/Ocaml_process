(* Make sum of ones, in order to make an easy difficult calculation
 *
 * Compile with
 *
 *  ocamlfind opt -linkpkg -package lwt.unix -package lwt_ppx difficult.ml -o script_3.out
 *
 *)


open Lwt;;
open Lwt_unix;;

     
let costly i =
   let rec nest tot c =
      if c == i then tot
      else nest (tot+1) (c+1)
   in nest 0 0

let to_int line = Scanf.sscanf line "%d " (fun x -> x);;

let () =
  let rec echo_loop () =
    let%lwt line = Lwt_io.(read_line stdin) in
    
    if line = "exit" then
      Lwt.return_unit
    else
      (*Int matching*)
      let v = to_int line in
      Printf.printf "%d => %d, " v (costly v);
      print_newline ();

      let%lwt () = Lwt_io.(write_line stdout line) in
      echo_loop ()
  in

Printf.printf "Print integer or exit";
print_newline();
  Lwt_main.run (echo_loop ())




