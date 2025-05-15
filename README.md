# LaTeX Beamer Presentation Template for Charles University in Prague

This project provides a LaTeX Beamer template designed for creating professional presentations at Charles University in Prague (Univerzita Karlova). It builds upon the [UH Beamer Templates](https://github.com/cainmagi/UH-beamer-templates) by cainmagi, with modifications to suit the visual identity of Charles University.

## File Structure
The project is organized as follows:
```
.
├── README.md               # This readme file
├── presentation.tex        # Main LaTeX file for your presentation content
├── beamerthemeUH-Slides-ECE.sty # The Beamer theme style file (usually not edited)
├── assets/
│   ├── praha_title.png     # Example background image for the title slide
│   └── uk_logo.pdf         # Charles University logo
└── bib/
└── ref_nn.bib          # Example BibTeX bibliography file

```


## How to Use

1.  **Prerequisites:**
    * A working LaTeX distribution (e.g., TeX Live, MiKTeX, or Overleaf).
    * Basic knowledge of LaTeX and Beamer.

2.  **Get the Template:**
    * Clone this repository or download it as a ZIP file.

3.  **Edit `presentation.tex`:**
    * **Title and Author Information:**
        * Change `\title{Insert Title Here}`
        * Change `\author{Your Name}`
        * Change `\subtitle{You can put a subtitle here}`
        * The `\institute{Charles University}` is preset.
    * **Title Page Background:**
        * Replace `assets/praha_title.png` with your desired image.
        * The line `\titleimage{\includegraphics[width=\paperwidth]{assets/praha_title.png}}` sets this image. Ensure your image path is correct.
    * **Content:**
        * Add your content within `\section{}`, `\subsection{}`, and `\begin{frame}...\end{frame}` environments.
        * Use `\frametitle{Your Frame Title}` for frame titles.
        * Refer to the example content in `presentation.tex` for usage of lists, blocks, equations, and figures.
    * **Bibliography:**
        * Add your bibliographic entries to `bib/ref_nn.bib` or your own `.bib` file.
        * Update `\bibliography{bib/ref_nn}` if you use a different BibTeX file name.
        * Cite using `\cite{your_citation_key}`.

4.  **Compile the Presentation:**
    * Compile `presentation.tex` using your LaTeX editor or command line. Compile it using the Makefile provided:
        ```bash
        make
        ```

## Customization

* **Aspect Ratio:**
    * Change `aspectratio=169` in `\documentclass[...,aspectratio=169,...]{beamer}` in `presentation.tex`. For example, to `aspectratio=43` for a 4:3 ratio.
* **Font Theme:**
    * To use a serif font throughout the presentation, uncomment the line:
        ```latex
        %\usefonttheme{serif} % Use serif font theme
        ```
        to:
        ```latex
        \usefonttheme{serif} % Use serif font theme
        ```
* **Colors:**
    * The theme uses a default color scheme (`color={default}`) tailored for a professional look, incorporating Charles University's identity.
    * The `beamerthemeUH-Slides-ECE.sty` file defines other color options (`Aramco`, `IEEE`), but the default is recommended for Charles University presentations.
    * Link colors can be customized in the `\hypersetup{...}` block in `presentation.tex`.
* **Date Display:**
    * The date in the sidebar and on the title page is managed by `\date[\MONTH~\the\day]{\today}`. `\MONTH` provides an abbreviated month name.
* **Outline at Section Start:**
    * The automatic display of the table of contents for the current section is controlled by the `\AtBeginSection[]{...}` block in `presentation.tex`. You can modify or remove this if needed.
* **Show/Hide Notes:**
    * To produce notes for slides, uncomment `%\setbeameroption{show notes}` in `presentation.tex`.
* **Sidebar Content:**
    * The option `hideothersubsections` is used in `\usetheme[...,hideothersubsections]{UH-Slides-ECE}` to show only subsections of the current section. You can change this to `hideallsubsections` or remove it to show all subsections.
* **"Thank You" Slide Image:**
    * The "Thank You" slide (`\ThankYouFrame`) can also have a background image. Define `\thanksimage{\includegraphics[width=\paperwidth]{assets/your_thanks_image.png}}` before calling `\ThankYouFrame` if desired (similar to `\titleimage`).

## Credits

This template is an extension of the [UH Beamer Templates](https://github.com/cainmagi/UH-beamer-templates) by cainmagi, adapted for Charles University in Prague. The original structure and many features are owed to that project.
The theme itself is based on the Uppsala theme.
