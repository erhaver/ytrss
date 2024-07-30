PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin

all:
	@echo RUN \'make install\' to install ytrss

install:
	@install -Dm 755 ytrss $(DESTDIR)$(BINDIR)/ytrss

uninstall:
	@rm -f $(DESTDIR)$(BINDIR)/ytrss
