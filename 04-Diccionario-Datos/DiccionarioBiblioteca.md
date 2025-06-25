
# 📚 Diccionario de Datos – Biblioteca (Formato Codd)

## Tabla: LIBRO

| Campo     | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK        | Referencia a | Descripción                   |
|-----------|--------------|--------|-----|-----|------|--------|-----------------------------|-------------|-------------------------------|
| `ISBN`    | VARCHAR      | 13     | ✅  | ❌  | ❌   | ✅     | Longitud = 13               | -           | Identificador único del libro |
| `Titulo`  | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Longitud mínima 1 carácter  | -           | Título del libro              |
| `Autor`   | VARCHAR      | 80     | ❌  | ❌  | ❌   | ❌     | Longitud mínima 3 caracteres| -           | Autor del libro               |

## Tabla: LECTOR

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK          | Referencia a | Descripción                    |
|-----------------|--------------|--------|-----|-----|------|--------|------------------------------|-------------|--------------------------------|
| `Num_Membresia` | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                          | -           | Número de membresía del lector |
| `Nombre`        | VARCHAR      | 100    | ❌  | ❌  | ❌   | ❌     | Solo letras A-Z, longitud >= 3| -           | Nombre completo del lector     |

## Tabla: PRESTAMO

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                       | Referencia a            | Descripción                          |
|-----------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|------------------------|--------------------------------------|
| `Num_Membresia` | INT          | -      | ✅* | ✅  | ❌   | ❌     | > 0                                       | LECTOR(Num_Membresia)  | Número de membresía del lector       |
| `ISBN`          | VARCHAR      | 13     | ✅* | ✅  | ❌   | ❌     | Longitud = 13                             | LIBRO(ISBN)            | ISBN del libro prestado              |
| `Fecha_Prestamo`| DATE         | -      | ❌  | ❌  | ✅   | ❌     | Fecha válida o nula si no ha sido registrado| -                      | Fecha en que se realizó el préstamo  |

### Notas:
- En PRESTAMO, la clave primaria es compuesta (✅*) por Num_Membresia + ISBN.
- Las claves foráneas apuntan correctamente a LECTOR y LIBRO.
