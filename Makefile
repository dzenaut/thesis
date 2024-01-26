THESIS_BASE_NAME := thesis

# Try to guess platform-specific PDF viewer
PLATFORM := $(shell uname)
ifeq ($(PLATFORM),Darwin)
  PDF_VIEWER ?= open
endif
ifeq ($(PLATFORM),Linux)
  PDF_VIEWER ?= xdg-open
endif

all: $(THESIS_BASE_NAME).pdf

# No make dependencies for this target since latexmk already manages dependencies itself
$(THESIS_BASE_NAME).pdf:
	latexmk -pdf -use-make $(THESIS_BASE_NAME)

clean:
	latexmk -CA
	rm -f $(THESIS_BASE_NAME).bbl
	rm -f $(THESIS_BASE_NAME).dvi
	rm -f $(THESIS_BASE_NAME).run.xml
	rm -f $(THESIS_BASE_NAME).synctex.gz
	rm -f $(THESIS_BASE_NAME)-blx.bib
	rm -f *.log

view: $(THESIS_BASE_NAME).pdf
	$(PDF_VIEWER) $(THESIS_BASE_NAME).pdf 2> /dev/null &

.PHONY: all $(THESIS_BASE_NAME).pdf clean view

