# Mapa de Rutas y Endpoints

## Rutas del Super Admin (Aislado)
Por seguridad, las rutas de administración global no se mezclan con los consultorios.
- `/admin/login` -> Login exclusivo Super Admin.
- `/admin/dashboard` -> Estadísticas globales y gestión de tenants.
- `/admin/tenants` -> CRUD de Doctores (Tenants).

## Rutas Públicas (Sin Auth)
- `/` -> Redirección o selector global de consultorio.
- `/{slug}` -> Landing de la doctora.
- `/{slug}/login` -> Login.
- `/{slug}/registro` -> Registro.
- `/validar-comprobante` -> Página pública para terceros.

## Rutas Privadas - Padre (Auth requerida)
- `/{slug}/dashboard` -> Lista de hijos.
- `/{slug}/paciente/{id}` -> Expediente del hijo.
- `/{slug}/paciente/{id}/cita/{citaId}` -> Detalle y comprobante.

## Rutas Privadas - Doctora (Auth + Rol Admin)
- `/{slug}/admin` -> Panel principal.
- `/{slug}/admin/agenda` -> Calendario.
- `/{slug}/admin/pacientes` -> Gestión de usuarios.
- `/{slug}/admin/configuracion` -> Ajustes de perfil/firma.
- `/{slug}/admin/reportes` -> Estadísticas.

## API Endpoints (Backend)
- `POST /api/auth/callback` -> Supabase Auth.
- `GET /api/file/{id}` -> Descarga segura de archivos (verifica permisos).
- `POST /api/campaigns` -> Envío de correos masivos.
