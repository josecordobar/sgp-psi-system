# Guía de Implementación para Cursor AI

## Contexto
Este es un proyecto SaaS Multi-tenant (SGP-Psi) para gestión psicopedagógica. Antes de generar cualquier código, debes leer obligatoriamente los siguientes archivos para entender el contexto completo:
1. `docs/database-schema.md` (Estructura de datos y relaciones).
2. `docs/use-cases.md` (Lógica de negocio y actores).
3. `docs/acceptance-criteria.feature` (Pruebas de validación BDD).
4. `docs/routes.md` (Mapa de navegación).

## Stack Tecnológico (Reglas Fijas)
- Framework: Next.js 14 (App Router).
- Lenguaje: TypeScript (Strict Mode).
- Estilos: Tailwind CSS + Shadcn/UI.
- Base de Datos: Supabase (PostgreSQL) + Prisma ORM.
- Gráficos: Recharts.
- PDFs: @react-pdf/renderer.

## Reglas de Generación de Código
1. **Nomenclatura:**
   - Archivos: kebab-case (ej. `user-profile.tsx`).
   - Componentes: PascalCase (ej. `<UserProfile />`).
   - Funciones de utilidad: camelCase.
2. **Server vs Client:**
   - Usa React Server Components por defecto.
   - Solo usa `'use client'` en componentes que manejen eventos (onClick, onChange) o hooks de estado.
3. **Acciones (Backend):**
   - Prioriza Server Actions para mutaciones (Crear, Actualizar, Borrar) en lugar de crear rutas API tradicionales (`/api/...`), a menos que sea un webhook o servicio externo.
4. **Validación:**
   - Usa Zod para validar todos los inputs de formularios y Server Actions.
5. **Seguridad:**
   - Nunca expongas claves API en el cliente.
   - Siempre verifica la sesión del usuario y su `tenant_id` en Server Actions antes de manipular datos.

## Flujo de Trabajo por Módulo
Cuando se te pida implementar un módulo o funcionalidad, sigue este orden:
1. **Modelo:** Verifica si el esquema en `schema.prisma` necesita actualizaciones.
2. **Lógica:** Crea la Server Action correspondiente con validación Zod y manejo de errores.
3. **UI:** Genera los componentes necesarios usando la librería Shadcn/UI.
4. **Test Mental:** Revisa `acceptance-criteria.feature` y asegúrate de que el código generado cumple con los escenarios definidos allí.

## Notas Especiales del Proyecto
- **Multi-Tenancy:** Recuerda que los datos deben filtrarse siempre por `tenant_id` (el slug de la doctora). Nunca muestres datos cruzados entre doctoras.
- **Archivos:** Los archivos médicos deben servirse de forma segura. No uses URLs públicas.
- **PDFs:** Los comprobantes deben incluir la firma y sello que la doctora suba en configuración.
