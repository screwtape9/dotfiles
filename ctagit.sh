#!/bin/bash
[[ -f tags ]] && rm tags
ctags -R --languages=C++ --C++-kinds=+lp --fields=+aiS --extra=+q .
#ctags -R --languages=C --C-kinds=+l .
