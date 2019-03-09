# Ocaml process communication


Basic scripts for sending data without bindings.

Language agnostic. 

Here in `python3` for simplicity.

# How to

- Install libs for python3: `pip3 install -r requirements.txt --user`
- Install libs for Ocaml: See for [`Lwt`](https://github.com/ocsigen/lwt)
- Compile Ocaml scripts:
    - `ocamlfind opt -linkpkg -package lwt.unix -package lwt_ppx add_one.ml -o script_1.out`
    - `ocamlfind opt -linkpkg -package lwt.unix -package lwt_ppx make_sum.ml -o script_2.out`
    - `ocamlfind opt -linkpkg -package lwt.unix -package lwt_ppx difficult.ml -o script_3.out`
- Run the notebook `Communication.ipynb`
- Enjoy !

# Todo

- Add question to the notebook (messages size)
- Bindings for noobs ?
- Dune for install

