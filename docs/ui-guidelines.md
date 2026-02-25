# Guía de Estilo y Diseño UI

## Principios
- **Limpio y Profesional:** El diseño debe transmitir confianza médica.
- **Mobile First:** La mayoría de los padres usarán el celular.
- **Accesibilidad:** Colores con buen contraste, textos legibles.

## Paleta de Colores (Tailwind CSS)
- **Primario (System):** `Indigo-600` (Botones principales, headers).
- **Brand (Doctoras):** `Teal-500` o `Sky-600` (Identidad médica, secundarios).
- **Fondo:** `slate-50` o `white`.
- **Texto:** `slate-800`.
- **Alertas/Pendientes:** `amber-500`.

## Componentes Clave
1. **Selector de Consultorio:** Dropdown visible y claro en Login/Registro.
2. **Dashboard Padre:** Tarjetas grandes y clickeables para cada hijo.
3. **Calendario Doctora:** Vista mensual interactiva.
4. **Botón Principal:** Fijo en la parte inferior en móviles para fácil acceso.

## Feedback Visual y Notificaciones
- **Librería Obligatoria:** `sonner` (Toasts modernos y minimalistas).
- **Éxito:** Estilo success (verde), auto-desaparece.
- **Error:** Estilo error (rojo), permite dismiss.
- **Loading:** Usar `<Button loading={true}>` de Shadcn/UI.

## Gestión de Estados Vacíos
- Cuando una lista no tenga datos, mostrar ilustración simple y texto guía: "Aún no tienes citas agendadas".
