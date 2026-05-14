instalar: winget install GnuWin32.CoreUtils (solo se instala grep) o choco install grep coreutils (falla)
instalar: https://www.cygwin.com/ o https://git-scm.com/install/windows
comprobar: uniq --version

llamar :Cygwin64 terminal y abrir

contar links unicos:
$ grep -Eo 'https?://[a-zA-Z0-9./?=_-]+' /cygdrive/c/Users/User/Documents/programacion2025/repositorio/proyectos/links-frontend-ia-2026/preproyecto/link-general.md | sort | uniq | wc -l
995

crear listado de links unicos:
$ grep -Eo 'https?://[a-zA-Z0-9./?=_-]+' /cygdrive/c/Users/User/Documents/programacion2025/repositorio/proyectos/links-frontend-ia-2026/preproyecto/link-general.md | sort | uniq > /cygdrive/c/Users/User/Documents/programacion2025/repositorio/proyectos/links-frontend-ia-2026/preproyecto/enlaces_unicos.txt

comprobar lineas que no son links: grep -vE 'https?://[a-zA-Z0-9./?=_-]+' /cygdrive/c/Users/User/Documents/programacion2025/repositorio/proyectos/links-frontend-ia-2026/preproyecto/link-general.md | wc -l
