# language: es
Característica: Sistema de Gestión Psicopedagógica (SGP-Psi)
  Como sistema de gestión para especialistas y padres
  Quiero asegurar que los flujos críticos funcionen según los requerimientos
  Para garantizar la seguridad de los datos y una experiencia de usuario correcta

  @autenticacion @seguridad
  Regla: Los usuarios deben autenticarse en el contexto de un consultorio específico

    Escenario: CU-001 Registro exitoso de padre con selección de consultorio implícita (por URL)
      Dado que el padre se encuentra en la página de registro "/doctora-maria/registro"
      Cuando el padre ingresa sus datos personales: nombre, email "nuevo@padre.com" y teléfono
      Y marca el checkbox "Acepto Aviso de Privacidad"
      Y presiona el botón "Registrarse"
      Entonces el sistema crea una cuenta de usuario con estado "Pendiente de Aprobación"
      Y el usuario queda vinculado automáticamente al consultorio de la "Doctora María"
      Y el sistema muestra el mensaje "Registro exitoso. Espere aprobación."

    Escenario: CU-001 Intento de registro sin aceptar privacidad
      Dado que el padre se encuentra en la página de registro
      Cuando el padre ingresa todos sus datos personales válidos
      Y NO marca el checkbox "Acepto Aviso de Privacidad"
      Y presiona el botón "Registrarse"
      Entonces el sistema NO crea la cuenta de usuario
      Y el sistema muestra un mensaje de error "Debe aceptar el aviso de privacidad para continuar"

    Escenario: CU-002 Login exitoso de padre con URL específica
      Dado que existe un padre con email "padre@test.com" y pacientes registrados con la "Doctora María"
      Y que el padre se encuentra en la página de login "/doctora-maria/login"
      Cuando el padre ingresa sus credenciales correctas
      Y presiona "Ingresar"
      Entonces el sistema valida las credenciales
      Y el sistema permite el acceso al Dashboard del padre
      Y el padre visualiza únicamente a sus hijos asociados con la "Doctora María"

    Escenario: CU-002 Padre intenta acceder a consultorio incorrecto
      Dado que existe un padre con email "padre@test.com" registrado solo con la "Doctora María"
      Y que el padre se encuentra en la página de login "/doctora-juan/login"
      Cuando el padre ingresa sus credenciales correctas
      Y presiona "Ingresar"
      Entonces el sistema valida las credenciales correctamente
      Pero el sistema deniega el acceso mostrando el error "No tienes pacientes registrados en este consultorio"

  @citas @flujos
  Regla: Las citas deben gestionarse con un flujo de aprobación para cambios

    Escenario: CU-005 Solicitud de reagendado enviada
      Dado que el padre tiene una cita agendada para el día "2023-12-10"
      Y la cita tiene estado "Agendada"
      Cuando el padre selecciona la opción "Solicitar Cambio"
      E ingresa el motivo "Emergencia familiar"
      Y confirma la solicitud
      Entonces el estado de la cita cambia a "Pendiente de Aprobación"
      Y el sistema envía una notificación inmediata a la cuenta de la "Doctora María"

    Escenario: CU-006 Doctora aprueba solicitud de reagendado
      Dado que la doctora tiene una solicitud de reagendado pendiente
      Y que la doctora ha seleccionado un nuevo horario disponible en su calendario
      Cuando la doctora presiona "Aprobar Cambio"
      Entonces el sistema actualiza la cita con la nueva fecha y hora
      Y el estado de la cita regresa a "Agendada"
      Y el sistema envía una notificación al padre con el mensaje "Su solicitud ha sido aprobada"

    Escenario: CU-006 Doctora rechaza solicitud de cambio
      Dado que la doctora tiene una solicitud de reagendado pendiente
      Cuando la doctora presiona "Rechazar Solicitud"
      Entonces la cita mantiene su fecha y hora original
      Y el estado de la cita regresa a "Agendada"
      Y el sistema envía una notificación al padre con el mensaje "Su solicitud no fue aprobada"

  @expedientes @seguridad
  Regla: La privacidad de las notas médicas debe ser respetada

    Escenario: CU-007 Visualización de notas públicas vs privadas
      Dado que el padre accede al expediente de su hijo
      Y que la cita del "2023-11-01" tiene notas privadas "Diagnóstico interno" y notas públicas "Ejercicios"
      Cuando el padre abre el detalle de esa cita
      Entonces el padre visualiza el texto "Ejercicios"
      Y el padre NO visualiza el texto "Diagnóstico interno"

  @comprobantes @validacion
  Regla: Los comprobantes deben ser válidos y verificables por terceros

    Escenario: CU-009 Validación exitosa de justificante
      Dado que existe un comprobante generado con código único "VAL-12345"
      Y que el tercero no ha iniciado sesión en el sistema
      Cuando el tercero accede a la URL "/validar-comprobante"
      E ingresa el código "VAL-12345"
      Entonces el sistema muestra una pantalla de confirmación verde
      Y el sistema muestra el mensaje "Comprobante Válido"

  @admin @plataforma
  Regla: La plataforma debe permitir la gestión de nuevas doctoras

    Escenario: CU-010 Alta de nueva doctora por Super Admin
      Dado que el Super Admin ha iniciado sesión en el panel de administración
      Cuando ingresa los datos "Nombre: Dra. Ana, Email: ana@test.com, Slug: dra-ana"
      Y presiona "Crear Cuenta"
      Entonces el sistema crea el Tenant "dra-ana" con estado "TRIAL"
      Y se envía un correo de invitación a "ana@test.com"
