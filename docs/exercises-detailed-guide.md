# Detailed exercise guide for TAs
====================================

## Building graders

### Set up a local development environment

Follow the instructions on [this doc](howto-deploy-a-learn-ocaml-instance.md) to
setup a local environment. You can use the setup with Docker or Docker COmpose,
but keep in mind they require space in disk and a good amount of RAM. 
Opting for the manual setup with `make && make opaminstall` tends to be faster
and simpler for developing exercises. You do the manual compilation once and then you
just use `learn-ocaml build --repo=/your/path/to/repo` + `learn-ocaml serve` every time
you make a change in the graders.

Contact the appropriate staff in your course to obtain access to the official
exercise repo (the one you'll use for `--repo=`).

For practical purposes, let us assume our repo will be `/your/path/to/repo`. This directory should have the structure described [here](tutorials/step-0.md):

```
.
├── exercises
│   ├── exercise1
│   │   ├── descr.html
│   │   ├── meta.json
│   │   ├── prelude.ml
│   │   ├── prepare.ml
│   │   ├── solution.ml
│   │   ├── template.ml
│   │   └── test.ml
│   ├── exercise2
│   │   ├── ...
│   ├── index.json
├── tutorials
│   ├── index.json
│   ├── some-tutorial.html
│   ├── some-other-tutorial.md
```


The same document also describes the goal of each file, but we'll sum it up here for brevity.

### The exercise directory structure

For every assignment in the `exercises` folder, make sure you have all the required files:

* `descr.html` with the exercise description. This is what appears under the Exercise tab. Make sure to use use correct syntax.
* `prelude.ml` shows the code in the OCaml prelude area (top right). Students cannot change this code and they normally contain pre-defined helper functions or types
* `prepare.ml` is an OCaml code fragment inserted after the prelude when the student answer is graded and hidden to the student. It is in this file that you can prevent students from using certain functions (i.e. check the occurrences of `List.map`).
* `solution.ml` is the official solution for the exercise. You can access it from the grader file, `test.ml`.
* `template.ml` is what the initial code the student will see on the code area. You can add function definitions, comments, etc.
* `meta.json` has meta-info about the exercise, mostly for displaying the content of the `Details` tab in LearnOCaml. You can find the complete list of fields it supports [here](exercises_format.md)
* `test.ml` is the grader file. We will cover it in the next section.


### The grader file

Writing graders is a good programming exercise! 

We normally start building a grader with the simplest mechanism we have. Assume you have a function in your exercise, 
`let rec fast_exp x k = (* impl *)`. To test the student's solution, use `test_function_2_against_solution`. `test.ml` will also require some plumbing code around it. Take a look [here](tutorials/step-1.md) and [here](tutorials/step-2.md).


`test_function_2_against_solution` has a lot of configurable parameters. You can use [pre-defined samplers](tutorials/step-3.md) or you may need to generate [custom samplers](tutorials/step-4.md) depending on the input of your function. 

You may also need to write custom test functions - for example, if the return type is a float, you can't have exactly comparison; you need to add an interval. See [this file](tutorials/step-7.md) for a better description.




