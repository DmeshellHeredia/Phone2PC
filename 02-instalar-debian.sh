#!/data/data/com.termux/files/usr/bin/bash
set -e
if ! command -v proot-distro >/dev/null 2>&1; then
  echo 'Instalando proot-distro...'
  pkg install proot-distro -y
fi
echo 'Instalando Debian (si ya existe, el gestor informará el estado)...'
proot-distro install debian
echo 'Para entrar: proot-distro login debian'
