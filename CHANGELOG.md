# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.3] - 2026-08-21
### Added
- `latexdiff`
- Defense certificate
- Shell script to remove Sans-serif in `thesis.diff`
- Guide to convert BibLaTeX to BibTex

### Changed
- Change latexdiff's markup type from BOLD to CFONT

### Fixed
- Fix a bug in .gitignore that ignores all the pdfs. Oops.
- 

## [1.0.2] - 2026-08-11
### Fixed
- Add missing temporary files generated during compilation in .gitignore

### Changed
- Remove amssymb from the default packages

## [1.0.1] - 2026-08-08
### Fixed
- Title sizes in README


## [1.0.0] - 2026-08-07
### Added
- .pdf support for certificate page
- Some additional packages
- Acknowledgements footnote
- `.latexmkrc`
- `.vscode/settings.json`
  

### Changed
- Format files
- Rename commands with "中文" and "英文"
- Replace example files with the actual ones.
- Update `README.md`
- Update `.gitignore`

## [0.2.0] - 2026-04-05
### Added
- Add `latex-cjk-all` dependency.
- Add a new latex recipe: "Thesis (Full + Quick)".


### Fixed
- Fix typo
 
## [0.1.0] - 2026-03-31
   
### Changed
- Change margins according to https://www.cc.ncku.edu.tw/rule/content.php?sn=684
- Decrase the font size of abstract and keywords.
- Add indentation after sectional headings.
- Set the style to "thesis".
- Set the bibliography sorting to "none".
- Set the default bib file to `thesis.bib`.
- Replace "資訊工程學研究所" with "資訊工程學系".
- Replace default student and teacher names.
- Change the page style from "fancy" to "plain", removing headers and move the page number to the bottom center.
- Add guide for setting up LaTeX Workshop extension in VS Code.
- Add `.gitignore`.
 