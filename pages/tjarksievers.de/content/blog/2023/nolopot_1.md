+++
title = "Introduction"
date = 2023-10-19
author = "Tjark Sievers"
categories = ["Blog"]
tags = ["Python"]
series = "nolopot - A Computational Physics Project"
+++

This is the first post in a series of blog posts is about nolopot, a software package that started in a physics lecture I attended in 2022.
Currently it can be found on [Gitlab](https://gitlab.com/Ruberhauptmann/nolopot).
It was a project I did together with another person in the course, and after the course finished I took the code we had so far and build the current infrastructure of testing and deployment around it.

For the project we followed a [book by Rubin H. Landau et al.](https://sites.science.oregonstate.edu/~landaur/Books/CPbook/) (chapter 20).
In it, a method is introduced in order to solve the Schrödinger equation with a nonlocal potential, i.e. a potential that includes an integral over space:
$$
\int \mathrm{d} r^{\prime}\, V(r, r^{\prime}) \psi(r^{\prime})
$$
I will go deeper into the deeper mathematical and physical aspects of nonlocal potentials in general and the specific technique introduced in a later post.

Currently, the project a playground for me to try out principles and tools of software engineering in the context of scientific software.
As such, it does not produce physical results yet, but a goal is to reproduce the results of [this paper by Woon-young So and Byung-taik Kim](https://www.jkps.or.kr/journal/view.html?uid=1941).
The authors use the same technique introduced in the book by Landau to calculate bound states in an atomic physics context.

I plan to do posts on the things I learned about writing software that is not just a one-off project, but has the goal of being maintainable and adhere to principles making the work done with it reproducible.
