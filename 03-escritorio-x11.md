# Fase gráfica: Debian + XFCE + Termux:X11

**Requisito:** Debian funciona y el teléfono tiene almacenamiento libre suficiente. Antes de instalar, revisa la guía oficial: https://github.com/termux/termux-x11

1. En Android, instala la APK `termux-x11-universal-debug.apk` desde https://github.com/termux/termux-x11/releases/tag/nightly . Por ahora usa la variante universal estándar.
2. En **Termux**, fuera de Debian:
   ```bash
   pkg install x11-repo -y
   pkg install termux-x11-nightly -y
   termux-x11 :1 &
   proot-distro login debian --shared-tmp
   ```
3. **Dentro de Debian**:
   ```bash
   apt update
   apt install -y xfce4 dbus-x11
   export DISPLAY=:1
   dbus-launch --exit-with-session xfce4-session
   ```
4. Abre la aplicación Termux:X11 para ver el escritorio. Si aparece negro o falla, documenta el error; **no hagas cambios al kernel**.
5. Para cerrar: sal de la sesión de XFCE, escribe `exit` para volver a Termux y usa Exit desde la notificación de Termux:X11.

**Notas:** `--shared-tmp` es esencial para comunicación entre PRoot y Termux:X11. Android 16 puede limitar procesos en segundo plano; registra cierres inesperados antes de buscar ajustes avanzados. La instalación gráfica puede ocupar bastante almacenamiento y tardar varios minutos.
