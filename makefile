INSTALL=install
DESTDIR=
PREFIX=/usr
SHAREDIR=$(PREFIX)/share/xhtml2man/xslt
MANDIR=$(PREFIX)/share/man/man1
BINDIR=$(PREFIX)/bin

all:

install:
	mkdir -p $(DESTDIR)$(MANDIR) || true
	mkdir -p $(DESTDIR)$(SHAREDIR) || true
	mkdir -p $(DESTDIR)$(BINDIR) || true
	$(INSTALL) -m 0644 xslt/xhtml2man.xslt $(DESTDIR)/$(SHAREDIR)
	$(INSTALL) -m 0644 documentation/html2man.1 $(DESTDIR)/$(MANDIR)
	$(INSTALL) -m 0755 sh/html2man $(DESTDIR)/$(BINDIR)
