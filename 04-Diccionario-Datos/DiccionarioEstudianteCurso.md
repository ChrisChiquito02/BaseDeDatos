
# 📚 Diccionario de Datos – Inscripción de Estudiantes en Cursos (Formato Codd)

## Tabla: ESTUDIANTE

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK          | Referencia a | Descripción                      |
|--------------|--------------|--------|-----|-----|------|--------|------------------------------|-------------|----------------------------------|
| `Matricula`  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                          | -           | Número de matrícula del estudiante |
| `Nombre`     | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Solo letras A-Z, longitud >= 3| -           | Nombre del estudiante            |
| `Apellido1`  | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Solo letras A-Z, longitud >= 3| -           | Primer apellido del estudiante   |
| `Apellido2`  | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Solo letras A-Z, longitud >= 3| -           | Segundo apellido del estudiante  |

## Tabla: CURSO

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK        | Referencia a | Descripción               |
|-------------|--------------|--------|-----|-----|------|--------|-----------------------------|-------------|---------------------------|
| `Codigo`    | VARCHAR      | 10     | ✅  | ❌  | ❌   | ✅     | Longitud mínima 3 caracteres| -           | Código único del curso     |
| `Nombre`    | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Longitud mínima 3 caracteres| -           | Nombre del curso          |

## Tabla: INSCRIPCION

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                       | Referencia a            | Descripción                        |
|--------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|------------------------|------------------------------------|
| `Matricula`  | INT          | -      | ✅* | ✅  | ❌   | ❌     | > 0                                       | ESTUDIANTE(Matricula)  | Número de matrícula del estudiante |
| `Codigo`     | VARCHAR      | 10     | ✅* | ✅  | ❌   | ❌     | Longitud mínima 3 caracteres               | CURSO(Codigo)          | Código del curso inscrito          |

### Notas:
- En INSCRIPCION, la clave primaria es compuesta (✅*) por Matricula + Codigo.
- Las claves foráneas apuntan correctamente a ESTUDIANTE y CURSO.
