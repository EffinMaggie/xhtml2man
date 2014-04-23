xhtml2man
=========

XSLT to turn proper XHTML documents into man pages. Also contains a sample shell
script to convert poorly-formatted (X)HTML into something that at least won't
blow up the XSLT processor.

# Usage

Apply the stylesheet like you would any other stylesheet, e.g. with xsltproc(1):

```sh
$ xsltproc xhtml2man.xslt input.xhtml > output.7
```

Alternatively, use the sh/html2man sample script, which will filter stuff using
xsltproc after applying cleanups using tidy(1) and possibly even downloading the
source (X)HTML using curl(1). For more information, use...

```sh
$ man html2man
```

... after installing the package. Example usages would be:

```sh
$ cat input.xhtml | html2man > output.7
$ html2man -i input.xhtml > output.7
$ html2man -r -i http://en.wikipedia.org/wiki/man_page > output.7
```

# Installation

Use the supplied makefile, like this:

```
# make install
```

The paths where the makefile will put things are customisable. See the makefile
for more details, but in particular...

```
# make install DESTDIR=/some/custom/base/path
```

# Contact

I'm lounging around on the freenode IRC servers, channel \#kyuba, as user
jyujin. You might also want to check out my blog: http://ef.gy/ - this contains
more methods of contacting me. If you're real creative like, use whois on that
domain to find my email address.
