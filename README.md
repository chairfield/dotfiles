# My Dotfiles

This is my first attempt at a homegrown dotfile management repo.

It's based on Donald Knuth's [Literate
Programming](http://www.literateprogramming.com/knuthweb.pdf) methodology, but
built with Emacs' [Org mode](https://orgmode.org/) and its ability to [extract
source code](https://orgmode.org/manual/Extracting-Source-Code.html), called
_tangling_. To understand its implementation, begin by reviewing <bin/tangle.sh>
and <Makefile>.

I make this project public for educational purposes only.

## Acknowledgments

I wish to thank the following authors for heavily inspiring the architecture of
this repo:
* Lee Hinman, over at <writequit.org>, and his [Emacs Operating
  System](https://github.com/dakrone/eos) project, for providing the core
  approach to generating my dotfiles via org-tangle
* The [Complete Computing Environment](http://doc.rix.si/cce/cce.html) for
  inspiring both Lee and myself

## LICENSE

Distributed under the terms of the GPL v3.
