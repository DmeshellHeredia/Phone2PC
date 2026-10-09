# Phone2PC — OnePlus 5T proof of concept

Proyecto colaborativo para reutilizar placas de teléfonos como mini PC ARM. **Fase actual: pruebas no destructivas; NO tenemos HDMI probado.**

## Dispositivo inicial

- OnePlus 5T (`dumpling`), Snapdragon 835, 6 GB RAM, 64 GB de almacenamiento (datos reportados).
- LineageOS basado en Android 16, pantalla y táctil funcionales.
- Botón de volumen dañado y batería con poca autonomía, sin apagados espontáneos.
- Emil prueba el equipo físicamente; la colaboración remota mantiene scripts, resultados y documentación.

## Rutas de trabajo

**A — principal (sin root):** LineageOS → Termux → PRoot-Distro (Debian) → XFCE → Termux:X11. Solo después investigaremos DisplayLink Presenter para duplicar la pantalla por USB, con OTG y adaptador compatibles. **No está probado en esta ROM.**

**B — experimental:** postmarketOS o Ubuntu Touch instalados directamente. Antes de flashear deben comprobarse firmware, Wi-Fi **estable**, USB host, vídeo, recuperación y funcionamiento de botones. No cambiar la ROM actual durante la fase A.

## Investigación: postmarketOS Wi-Fi y DisplayLink (09-10-2026)

**No podemos afirmar ni que el Wi-Fi siempre funciona ni que nunca funciona en el OnePlus 5T.** Hay evidencias contrapuestas:

1. La [wiki oficial de postmarketOS](https://wiki.postmarketos.org/wiki/OnePlus_5T_(oneplus-dumpling)) marca `WiFi: Works` y `USB OTG: Broken`.
2. Emil encontró vídeos de personas con **el mismo modelo** que reportan fallos de Wi-Fi en proyectos parecidos. **Falta recopilar los enlaces, imagen, versión y kernel**, por lo que sus condiciones concretas no están verificadas.
3. Existe un [reporte comunitario específico de OnePlus 5T](https://www.lemmy.ml/post/47678114): bajo postmarketOS 25.12 / kernel `linux-postmarketos-qcom-msm8998`, su autor logró conectarse, pero `wlan0` desaparecía tras reiniciar. **Es testimonio individual, no prueba universal.**

**Estado Phone2PC:** Wi-Fi postmarketOS = `reportado funcional en wiki / reportes concretos de inestabilidad / sin validar por nosotros`. La ruta DisplayLink mediante USB también sigue **sin validar**; la ficha de postmarketOS marca USB OTG como no funcional, un bloqueo importante para adaptadores USB.

La compatibilidad de Ubuntu Touch con una pantalla externa por DisplayLink **tampoco está demostrada**. No confundimos salida de vídeo nativa, DisplayLink USB y mirroring Android.

Más información y plan para contrastar las fuentes: [docs/compatibilidad-oneplus5t.md](docs/compatibilidad-oneplus5t.md).

## Primera sesión con Emil (sin root y sin flasheos)

1. Instalar Termux desde [F-Droid](https://f-droid.org/packages/com.termux/) o [GitHub](https://github.com/termux/termux-app/releases), sin mezclar firmas de APK/complementos.
2. Mantener ventilado el equipo. Si la batería se hincha o se calienta de forma anormal, suspender las pruebas; no improvisar alimentación directa a la batería.
3. En Termux ejecutar:

   ```bash
   pkg update && pkg upgrade -y
   pkg install git proot-distro -y
   git clone https://github.com/DmeshellHeredia/Phone2PC.git
   cd Phone2PC
   bash 01-diagnostico.sh
   bash 02-instalar-debian.sh
   proot-distro login debian
   ```

4. En Debian comprobar `cat /etc/os-release`, `uname -m`, `free -h` y `df -h`; salir con `exit`.
5. Si funciona, seguir [03-escritorio-x11.md](03-escritorio-x11.md).
6. Documentar evidencias en [primera-prueba.md](primera-prueba.md); el [plan de pruebas](docs/plan-pruebas.md) separa lo validado de lo pendiente.

**Advertencia:** estos enlaces se refieren a `main`; los cambios de esta investigación se publicarán cuando se apruebe y fusione su Pull Request.

## Criterios de éxito de la fase A

- [ ] Termux instalado y actualiza paquetes.
- [ ] Debian funciona dentro de PRoot, arquitectura `aarch64`.
- [ ] Termux:X11 muestra un escritorio XFCE en la pantalla del móvil.
- [ ] Estabilidad de 20 minutos y consumo/temperatura registrados.
- [ ] Ratón USB funciona bajo Android mediante OTG (independiente de DisplayLink).
- [ ] Antes de adquirir adaptadores, hay evidencia de soporte y alimentación apropiada.

## Seguridad y coordinación

- **No** flashear, rootear ni cambiar kernel en esta fase.
- **No** conectar fuentes a terminales de batería ni modificar PMIC sin hardware/protecciones/documentación apropiados.
- Evitar publicar IMEI, direcciones MAC completas, números de serie, cuentas y tokens.
- Abrir un Issue por cada fallo con modelo, ROM, versión de kernel, pasos, resultado esperado/real y logs anonimizados.
- Diferenciar **documentación oficial**, **testimonios de terceros** y **pruebas hechas por Emil**.
