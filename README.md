# SIVS Lab Thesis Template

An opinionated LaTeX template for master's and PhD theses at SIVS Lab, 
adapted from [Paul Horton's PHLab NCKU thesis template](https://gitlab.com/paulhorton/phlab-ncku-thesis-template).
See the [CHANGELOG](CHANGELOG.md ) for a full list of modifications.


## Prerequisites
### Ubuntu / Debian
```bash
sudo apt update
sudo apt install -y texlive-xetex latex-cjk-all biber latexmk
sudo apt install -y cpanminus && sudo cpanm Data::Lock
```

### Download
```bash
git clone https://github.com/SIVS-Lab/SIVSLab-thesis-template.git
```

## File Summary
```
├── thesis.tex                      # Main document — edit your content here
├── thesis.bib                      # Bibliography entries
├── compile-opts.tex                # Compile options
├── PHlab-thesis.cls                # Document class definition
├── PHlab-fonts-config.sty          # Font configuration
├── PHlab-frontmatter.tex           # Abstract, committee page, TOC, nomenclature
├── certificate.pdf                 # Defense certificate
├── NCKU-watermark-A4.pdf           # Official NCKU watermark
├── compile-thesis-from-scratch.pl  # Legacy full-compile script
├── latex-cleanup-tempfiles.pl      # Legacy cleanup script
└── PH-latex-tips.tex               # LaTeX writing tips (compile with xelatex)
```
> [!NOTE] 
> Note: Files in the root directory prefixed with PHlab- are formatting files.  
> You should not need to edit them unless you are customizing the template itself.

## Usage
### Document Class Options
Edit `\documentclass[]` in [thesis.tex](thesis.tex):
| Option                | Description                                                                |
| --------------------- | -------------------------------------------------------------------------- |
| `BibLaTeXsortingNone` | Keep citations in the order they appear instead of sorting by author name. |
| `PhD`                 | Enable PhD-specific formatting (omit for master's thesis).                 |


### Compile options
Uncomment the desired lines in [thesis.tex](thesis.tex) (for latexmk) or [compile-opts.tex](compile-opts.tex) (for legacy Perl/XeLaTeX):
| Command                        | Effect                                        |
| ------------------------------ | --------------------------------------------- |
| `\newcommand*\optCommittee{}`  | Include the defense committee signature page. |
| `\newcommand*\optHyperlinks{}` | Enable clickable hyperlinks in the PDF.       |
| `\newcommand*\optWatermark{}`  | Overlay the official NCKU watermark.          |

### Math Symbols
We recommend using `amssymb` instead of `unicode-math` (which is currently used to maintain template compatibility, as the two packages conflict). 
To switch packages, edit configuration in [PHlab-thesis.cls](PHlab-thesis.cls).


## Compile Document
### Latexmk (Recommended)
#### Full compilation
```bash
latexmk \
  -xelatex \
  -synctex=1 \
  -interaction=nonstopmode \
  -file-line-error \
  -jobname="thesis" \
  thesis.tex
```
#### Clean up auxiliary files
```bash
latexmk -c thesis.tex        # keep PDF
latexmk -C thesis.tex        # remove everything including PDF
```

### Perl / XeLaTeX + biber (Legacy)
If you prefer the legacy toolchain, use the provided Perl script or run XeLaTeX and biber manually.  
Compile options must be set in [compile-opts.tex](compile-opts.tex) instead of thesis.tex.
See the [original guide](https://gitlab.com/paulhorton/phlab-ncku-thesis-template/#usage) for details.
#### Full compilation
```bash
perl compile-thesis-from-scratch.pl compile-opts.tex
```
#### Quick compilation
```bash
xelatex  -jobname thesis compile-opts.tex
```
#### Clean up auxiliary files
```bash
perl latex-cleanup-tempfiles.pl thesis.tex
```

## Comparing Versions with latexdiff
You can use latexdiff to compare two latex files and marks up significant differences between them

1. Save your current version:
  ```bash
  cp thesis.tex thesis-old.tex
  ```
2. Edit [thesis.tex](thesis.tex) with your revisions.
3. Generate the diff source:
  ```bash
  latexdiff --type=BOLD thesis-old.tex thesis.tex > thesis-diff.tex
  ```
4. Compile as usual:
  ```bash
  latexmk -xelatex -jobname="thesis-diff" thesis-diff.tex
  ```

> [!TIP]
> If custom commands break the formatting, allow them explicitly:
> ```
> latexdiff --type=BOLD --append-textcmd="AbstractTW,AbstractEN" \
> thesis-old.tex thesis.tex > thesis-diff.tex
> ```

## LaTeX Workshop
We provide a default configuration for [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension on VSCode for useful commands.
### Build Recipes
| Recipe                     | Action                                                      |
| -------------------------- | ----------------------------------------------------------- |
| Compile thesis             | Build the current active file.                              |
| Compile thesis diff        | Generate and build `thesis-diff.tex` from `thesis-old.tex`. |
| Remove temporary files     | Delete auxiliary build files.                               |
| Remove all temporary files | Delete auxiliary files and the output PDF.              |
### Keyboard Shortcuts
| Shortcut     | Action                                 |
| ------------ | -------------------------------------- |
| `Ctrl+Alt+B` | Build the current file.                |
| `Ctrl+Alt+V` | Open the PDF viewer in a tab.          |
| `Ctrl+Alt+J` | Sync from source line to PDF position. |
| `Ctrl+Alt+C` | Clean up auxiliary files.              |

## Acknowledgements
This template is adapted from Paul Horton’s 
[PHLab NCKU thesis template](https://gitlab.com/paulhorton/phlab-ncku-thesis-template).  We sincerely thank him for his contribution.  

## License
This project is licensed under the GNU General Public License v3.0 (GPL-3.0).