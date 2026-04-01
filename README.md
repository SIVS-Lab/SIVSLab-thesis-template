# SIVS Lab Thesis Template
An opinionated template for master's or PhD thesis at SIVS Lab.

# Acknowledgements
This template is adapted from Paul Horton’s 
[PHLab NCKU thesis template]((https://gitlab.com/paulhorton/phlab-ncku-thesis-template)).  
We sincerely thank him for his contribution.  

See the [CHANGELOG.md](CHANGELOG.md) for modifications made to the original version.

# Requirements
* xelatex
* biber

# Recommended
* perl module Data::Lock  (to run the compile-thesis-from-scratch.pl script)
* emacs  (always recommended :)

# Install
## Ubuntu / Debian
```
sudo apt install texlive-xetex
sudo apt install latex-cjk-all
sudo apt install biber
sudo apt install cpanminus
sudo cpanm Data::Lock
```

# Usage

## Download & Maintain
Clone (not fork) this repository to your local computer.
Place in your own gitlab/github repository with an informative
project name like: 'YOUR-NAME-master-thesis'.

## Copy template
    % cp thesis-example.tex thesis.tex
    % cp thesis-example.bib thesis.bib  #or copy in your own .bib file
    % sed s/-example//g compile-opts-example.tex > compile-opts.tex

## Edit Options
Select desired options by uncommenting lines in compile-opts.tex

## Edit Documents
Edit thesis.tex as desired to change content.
In particular change:
`\addbibresource{thesis-example.bib}` to point to your bib file.
`\documentclass[PhD]{PHlab-thesis}` --> `\documentclass{PHlab-thesis}` unless you are a PhD student.
`\documentclass{PHlab-thesis}` --> `\documentclass[BibLaTeXsortingNone]{PHlab-thesis}` if you do not want cited references to be sorted by author name.

## Compile Document
    % perl compile-thesis-from-scratch.pl compile-opts.tex

or manually:

    % xelatex  -jobname thesis  compile-opts.tex
    % biber  thesis
    % xelatex  -jobname thesis  compile-opts.tex
    % xelatex  -jobname thesis  compile-opts.tex
    % makeindex  thesis.nlo  -s nomencl.ist  -o thesis.nls
    % xelatex  -jobname thesis  compile-opts.tex

Not all of that is usually necessary;__
if an edit does not affect citations, labels or nomenclature,
just:

    % xelatex  -jobname thesis  compile-opts.tex

should be enough to update.


# File Summary

## Files Users Edit
    thesis.tex        Main thesis document.
    thesis.bib        To hold references
    config-opts.tex   Current compile options.  Better not to place it in git.

## Latex Formatting Files (users should not need to edit)
    PHlab-thesis.cls  class file.
    fonts-config.sty  configures fonts.
    frontmatter.tex   abstract, committee signature page, table of contents, nomenclature.

## Convenience Scripts
    compile-thesis-from-scratch.pl   Full compile from scratch.
    latex-cleanup-tempfiles.pl       Delete latex temp files.

## LaTex Tips (read the source code comments in these files)
    thesis-example.tex  Thesis template.
    PH-latex-tips.tex   A few tips on writing in LaTeX. Compile with xelatex.


# General Advice

## Version Control
Please do **not** place thesis.pdf or temporarily files like thesis.aux in git!
Version control is for source files.

## Filenames (including directory names)
Please use unix-friendly filenames.
你們是資訊系的學生而不是法文系之類!
In particular, filenames should not include spaces.
For example, if you have a directory holding run time tables,
do **not** name it ~~run time tables~~,
instead try `run-time-tables` or `runTimeTables`

# Setting up LaTeX Workshop in VSCode

1. Install [Latex Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop).
2. Create an empty `.vscode/settings.json` file.
3. Copy and paste the code below into it.
```json
{
  "latex-workshop.latex.tools": [
    {
      "name": "thesis-full",
      "command": "perl",
      "args": [
        "compile-thesis-from-scratch.pl",
        "compile-opts.tex"
      ]
    },
    {
      "name": "thesis-quick",
      "command": "xelatex",
      "args": [
        "-jobname=thesis",
        "compile-opts.tex"
      ]
    }
  ],

  "latex-workshop.latex.recipes": [
    {
      "name": "Thesis (Full Build)",
      "tools": ["thesis-full"]
    },
    {
      "name": "Thesis (Quick XeLaTeX)",
      "tools": ["thesis-quick"]
    }
  ],
  "latex-workshop.latex.autoBuild.run": "never",
  "latex-workshop.formatting.latex": "latexindent",
  "latex-workshop.latex.recipe.default": "Thesis (Quick XeLaTeX)"
}
```
