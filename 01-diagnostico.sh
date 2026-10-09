#!/data/data/com.termux/files/usr/bin/bash
set -u
printf '\n=== Phone2PC | diagnostico (solo lectura) ===\n'
printf 'Fecha: '; date
printf 'Arquitectura: '; uname -m
printf 'Kernel: '; uname -r
printf 'Version Android: '; getprop ro.build.version.release
printf 'Modelo: '; getprop ro.product.model
printf 'ROM: '; getprop ro.build.display.id
printf 'Espacio disponible en Termux:\n'; df -h "$HOME" | head -n 2
printf 'Memoria:\n'; free -h
printf '\nGuarda la salida en results/primera-prueba.md, ocultando identificadores privados.\n'
