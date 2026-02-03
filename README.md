# Intune - Script Platform - Full Desinstalador Bloatware

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue?logo=powershell)
![Intune](https://img.shields.io/badge/Intune-Ready-blue?logo=microsoft-intune)
![Windows](https://img.shields.io/badge/Platform-Windows-0078D6?logo=windows)

Este repositorio contiene un script de PowerShell avanzado diseñado para la **eliminación automatizada de bloatware** en entornos corporativos. Aunque funciona en cualquier equipo Windows, está **optimizado específicamente para dispositivos Lenovo** y preparado para su despliegue masivo mediante **Microsoft Intune**.

## 🚀 Descripción

El objetivo principal de este script es liberar espacio en disco y optimizar el rendimiento del sistema eliminando software preinstalado innecesario (bloatware) y soluciones de seguridad de terceros que suelen venir de fábrica (como McAfee), facilitando así la preparación de equipos para un entorno empresarial limpio.

El script realiza una limpieza profunda, eliminando no solo las aplicaciones sino también servicios, archivos residuales y entradas de registro.

## ✨ Funcionalidades Principales

El script automatiza la eliminación de los siguientes componentes:

### 🛡️ Seguridad (McAfee)
- **McAfee Agent / Security**: Detección y eliminación completa.
- **Herramientas de Limpieza**: Descarga y ejecución automática de herramientas oficiales (`Mccleanup.exe`, `MCPR`).
- **WebAdvisor & Safe Connect**: Desinstalación específica de estos módulos.
- **Limpieza profunda**: Eliminación de servicios, tareas y carpetas residuales en `C:\`.

### 💻 Lenovo Bloatware
- **Lenovo Vantage**: Tanto la versión Store App como el Servicio de Cliente de Escritorio.
- **Lenovo Now**: Desinstalación silenciosa.
- **Lenovo Utilities**: Lenovo Settings, Lenovo Companion, etc.

### 📦 Otras Aplicaciones
- **Dropbox**: Eliminación de paquetes Appx.
- **Intel® Unison™ Launcher**: Desinstalación mediante MSIEXEC.

## ⚙️ Características Técnicas

- **Auto-Elevación**: Si se ejecuta localmente sin permisos, el script solicita elevación a Administrador automáticamente.
- **Soporte Regional**: Detecta la configuración regional del sistema (en-US, de-DE, es-ES, etc.) para ajustar variables de entorno.
- **Modo Silencioso**: `ErrorActionPreference` ajustado a `SilentlyContinue` para evitar interrupciones durante el despliegue.
- **Limpieza de Directorios**: Búsqueda recursiva y forzada de carpetas residuales con nombres "McAfee" o "Lenovo" en la raíz del sistema.

## 📋 Requisitos de Uso

- **Sistema Operativo**: Windows 10 / Windows 11.
- **Privilegios**: Requiere permisos de **Administrador Local**.
- **Conectividad**: Requiere acceso a internet para descargar las herramientas de limpieza de McAfee (desde GitHub).

## 🔧 Despliegue en Microsoft Intune

Para desplegar este script a través de Microsoft Intune, sigue estos pasos:

1. Accede al portal de **Microsoft Intune admin center**.
2. Navega a **Dispositivos** > **Scripts** > **Añadir** > **Windows 10 y posteriores**.
3. Sube el archivo `Intune - Script Platform - Full Desinstalador Bloatware.ps1`.
4. Configura los ajustes de ejecución:
   - **Ejecutar este script con las credenciales de inicio de sesión**: 
     - ⚠️ **Importante**: El script recomienda marcar **SÍ** para asegurar la correcta desinstalación de aplicaciones de usuario como **Dropbox**.
     - *Nota*: Aunque el script tiene lógica de auto-elevación, Intune gestiona el contexto de forma diferente. Si el objetivo principal es software de sistema (McAfee/Lenovo), ejecutar como **SYSTEM** (No) es lo estándar, pero para Appx de usuario (Dropbox) se requiere contexto de usuario.
   - **Exigir comprobación de firma del script**: No (a menos que firmes tus scripts).
   - **Ejecutar script en host de PowerShell de 64 bits**: Sí.

## ⚠️ Disclaimer

Este software se proporciona "tal cual", sin garantía de ningún tipo.
- **Copia de Seguridad**: Se recomienda encarecidamente realizar una copia de seguridad de los datos importantes antes de ejecutar scripts de limpieza profunda.
- **Entorno de Pruebas**: Prueba siempre el script en un entorno controlado (máquina virtual o equipo piloto) antes de desplegarlo en producción.
- **Riesgo**: El uso de este script es bajo tu propia responsabilidad.

## 👥 Créditos

- **Autor Original**: HPC-Germany
- **Edición y Mejoras**: Alejandro Suárez @alexsf93
