(* This file is part of Learn-OCaml.
 *
 * Copyright (C) 2016 OCamlPro.
 *
 * Learn-OCaml is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Learn-OCaml is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>. *)

module StringMap = Map.Make (String)

type exercise_kind =
  | Project
  | Problem
  | Exercise

type exercise =
  { exercise_kind : exercise_kind ;
    exercise_title : string ;
    exercise_short_description : string option ;
    exercise_stars : float (* \in [0.,4.] *) }

and group =
  { group_title : string ;
    group_contents : group_contents }

and group_contents =
  | Exercises of exercise Map.Make (String).t
  | Groups of group Map.Make (String).t

open Json_encoding

let check_version_1 enc =
  conv
    (fun exercise -> ("1", exercise))
    (fun (version, exercise) ->
       if version <> "1" then begin
         let msg = Format.asprintf "unknown version %s" version in
         raise (Cannot_destruct ([], Failure msg))
       end ;
       exercise)
    (merge_objs (obj1 (req "learnocaml_version" string)) enc)

let map_enc enc =
  conv
    StringMap.bindings
    (List.fold_left (fun s (k,v) -> StringMap.add k v s) StringMap.empty)
    (assoc enc)

let exercise_kind_enc =
  string_enum
    [ "problem", Problem ;
      "project", Project ;
      "exercise", Exercise ]

let exercise_enc =
  conv
    (fun { exercise_kind = kind ;
           exercise_title = title ;
           exercise_short_description = short ;
           exercise_stars = stars } ->
      (kind, title, short, stars))
    (fun (kind, title, short, stars) ->
       { exercise_kind = kind ;
         exercise_title = title ;
         exercise_short_description = short ;
         exercise_stars = stars })
    (obj4
       (req "kind" exercise_kind_enc)
       (req "title" string)
       (opt "shortDescription" string)
       (req "stars" float))

let server_exercise_meta_enc =
  check_version_1 exercise_enc

let group_enc =
  mu "group" @@ fun group_enc ->
  conv
    (fun { group_title ; group_contents } -> (group_title, group_contents))
    (fun (group_title, group_contents) -> { group_title ; group_contents }) @@
  union
    [ case
        (obj2
           (req "title" string)
           (req "exercises" (map_enc exercise_enc)))
        (function
          | (title, Exercises map) -> Some (title, map)
          | _ -> None)
        (fun (title, map) -> (title, Exercises map)) ;
      case
        (obj2
           (req "title" string)
           (req "groups" (map_enc group_enc)))
        (function
          | (title, Groups map) -> Some (title, map)
          | _ -> None)
        (fun (title, map) -> (title, Groups map)) ]

let exercise_index_enc =
  check_version_1 @@
  union
    [ case
        (obj1 (req "exercises" (map_enc exercise_enc)))
        (function
          | Exercises map -> Some map
          | _ -> None)
        (fun map -> Exercises map) ;
      case
        (obj1 (req "groups" (map_enc group_enc)))
        (function
          | Groups map -> Some map
          | _ -> None)
        (fun map -> Groups map) ]

let lesson_index_enc =
  check_version_1 @@
  obj1 (req "lessons" (list @@ tup2 string string))
