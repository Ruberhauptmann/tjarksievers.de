#! /bin/bash
# Installation der Klasse assignment.cls im
# lokalen LaTeX-Baum ${TEXMFHOME}
#
# Version 1.0, 14. Februar 2023, Tjark Sievers
#
ASSIGNMENT_CLASS=$(pwd)/lecture-notes.cls
TEXMFHOME=$(kpsewhich -var-value=TEXMFHOME)/tex/latex
export TEXMFHOME
TEXMFVAR=$(kpsewhich -var-value=TEXMFSYSVAR)
export TEXMFVAR
case $(uname -s) in
  SunOS)	GREP=/usr/xpg4/bin/grep
		;;
  *)		GREP=grep
		;;
esac
mkdir -p "${TEXMFHOME}"
cd "${TEXMFHOME}" || exit

# class nach ${TEXMFHOME} kopieren
if [ -f "${ASSIGNMENT_CLASS}" ]; then
   echo "${ASSIGNMENT_CLASS}" wird nach $(pwd) kopiert ...
   cp "${ASSIGNMENT_CLASS}" .
   texhash "${TEXMFHOME}"
else
   echo Datei "${ASSIGNMENT_CLASS}" ist nicht vorhanden
fi

exit 0
