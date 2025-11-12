% ==========================================================
% moderntech.cls  —  Unified class over KOMA-Script
% Supports: [book|report|article] + passes options to moderntech-base
% Requires: XeLaTeX or LuaLaTeX
% Author: LCDR Victor Lee, USN, PMP
% ----------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{moderntech}[2025/11/06 v1.2 ModernTech unified class (KOMA-Script)]

% ---------- Engine guard ----------
\RequirePackage{iftex}
\ifPDFTeX
  \ClassError{moderntech}{This class requires XeLaTeX or LuaLaTeX}{Use xelatex or lualatex.}
\fi

% ---------- Option plumbing ----------
\makeatletter
\NewDocumentCommand{\mt@baseclass}{}{scrbook}   % default

\def\mt@markbaseoption#1{%
  \expandafter\def\csname mt@isbase@#1\endcsname{1}%
}
\mt@markbaseoption{tablesroman}
\mt@markbaseoption{smallcapsheads}
\mt@markbaseoption{justify}
\mt@markbaseoption{tblrpreset}
\mt@markbaseoption{tabularnums}
\mt@markbaseoption{sansbody}
\mt@markbaseoption{math}
\mt@markbaseoption{ieeebib}
\mt@markbaseoption{bibresource}
\mt@markbaseoption{minted}
\mt@markbaseoption{tikzsmart}

\def\mt@extractkey#1=#2\@nil{#1}
\def\mt@processoption#1{%
  \edef\mt@raw{#1}%
  \edef\mt@key{\expandafter\mt@extractkey\mt@raw=\@nil}%
  \edef\mt@key{\expandafter\strip@prefix\meaning\mt@key}%
  \@onelevel@sanitize\mt@key
  \ifcsname mt@isbase@\mt@key\endcsname
    \expandafter\PassOptionsToPackage\expandafter{\mt@raw}{moderntech-base}%
  \else
    \expandafter\PassOptionsToClass\expandafter{\mt@raw}{\mt@baseclass}%
  \fi
}

% Baseclass selector (friendly aliases)
\DeclareOption{book}{   \RenewDocumentCommand{\mt@baseclass}{}{scrbook}}
\DeclareOption{report}{ \RenewDocumentCommand{\mt@baseclass}{}{scrreprt}}
\DeclareOption{article}{\RenewDocumentCommand{\mt@baseclass}{}{scrartcl}}
% Also accept explicit KOMA names
\DeclareOption{scrbook}{  \RenewDocumentCommand{\mt@baseclass}{}{scrbook}}
\DeclareOption{scrreprt}{ \RenewDocumentCommand{\mt@baseclass}{}{scrreprt}}
\DeclareOption{scrartcl}{ \RenewDocumentCommand{\mt@baseclass}{}{scrartcl}}

% Collect any other option:
%  - forward to moderntech-base (theme features)
%  - also defer to KOMA class (layout knobs like DIV=, BCOR=, headings=, etc.)
\DeclareOption*{%
  \mt@processoption{\CurrentOption}%
}
\ProcessOptions\relax

% ---------- Load KOMA base with sane defaults ----------
% Provide class defaults (can be overridden by user options above)
\LoadClass[
  fontsize=11pt,
  headings=big,
  parskip=half,
  toc=graduated,
  listof=totoc
]{\mt@baseclass}
\KOMAoptions{
  paper=letter,
  headinclude=true,
  footinclude=true
}

% ---------- Early pass-throughs for common packages (safe defaults) ----------
% microtype: honor final even if global draft is set
\PassOptionsToPackage{final}{microtype}

% If the user sent color link prefs, moderntech-base handles them via \hypersetup.
% (No hard-set here to avoid overriding user policy.)

% ---------- Load the shared implementation ----------
\RequirePackage{moderntech-base}

% ---------- Convenience message ----------
\typeout{==============================================================}
\typeout{ moderntech.cls loaded as \mt@baseclass.}
\typeout{ Examples:}
\typeout{   \string\documentclass[book,justify,math=stix,bibresource=edo.bib]{moderntech}}
\typeout{   \string\documentclass[report,parskip=full]{moderntech}}
\typeout{   \string\documentclass[article,DIV=calc]{moderntech}}
\typeout{ All non-class options are forwarded to moderntech-base and KOMA.}
\typeout{==============================================================}

\makeatother

\endinput
