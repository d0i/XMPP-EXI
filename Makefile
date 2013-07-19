SRCS=exi.xml
HTMLS=$(SRCS:.xml=.local.html)

files: $(HTMLS)

$(HTMLS): $(SRCS)
	xsltproc xep.xsl $< > $@

view: files
	w3m -T text/html $<
server:
	python makeserver.py $(HTMLS)
clean::
	rm -f $(HTMLS)


