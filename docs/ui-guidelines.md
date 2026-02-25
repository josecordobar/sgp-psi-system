# Guía de Estilo y Diseño UI

## Principios
- **Limpio y Profesional:** El diseño debe transmitir confianza médica.
- **Mobile First:** La mayoría de los padres usarán el celular.
- **Accesibilidad:** Colores con buen contraste, textos legibles.

## Paleta de Colores (Sugerencia Tailwind)
- **Primario (Brand):** `sky-600` o `teal-500` (Transmite salud y calma).
- **Fondo:** `slate-50` o `white`.
- **Texto:** `slate-800`.
- **Alertas/Pendientes:** `amber-500`.

## Componentes Clave
1. **Selector de Consultorio (Combo):** Debe ser visible y claro en el Login.
2. **Dashboard Padre:** Tarjetas grandes y clickeables para cada hijo.
3. **Calendario Doctora:** Vista tipo calendario mensual o semanal.
4. **Botón Principal:** Llamativo, debe estar en la parte inferior en móviles para fácil acceso.

## Experiencia de Usuario (UX)
- Al solicitar reagendado, usar un modal (diálogo) en lugar de ir a otra página.
- Los botones de "Descargar PDF" deben ser visibles en el historial.

## Identidad de la Plataforma (System Brand)
Aunque cada doctora personaliza su portal con su logo, la "shell" del sistema (barras de navegación, botones de acción genéricos, modales) debe seguir la identidad de "SGP-Psi".

- **Fuente Principal:** Inter o Sans-serif limpia.
- **Color de Acento del Sistema:** `Indigo-600` (Para botones primarios como "Guardar", "Iniciar Sesión").
- **Feedback Visual (Toast Notifications):**
  - Usar librería `sonner` o `react-hot-toast`.
  - Éxito: Verde, esquina superior derecha, auto-desaparece.
  - Error: Rojo, debe ser dismissable (cerrable).
  - Loading: Spinner dentro del botón deshabilitado.

## Gestión de Estados Vacíos
- Cuando una lista no tenga datos (ej. sin citas, sin hijos), mostrar una ilustración simple y un texto guía: "Aún no tienes citas agendadas".
