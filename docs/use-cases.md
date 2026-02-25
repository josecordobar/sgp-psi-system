# Casos de Uso del Sistema

## Módulo 1: Gestión de Identidad y Acceso

### CU-001: Registro de Nuevo Usuario (Padre)
**Actor:** Padre/Tutor.
**Precondición:** El padre posee el enlace/QR de una doctora específica.
**Flujo Principal:**
1. El padre accede a la ruta `/{slug-doctora}/registro`.
2. El sistema detecta el slug y configura el contexto automáticamente (no requiere selección manual de consultorio si viene por URL).
3. El padre ingresa datos (Nombre, Email, Teléfono, Password).
4. El padre marca el checkbox obligatorio "Acepto Aviso de Privacidad".
5. El padre presiona "Registrarse".
6. El sistema crea la cuenta en estado `PENDING_APPROVAL`.
7. El sistema muestra mensaje: "Registro exitoso. Espere aprobación."

### CU-002: Login (Inicio de Sesión)
**Actor:** Usuario (Padre, Doctora o Super Admin).
**Flujo Principal:**
1. El usuario ingresa a la ruta correspondiente:
   - `/{slug-doctora}/login` (Doctora o Padre).
   - `/admin/login` (Super Admin).
2. **Si accede por URL con slug:** El sistema presupone el consultorio (no muestra combo o lo muestra fijo).
3. **Si accede por raíz:** El sistema muestra un selector de consultorio para elegir a dónde ir.
4. El usuario ingresa credenciales.
5. El sistema valida:
   - **Si es Padre**: Verifica si tiene hijos asociados con la doctora seleccionada.
   - **Si es Doctora**: Verifica que el email coincida con la dueña del slug.

### CU-003: Aprobación de Usuario
**Actor:** Doctora.
**Precondición:** Existen usuarios padres en estado "Pendiente de Aprobación".
**Flujo Principal:**
1. La doctora ve una alerta en su panel "Nuevos Registros".
2. Entra y visualiza datos del padre e hijos registrados.
3. Presiona botón "Aprobar".
4. El sistema cambia estado a `APPROVED` y envía email de confirmación al padre.

---

## Módulo 2: Gestión de Citas

### CU-004: Creación de Cita (Doctora)
**Actor:** Doctora.
**Precondición:** La doctora está en su panel de administración.
**Flujo Principal:**
1. Doctora selecciona hueco en calendario o presiona "Nueva Cita".
2. Selecciona paciente de su lista.
3. Ingresa fecha/hora y motivo.
4. Guarda cita.
5. Sistema envía email al padre con detalles de la nueva cita.

### CU-005: Solicitud de Reagendado (Padre)
**Actor:** Padre.
**Precondición:** Existe una cita futura con estado "Agendada".
**Flujo Principal:**
1. Padre visualiza su próxima cita.
2. Presiona "Solicitar Cambio".
3. Ingresa motivo o propuesta.
4. Sistema cambia estado de cita a `RESCHEDULE_REQUESTED`.
5. Sistema notifica a la doctora sobre la solicitud pendiente.

### CU-006: Resolución de Solicitud (Doctora)
**Actor:** Doctora.
**Precondición:** Existe una cita en estado `RESCHEDULE_REQUESTED`.
**Flujo Principal:**
1. Doctora ve solicitud en su panel de notificaciones.
2. Opciones: "Aprobar" (mover cita) o "Rechazar" (mantener original).
3. Sistema actualiza la cita y notifica al padre la decisión por email.

---

## Módulo 3: Expedientes y Documentos

### CU-007: Consulta de Expediente (Padre)
**Actor:** Padre.
**Precondición:** El padre tiene pacientes asociados y aprobados.
**Flujo Principal:**
1. Padre selecciona un hijo de su lista.
2. Visualiza historial de citas.
3. Selecciona una cita pasada.
4. Lee "Notas Públicas" y descarga archivos adjuntos (vía endpoint seguro).
5. *Restricción:* No puede ver "Notas Privadas" de la doctora.

### CU-008: Generación de Comprobante (Padre)
**Actor:** Padre.
**Precondición:** Existe al menos una cita con estado "Completada" o "Asistida".
**Flujo Principal:**
1. Padre busca cita asistida en el historial.
2. Presiona "Generar Justificante".
3. Sistema genera PDF con: Logo, Datos Paciente, Fecha, Firma/Sello Doctora, Código de Validación Único.
4. Navegador descarga el PDF automáticamente.

### CU-009: Validación de Comprobante (Tercero)
**Actor:** Tercero (sin login - ej. Patrono).
**Precondición:** El tercero posee un comprobante impreso con un código.
**Flujo Principal:**
1. Tercero accede a la URL impresa en el PDF (`/validar-comprobante`).
2. Ingresa el código manualmente.
3. Sistema valida existencia del código en la BD.
4. Muestra mensaje verde: "Comprobante Válido. Cita del [Fecha] con [Doctora]".

---

## Módulo 4: Administración de la Plataforma (Super Admin)

### CU-010: Onboarding de Nueva Doctora
**Actor:** Super Admin.
**Precondición:** El Super Admin ha iniciado sesión en `/admin/login`.
**Flujo Principal:**
1. El Super Admin accede al panel "Gestión de Consultorios".
2. Presiona "Agregar Nueva Doctora".
3. Completa datos básicos: Nombre, Email, y Slug deseado (ej: "doctora-maria").
4. El sistema crea el registro en `Tenants` con estado `TRIAL`.
5. El sistema crea el usuario con rol `DOCTOR` vinculado a ese Tenant.
6. El sistema envía credenciales temporales al email de la doctora.

### CU-011: Gestión de Sesión Multi-Portal (Padre)
**Actor:** Padre (con hijos en múltiples consultorios).
**Precondición:** El padre ya está autenticado en el sistema.
**Flujo Principal:**
1. El padre intenta acceder a un portal distinto (cambiando la URL).
2. El sistema detecta que tiene sesión activa.
3. **Validación:**
   - Si tiene pacientes en el nuevo portal -> Acceso permitido automáticamente.
   - Si NO tiene pacientes en el nuevo portal -> El sistema muestra mensaje: *"Tu usuario no tiene pacientes registrados en este consultorio"*.
