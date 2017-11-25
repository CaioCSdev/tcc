#
# makefile para a compilação do documento
#
# Sáb Jun 23 21:13:37 BRT 2007
#

BASE_NAME = monografia_template
SOURCES_FILES = cap-introducao.tex cap-grmonty.tex cap-gpgpu.tex \
	cap-otimizacao.tex cap-resultados.tex cap-futuro.tex cap-conclusoes.tex


LATEX     = latex
PDFLATEX  = pdflatex
BIBTEX    = bibtex
MAKEINDEX = makeindex

pdf: $(BASE_NAME).pdf
ps: $(BASE_NAME).ps

$(BASE_NAME).pdf: $(BASE_NAME).tex $(SOURCES_FILES)
	$(PDFLATEX) $<
	$(BIBTEX) $(BASE_NAME)
	$(MAKEINDEX) $(BASE_NAME)
	$(PDFLATEX) $<
	$(PDFLATEX) $<
	$(PDFLATEX) $<

$(BASE_NAME).ps: $(BASE_NAME).tex
	$(LATEX) $<
	$(BIBTEX) $(BASE_NAME)
	$(MAKEINDEX) $(BASE_NAME)
	$(LATEX) $<
	$(LATEX) $<
	$(LATEX) $<

clean:
	rm -f $(BASE_NAME)*.ps $(BASE_NAME)*.dvi *.log \
	      *.aux *.blg *.toc *.brf *.ilg *.ind \
	      missfont.log $(BASE_NAME)*.bbl $(BASE_NAME)*.pdf $(BASE_NAME)*.out \
		  $(BASE_NAME)*.lof $(BASE_NAME)*.lot $(BASE_NAME)*.idx
