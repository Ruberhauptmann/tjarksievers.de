%! Class = lecture-notes
%! Author = tjark
%! Date = 17.02.23

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{lecture-notes}[Class for creating lecture notes in physics and related subjects]

\LoadClass[a4paper, twoside]{scrbook}

\RequirePackage{subfiles}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{bbm}
\RequirePackage{braket}
\RequirePackage{derivative}
\RequirePackage{ntheorem}
\RequirePackage{siunitx}

\RequirePackage{todonotes}

\RequirePackage{hyperref}

\RequirePackage{graphicx}

\RequirePackage{xcolor}
\definecolor{myred}{HTML}{A3061E}
\definecolor{myblue}{RGB}{0,63,119}
\definecolor{myyellow}{cmy}{0,0.263,0.741}
\definecolor{mygreen}{HTML}{0B6E4F}
\colorlet{myorange}{myyellow!60!myred}
\colorlet{myviolett}{myred!50!myblue!80}

\RequirePackage{tcolorbox}
\PassOptionsToPackage{dvipsnames}{xcolor}

\hypersetup{
    linkcolor = myblue,
    citecolor  = purple,
    urlcolor   = myblue,
    colorlinks = true,
}
