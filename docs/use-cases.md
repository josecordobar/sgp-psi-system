# Casos de Uso del Sistema

## Módulo 1: Gestión de Identidad y Acceso

### CU-001: Registro de Nuevo Usuario (Padre)
**Actor:** Padre/Tutor.
**Precondición:** El padre posee el enlace/QR de una doctora específica.
**Flujo Principal:**
1. El padre accede a la ruta `/{slug-doctora}/registro`.
2. El sistema muestra el formulario con el combo "Consultorio" preseleccionado con la doctora correspondiente al slug.
3. El padre ingresa datos (Nombre, Email, Teléfono, Password).
4. El padre marca el checkbox obligatorio "Acepto Aviso de Privacidad".
5. El padre presiona "Registrarse".
6. El sistema crea la cuenta en estado `PENDING_APPROVAL`.
7. El sistema muestra mensaje: "Registro exitoso. Espere aprobación."

### CU-002: Login (Inicio de Sesión)
**Actor:** Usuario (Padre o Doctora).
**Flujo Principal:**
1. El usuario ingresa a `/{slug-doctora}/login`.
2. El sistema muestra el combo de consultorio preseleccionado.
3. El usuario ingresa credenciales.
4. El sistema valida:
   - Si es **Padre**: Verifica si tiene hijos asociados con la doctora seleccionada. Si sí, accede; si no, error.
   - Si es **Doctora**: Verifica que el email coincida con la dueña del slug. Si sí, accede; si no, error.

### CU-003: Aprobación de Usuario
**Actor:** Doctora.
**Flujo Principal:**
1. La doctora ve una alerta en su panel "Nuevos Registros".
2. Entra y visualiza datos del padre e hijos registrados.
3. Presiona botón "Aprobar".
4. El sistema cambia estado a `APPROVED` y envía email de confirmación al padre.

---

## Módulo 2: Gestión de Citas

### CU-004: Creación de Cita (Doctora)
**Actor:** Doctora.
**Flujo Principal:**
1. Doctora selecciona hueco en calendario.
2. Selecciona paciente de su lista.
3. Ingresa fecha/hora.
4. Guarda cita.
5. Sistema envía email al padre con detalles.

### CU-005: Solicitud de Reagendado (Padre)
**Actor:** Padre.
**Flujo Principal:**
1. Padre visualiza su próxima cita.
2. Presiona "Solicitar Cambio".
3. Ingresa motivo o propuesta.
4. Sistema cambia estado de cita a `RESCHEDULE_REQUESTED`.
5. Sistema notifica a la doctora.

### CU-006: Resolución de Solicitud (Doctora)
**Actor:** Doctora.
**Flujo Principal:**
1. Doctora ve solicitud en su panel.
2. Opciones: "Aprobar" (mover cita) o "Rechazar" (mantener original).
3. Sistema notifica al padre la decisión por email.

---

## Módulo 3: Expedientes y Documentos

### CU-007: Consulta de Expediente (Padre)
**Actor:** Padre.
**Flujo Principal:**
1. Padre selecciona un hijo de su lista.
2. Visualiza historial de citas.
3. Selecciona una cita pasada.
4. Lee "Notas Públicas" y descarga archivos adjuntos (vía endpoint seguro).
5. *Restricción:* No puede ver "Notas Privadas".

### CU-008: Generación de Comprobante (Padre)
**Actor:** Padre.
**Flujo Principal:**
1. Padre busca cita asistida.
2. Presiona "Generar Justificante".
3. Sistema genera PDF con: Logo, Datos Paciente, Fecha, Firma/Sello Doctora, Código de Validación.
4. Navegador descarga el PDF.

### CU-009: Validación de Comprobante (Tercero)
**Actor:** Tercero (sin login).
**Flujo Principal:**
1. Tercero accede a la URL impresa en el PDF (`/validar-comprobante`).
2. Ingresa el código manualmente.
3. Sistema valida existencia.
4. Muestra mensaje verde: "Comprobante Válido. Cita del [Fecha]".
