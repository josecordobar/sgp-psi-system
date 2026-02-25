# Diseño de Base de Datos (Entidad-Relación)

## Tabla: Users (Usuarios)
- id (UUID)
- email (String, Unique)
- role (Enum: SUPER_ADMIN, DOCTOR, PARENT)
- status (Enum: ACTIVE, PENDING_APPROVAL)
- created_at

## Tabla: Tenants (Consultorios)
- id (UUID)
- slug (String, Unique) -> ej: "doctora-maria"
- name (String)
- logo_url (String)
- signature_url (String) -> Para comprobantes
- stamp_url (String) -> Para comprobantes
- plan_status (Enum: TRIAL, ACTIVE, SUSPENDED) -> Control de suscripción SaaS
- trial_ends_at (DateTime)

## Tabla: Profiles (Perfiles)
- id (UUID)
- user_id (FK -> Users)
- tenant_id (FK -> Tenants) -> Para saber de qué consultorio es la cuenta.
- full_name (String)
- phone (String)
- privacy_accepted_at (DateTime) -> Cumplimiento legal

## Tabla: Patients (Pacientes)
- id (UUID)
- tenant_id (FK -> Tenants)
- parent_id (FK -> Users) -> El padre dueño del paciente.
- name (String)
- birth_date (DateTime)

## Tabla: Appointments (Citas)
- id (UUID)
- tenant_id (FK -> Tenants)
- patient_id (FK -> Patients)
- doctor_id (FK -> Users)
- date (DateTime)
- status (Enum: SCHEDULED, COMPLETED, CANCELLED, RESCHEDULE_REQUESTED)
- public_notes (Text) -> Visible para padres
- private_notes (Text) -> Solo doctora
- validation_code (String) -> Para PDFs

## Tabla: Files (Archivos Médicos)
- id (UUID)
- appointment_id (FK -> Appointments)
- url (String) -> Ruta segura
- type (String)

## Consideraciones de Infraestructura y Control

### Gestión de Suscripciones (SaaS)
El campo `plan_status` en la tabla `Tenants` permite controlar el acceso.
- **Lógica:** Si `plan_status` es `SUSPENDED`, el portal debe bloquear el acceso a pacientes/doctores y mostrar mensaje de cuenta suspendida.
- **Super Admin:** El rol `SUPER_ADMIN` accede mediante una ruta exclusiva (`/admin/login`) y no pertenece a un `Tenant` específico. Su función es crear nuevos Tenants y gestionar estados de cuenta.
