
# 🏥 Diccionario de Datos – Gestión de Doctores y Pacientes en Hospital (Formato Codd)

## Tabla: DOCTOR

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK          | Referencia a | Descripción                |
|--------------|--------------|--------|-----|-----|------|--------|------------------------------|-------------|----------------------------|
| `IdDoctor`   | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                          | -           | Identificador único del doctor |
| `Nombre`     | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Solo letras A-Z, longitud >= 3| -           | Nombre del doctor            |

## Tabla: PACIENTE

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK          | Referencia a | Descripción                |
|---------------|--------------|--------|-----|-----|------|--------|------------------------------|-------------|----------------------------|
| `IdPaciente`  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                          | -           | Identificador único del paciente |
| `Nombre`      | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Solo letras A-Z, longitud >= 3| -           | Nombre del paciente            |

## Tabla: ATENCION

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                       | Referencia a          | Descripción                      |
|--------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|----------------------|----------------------------------|
| `IdDoctor`   | INT          | -      | ✅* | ✅  | ❌   | ❌     | > 0                                       | DOCTOR(IdDoctor)     | Identificador del doctor         |
| `IdPaciente` | INT          | -      | ✅* | ✅  | ❌   | ❌     | > 0                                       | PACIENTE(IdPaciente) | Identificador del paciente       |
| `Fecha`      | DATE         | -      | ❌  | ❌  | ❌   | ❌     | Fecha válida                              | -                    | Fecha de la atención médica      |
| `Diagnostico`| VARCHAR      | 200    | ❌  | ❌  | ❌   | ❌     | Longitud mínima 5 caracteres              | -                    | Diagnóstico registrado           |

### Notas:
- En ATENCION, la clave primaria es compuesta (✅*) por IdDoctor + IdPaciente.
- Las claves foráneas apuntan correctamente a DOCTOR y PACIENTE.
