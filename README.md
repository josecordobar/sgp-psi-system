# SGP-Psi: Sistema de Gestión Psicopedagógica

<div align="center">
  <img src="https://img.shields.io/badge/Status-En%20Desarrollo-yellow" alt="Status">
  <img src="https://img.shields.io/badge/Next.js-14-black" alt="Next.js">
  <img src="https://img.shields.io/badge/Supabase-PostgreSQL-green" alt="Supabase">
</div>

## 📝 Resumen General del Proyecto

**SGP-Psi** es una plataforma SaaS (Software as a Service) Multi-tenant diseñada para especialistas en psicopedagogía infantil. Permite a las doctoras gestionar sus consultorios de forma digital y a los padres de familia acceder a información relevante sobre el tratamiento de sus hijos desde cualquier dispositivo.

La aplicación funciona bajo una arquitectura de **rutas diferenciadas**, donde cada doctora tiene su propio portal accesible mediante un código slug (ej. `portal.com/doctora-maria`). El sistema está optimizado para dispositivos móviles (PWA), permitiendo una experiencia similar a una aplicación nativa sin necesidad de tiendas de descarga.

## 🚀 Funcionalidades Principales

### Para los Especialistas (Doctoras)
- **Gestión Multi-Tenant:** Cada doctora tiene su propio espacio aislado con marca personalizada (Logo, Firma, Sello).
- **Agenda Inteligente:** Calendario interactivo para agendar citas. Recepción de solicitudes de reagendado de los padres con flujo de aprobación.
- **Expedientes Digitales:** Registro de notas privadas (diagnóstico) y públicas (retroalimentación), además de carga de archivos médicos.
- **Gestión de Pacientes:** Aprobación de nuevos usuarios y visualización de datos demográficos.
- **Marketing y Reportes:** Envío de campañas de correo segmentadas y visualización de estadísticas de consultorio.

### Para los Padres de Familia
- **Auto-Registro:** Registro rápido mediante código QR o enlace, protegido por validación de la doctora.
- **Portal del Paciente:** Visualización del historial de citas, notas de retroalimentación y archivos adjuntos.
- **Comprobantes de Asistencia:** Generación automática de justificantes laborales en PDF con código de validación único y firma digital.
- **Solicitud de Cambios:** Flujo de solicitud de cancelación o reagendado de citas integrado.

### Para la Plataforma (Super Admin)
- **Gestión de Doctores:** Alta y baja de cuentas de especialistas (Tenants).
- **Control de Suscripciones:** Gestión de estados de cuenta (Trial, Activo, Suspendido).

## 📂 Estructura de Documentación

Este repositorio sigue una metodología **Documentation-First**. Antes de escribir código, consulta los siguientes archivos:

- **`INSTRUCTIONS.md`**: Guía de estilo y reglas de generación de código para IA (Cursor).
- **`docs/acceptance-criteria.feature`**: Criterios de aceptación en formato BDD (Gherkin) para testing.
- **`docs/database-schema.md`**: Diseño detallado de entidades y relaciones (ERD).
- **`docs/use-cases.md`**: Narrativa paso a paso de los flujos de usuario.
- **`docs/routes.md`**: Mapa de rutas y endpoints de la aplicación.
- **`docs/ui-guidelines.md`**: Paleta de colores y componentes de interfaz.

## 🛠️ Stack Tecnológico

- **Framework:** Next.js 14 (App Router)
- **Lenguaje:** TypeScript
- **Estilos:** Tailwind CSS + Shadcn/UI
- **Backend & DB:** Supabase (PostgreSQL) + Prisma ORM
- **Auth:** Supabase Auth
- **PDF:** @react-pdf/renderer
- **Gráficos:** Recharts

## 🏁 Inicio Rápido (Para Desarrolladores)

1. Clonar el repositorio.
2. Instalar dependencias: `npm install`.
3. Configurar variables de entorno (ver `tech-stack.md`).
4. Ejecutar migraciones: `npx prisma db push`.
5. Iniciar servidor: `npm run dev`.

---

**Desarrollado con ❤️ para mejorar la gestión de la salud mental infantil.**
