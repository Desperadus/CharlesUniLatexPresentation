# Makefile for compiling the LaTeX presentation for Charles University

# --- Variables ---

# Compiler commands
LATEX_COMPILER = pdflatex
BIBTEX_COMPILER = bibtex

# Source files
MAIN_TEX_FILE = presentation.tex
# Automatically get the base name of the main TeX file (e.g., "presentation")
MAIN_FILE_BASE = $(basename $(MAIN_TEX_FILE))

# Bibliography file (as specified in presentation.tex)
BIB_FILE = bib/ref_nn.bib

# Custom style file for the theme
STYLE_FILE = beamerthemeUH-Slides-ECE.sty

# University logo file used by the theme
LOGO_FILE = assets/UK_logo.pdf

# Output PDF file
PDF_FILE = $(MAIN_FILE_BASE).pdf

# List of important dependencies that should trigger a recompile if they change
# Add other critical assets if necessary (e.g., static background images defined in the .sty)
DEPS = $(MAIN_TEX_FILE) $(BIB_FILE) $(STYLE_FILE) $(LOGO_FILE)


# --- Targets ---
# Phony targets are not actual files
.PHONY: all clean view

all: $(PDF_FILE)

# Rule to generate the PDF file
# This rule lists its dependencies. If any of them change, Make will rebuild the PDF.
$(PDF_FILE): $(DEPS)
	@echo "=== Compiling $(MAIN_TEX_FILE) with $(LATEX_COMPILER) (Pass 1) ==="
	$(LATEX_COMPILER) $(MAIN_FILE_BASE)
	@echo "=== Running $(BIBTEX_COMPILER) on $(MAIN_FILE_BASE) (for bibliography) ==="
	$(BIBTEX_COMPILER) $(MAIN_FILE_BASE)
	@echo "=== Compiling $(MAIN_TEX_FILE) with $(LATEX_COMPILER) (Pass 2 after bibtex) ==="
	$(LATEX_COMPILER) $(MAIN_FILE_BASE)
	@echo "=== Compiling $(MAIN_TEX_FILE) with $(LATEX_COMPILER) (Pass 3 for final cross-references) ==="
	$(LATEX_COMPILER) $(MAIN_FILE_BASE)
	@echo "=== $(PDF_FILE) successfully generated. ==="

# Target to clean up generated auxiliary files and the final PDF
# To run: make clean
clean:
	@echo "=== Cleaning up generated files... ==="
	rm -f $(MAIN_FILE_BASE).aux \
	      $(MAIN_FILE_BASE).log \
	      $(MAIN_FILE_BASE).toc \
	      $(MAIN_FILE_BASE).snm \
	      $(MAIN_FILE_BASE).out \
	      $(MAIN_FILE_BASE).nav \
	      $(MAIN_FILE_BASE).bbl \
	      $(MAIN_FILE_BASE).blg \
	      $(MAIN_FILE_BASE).synctex.gz \
				$(MAIN_FILE_BASE).fls \
				$(MAIN_FILE_BASE).fdb_latexmk \
				aca.aux \
				pat.aux \
	      $(PDF_FILE)
	@echo "=== Cleanup complete. ==="

view: $(PDF_FILE)
ifdef PDF_VIEWER
	@echo "=== Opening $(PDF_FILE) with $(PDF_VIEWER)... ==="
	$(PDF_VIEWER) $(PDF_FILE)
else
	@echo "PDF_VIEWER variable is not set in the Makefile or your environment."
	@echo "Please open $(PDF_FILE) manually."
	@echo "To enable this target, set the PDF_VIEWER variable. For example:"
	@echo "  On Linux, you might use: export PDF_VIEWER=evince"
	@echo "  On macOS, you might use: export PDF_VIEWER=open"
endif
