# Especificación de Requerimientos del Sistema (ERS)
**Proyecto:** Sistema de Gestión Psicopedagógica (SGP-Psi)
**Versión:** 1.0 (MVP)

## 1. Introducción
Sistema SaaS Multi-tenant para gestión de expedientes psicopedagógicos infantiles. Permite a especialistas gestionar consultorios y a padres acceder a información de sus hijos.

## 2. Actores del Sistema
- **Doctora (Admin):** Gestiona su consultorio, agenda, pacientes y expedientes.
- **Padre (Usuario):** Accede al portal, ve expedientes, gestiona citas y descarga comprobantes.
- **Tercero (Visitante):** Valida comprobantes de asistencia sin login.

## 3. Requerimientos Funcionales

### RF-001: Gestión de Identidad y Acceso
- **Login con Contexto:** Debe existir un Combo/Dropdown en login/registro para seleccionar el consultorio (Doctora).
  - Si la URL contiene un slug (ej. `/doctoramaria`), el combo debe venir preseleccionado.
  - Si el usuario cambia el combo, la URL debe actualizarse automáticamente.
- **Registro:** El padre se registra vinculado a la doctora seleccionada. Estado inicial `PENDING_APPROVAL`.
- **Aprobación:** La doctora debe aprobar al padre para que pueda acceder al sistema.
- **Consentimiento:** Registro obligatorio con checkbox de "Aviso de Privacidad".

### RF-002: Portal del Padre
- **Dashboard:** Lista de hijos/pacientes.
- **Expediente:** Ver historial de citas, notas públicas de la doctora y descargar archivos.
- **Solicitud de Citas:** El padre puede solicitar reagendado/cancelación (no lo hace directo, requiere aprobación).
- **Comprobantes:** Generar PDF con datos de la cita, firma, sello y código de validación único.

### RF-003: Portal de la Doctora
- **Gestión de Usuarios:** Aprobar nuevos padres/pacientes.
- **Agenda:** Calendario para crear/mover citas. Notas privadas (solo doctora) y públicas (para padres).
- **Expedientes:** Subir archivos y notas diagnósticas.
- **Campañas:** Envío de emails masivos segmentados (por edad, última visita, etc).
- **Reportes:** Gráficos de ocupación/nuevos pacientes y exportación CSV.
- **Configuración:** Subir logo, firma digital y sello.

### RF-004: Validación Pública
- **Endpoint:** `/validar-comprobante?id={codigo}` accesible sin login para verificar autenticidad de justificantes.

## 4. Requerimientos No Funcionales
- **Seguridad:** Los archivos médicos deben servirse por API autenticada, nunca por URL pública.
- **Multi-Tenancy:** Aislamiento total de datos entre consultorios.
- **PWA:** La aplicación debe ser instalable en móviles.
