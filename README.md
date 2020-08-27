Teaching the Art of Functional Programming
==========================================

This is a fork of the Learn-OCaml platform, with extensions implemented as described in the ICFP '19 submission *Teaching the Art of Functional Programming Using Automated Grading*.

Instructions for setting up and running the Learn-OCaml platform can be found in the **Howtos** section below.

The demo exercise in the folder `demo_repository` is modified from the original to include a demo of the mutation testing and style checking functionality.

Learn-OCaml
===========

This is Learn-OCaml, a platform for learning the OCaml language,
featuring a Web toplevel, an exercise environment, and a directory of
lessons and tutorials.

A demo is available at: (http://learn-ocaml.hackojo.org/).

Howtos
------

* [Detailed guide for writing exercises and graders](docs/exercises-detailed-guide.md)
* [How to set up an environment to develop exercises?](docs/howto-setup-exercise-development-environment.md)
* [How to write exercises?](docs/howto-write-exercises.md)
* [How to submit an exercise to the global corpus?](docs/howto-submit-an-exercise.md)
* [How to deploy an instance of Learn OCaml?](docs/howto-deploy-a-learn-ocaml-instance.md)

Contacts
--------

To ask any question about how to use Learn-OCaml, subscribe to
the mailing-list [learn-ocaml-club](https://sympa.inria.fr/sympa/subscribe/learn-ocaml-club).

To discuss about the development of Learn-OCaml, subscribe to
the mailing-list [learn-ocaml-dev](https://sympa.inria.fr/sympa/subscribe/learn-ocaml-dev).

License and copyright
---------------------

Unless explicitly written below or in the files themselves, the source
code for the app, images, static files, course content and exercises
are placed under the MIT license.

Lightly modified third party components ACE and ppx_metaquot are
included, under their original licenses (respectively BSD and MIT).

The OCamlPro logo images are (c) OCamlPro. Redistribution is
permitted, alteration requires prior written authorization by
OCamlPro.

The OCaml / ocaml.org logo is released under the very liberal UNLICENSE.
See (https://github.com/ocaml/ocaml.org/blob/master/LICENSE.md).

The Inconsolata font is released under the Open Font License.
See (http://www.levien.com/type/myfonts/inconsolata.html).

The Biolinum font is licensed under the GNU General Public License with
a the 'Font-Exception'.
See (http://www.linuxlibertine.org).

The public instance of Learn OCaml uses the Fontin font instead of
Biolinum. This font is licensed under the exljbris Font Foundry Free
Font License Agreement, which, to our understanding, does not allow us
to redistribute it. See (http://www.exljbris.com/eula.html). You will
optionally have to procure the files by yourself while building the
app. If not, the CSS provides a reasonable fallback font.

Contributions to this repository are placed under the BSD
license. This means that we can merge them with the same license as
the rest of the codebase, while you keep all the rights on your code.
And we will not have to bother you with any future license update.
See (https://opensource.org/licenses/BSD-3-Clause).

Authors and Acknowledgements
----------------------------

Learn-OCaml is a free software by the [OCaml Software Foundation](http://ocaml-sf.org).

 * The main authors are Benjamin Canou, Çağdaş Bozman and Grégoire Henry.

 * It builds on the previous experience of Try OCaml by Çağdaş Bozman.

 * We heavily use js_of_ocaml, so thanks to the Ocsigen team.

 * The text editing component is a customized version of ACE.

 * We also include a derivative of ppx_metaquot by Alain Frisch.
