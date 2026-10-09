# Plan de pruebas remotas — OnePlus 5T

Objetivo: validar Phone2PC sin modificar bootloader, kernel ni ROM.

| Prueba | Qué debe comprobar Emil | Éxito |
|---|---|---|
| T01 Estado del dispositivo | LineageOS Android 16, carga, calentamiento, almacenamiento; botón de volumen deteriorado | Sistema estable y sin señal de daño de batería |
| T02 Consola | `bash 01-diagnostico.sh`; Termux y red Android | Comandos y paquetes funcionan |
| T03 Debian | `bash 02-instalar-debian.sh`; `proot-distro login debian`; `uname -m` | Debian ARM64 funcional |
| T04 Escritorio | `03-escritorio-x11.md` | XFCE visible localmente y operativo 20 min |
| T05 USB host | Ratón USB + adaptador OTG bajo Android | Mouse reconocido por LineageOS |
| T06 DisplayLink | Solo con adaptador DisplayLink compatible, prestado si es posible | Android permite espejo de pantalla hacia monitor; no confirmado |
| T07 Alimentación | Carga y OTG simultáneos solo con equipo comercial seguro | Sin reinicios ni calentamiento anormal |

Registrar fecha, versión exacta de ROM, resultado, mensaje de error y evidencia no sensible en `primera-prueba.md`.

**No flashear postmarketOS por el vídeo ni por lo que dice la wiki.** Primero obtener los enlaces y comparar versiones. Ni LineageOS ni Termux dependen del soporte Wi-Fi de postmarketOS.
