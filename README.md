# Phone2PC — OnePlus 5T proof of concept

Proyecto colaborativo para reutilizar placas de teléfonos como mini PCs ARM.

## Hardware inicial
- OnePlus 5T (Snapdragon 835, 6 GB RAM, 64 GB)
- LineageOS, Android 16
- Pantalla y tactil funcionales; botón de volumen dañado
- Batería con poca autonomía, pero sin apagados espontáneos

## Arquitecturas a investigar
- **A (primera prueba):** Android + Termux + PRoot-Distro (Debian) + Termux:X11; evaluar DisplayLink posteriormente.
- **B (investigación):** Linux nativo (postmarketOS / Ubuntu Touch), pendiente de evaluar soporte USB OTG, vídeo y alimentación.

## Primera sesión (sin root, sin flasheos)
1. Instala Termux desde GitHub o F-Droid. **No mezcles fuentes de Termux y complementos.**
2. Conecta el móvil al cargador original y asegúrate de que tenga ventilación; suspende la prueba si se calienta en exceso o si la batería está hinchada.
3. Dentro de Termux, ejecuta:
   ```bash
   pkg update && pkg upgrade -y
   pkg install git proot-distro -y
   git clone https://github.com/TU_USUARIO/Phone2PC.git
   cd Phone2PC
   bash scripts/01-diagnostico.sh
   bash scripts/02-instalar-debian.sh
   ```
   **Antes de ejecutar `git clone`, reemplaza `TU_USUARIO` por el propietario real del repositorio.** También puedes copiar directamente los scripts si aún no publicaron el repositorio.
4. En Debian, ejecuta `cat /etc/os-release`, `uname -m`, `free -h`, `df -h` y anota resultados en `results/primera-prueba.md`. `exit` vuelve a Termux.
5. Si Debian funciona, sigue `docs/03-escritorio-x11.md`.

## Fase 1 — criterios de éxito
- [ ] Termux abre y puede instalar paquetes
- [ ] PRoot-Distro instala e inicia Debian
- [ ] Debian muestra arquitectura aarch64
- [ ] Termux:X11 abre XFCE en pantalla del teléfono
- [ ] Sesión estable 20 minutos (temperatura y batería vigiladas)

## Fuera de alcance en fase 1
Root, bootloader, kernel, eliminación de batería, modificaciones de circuitos, vídeo HDMI y compra de adaptadores. Las pruebas de DisplayLink y del sistema de alimentación se harán por separado.

## Trabajo remoto
- **Persona con el teléfono:** ejecuta pruebas, registra fotos y mensajes de error, confirma cambios antes de hacerlos.
- **Persona remota:** mantiene scripts, investiga compatibilidad, revisa los resultados y prepara correcciones mediante Pull Requests.
- Abrir Issues por cada fallo; no publicar identificadores únicos del dispositivo, contraseñas ni datos personales.

## Documentación de referencia
- https://github.com/termux/termux-app
- https://github.com/termux/proot-distro
- https://github.com/termux/termux-x11
- https://wiki.postmarketos.org/wiki/OnePlus_5T_(oneplus-dumpling)
