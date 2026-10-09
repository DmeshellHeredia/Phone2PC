# OnePlus 5T (dumpling): estado de Wi-Fi y vídeo externo

**Revisión:** 2026-10-09. **Nuestro hardware:** todavía no ejecutó postmarketOS ni Ubuntu Touch en este proyecto. No hay validación de HDMI por DisplayLink.

## Sobre los vídeos que vio Emil

Emil reporta haber visto vídeos de personas construyendo una mini PC con **el mismo OnePlus 5T** donde el Wi-Fi no funciona con postmarketOS. Este dato se conserva como **testimonio de terceros pendiente de identificar** (aún no tenemos URLs, fechas ni las versiones utilizadas); no debemos invalidarlo solo porque una wiki muestre «Works».

## Evidencia documental e independiente

| Fuente | Información | Alcance de la evidencia |
|---|---|---|
| [Wiki postmarketOS: OnePlus 5T](https://wiki.postmarketos.org/wiki/OnePlus_5T_(oneplus-dumpling)) | WiFi: **Works**; USB OTG: **Broken**. | Capacidad reportada en el port; no garantiza conectividad tras cada arranque o en toda versión. |
| [Reporte de usuario OnePlus5T](https://www.lemmy.ml/post/47678114) | En postmarketOS **25.12 (mainline)** con kernel `linux-postmarketos-qcom-msm8998` logró conectarse, pero después de reiniciar desaparecía la interfaz `wlan0`. | Caso real documentado por su autor; no demuestra que falle en todos los equipos. |
| Vídeos descritos por Emil | Usuarios del mismo modelo reportan que el Wi-Fi no funciona. | **Sin corroborar directamente** hasta conocer enlaces y versión de imagen. |

**Conclusión rigurosa:** `Wi-Fi postmarketOS: posible, con reportes de inestabilidad; no validado en nuestro equipo`. Para una mini PC permanente se requiere Wi-Fi que resista reinicios y horas de uso; «funcionó una vez» no basta.

## USB OTG y DisplayLink

- La wiki de postmarketOS marca USB OTG como `Broken` para el OnePlus 5T; eso bloquea, en la configuración documentada, el uso normal de un dispositivo DisplayLink USB.
- «No hay soporte DisplayLink demostrado» **no equivale** a «es técnicamente imposible en cualquier kernel o futura versión».
- Ubuntu Touch **no confirma automáticamente** compatibilidad con DisplayLink; un controlador para Ubuntu desktop no demuestra funcionamiento en Ubuntu Touch ARM.
- La ruta LineageOS + Termux + Termux:X11 busca un escritorio gráfico local; **DisplayLink Presenter en Android sería una duplicación de pantalla**, sujeta a OTG, adaptador y permisos. No asumir HDMI nativo ni escritorio extendido.

## Datos que necesitamos de los vídeos

Para cada vídeo: enlace, fecha de publicación, modelo (`dumpling`), versión postmarketOS, tipo de kernel (mainline/downstream), síntoma exacto (no aparece `wlan0`, no detecta redes, no obtiene IP, se desconecta tras reiniciar) y solución indicada.

Los vídeos aún no están incorporados ni verificados. Crear un Issue con esos datos cuando Emil envíe los enlaces.

## Plan eventual de validación de Wi-Fi postmarketOS (NO ejecutar ahora)

Solo si en el futuro decidimos probar Linux nativo **en hardware seguro y con recuperación lista**:

1. Anotar imagen, fecha, kernel, firmware, versión y paquetes.
2. Ejecutar `ip -br link` y `nmcli device status` para comprobar interfaz y conexión (si NetworkManager está instalado).
3. Conectar a Wi-Fi y usar Internet; comprobar estabilidad sin suspensión.
4. Reiniciar varias veces, verificar si `wlan0` sigue apareciendo y repetir conexión.
5. Investigar logs de firmware/kernel (`dmesg`, registro de servicio de red) sin publicar identificadores únicos.
6. Registrar resultado concreto en Issue; **no usar comandos de instalación o flasheo en este documento**.

## Decisión del proyecto

**Prioridad:** conservar LineageOS Android 16 e instalar Termux + Debian + XFCE sin root. **PostmarketOS y Ubuntu Touch quedan como investigación**, sin hacer cambios destructivos en el OnePlus operativo.
