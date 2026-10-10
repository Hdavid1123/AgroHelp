# AgroHelp

Proyecto de procesamiento y análisis de datos para AgroHelp.

## 1. Estructura del proyecto

La estructura principal del proyecto es la siguiente:

```text
AgroHelp/
├── .agro-help-ml/              # Entorno virtual de Python
├── app/
│   ├── data/                   # Datos de entrada
│   ├── notebooks/              # Notebooks de exploración
│   ├── src/                    # Código fuente
│   ├── pyproject.toml           # Configuración y dependencias
│   ├── uv.lock                  # Versiones resueltas de las dependencias
│   ├── requirements.txt         # Dependencias alternativas
│   └── README.md
├── migrations/                 # Migraciones de base de datos
└── sql/                        # Scripts SQL
```

**Importante:** el entorno virtual `.agro-help-ml` se encuentra en la raíz del proyecto, mientras que `pyproject.toml` y `uv.lock` están dentro de `app/`.

Por esta razón, los comandos de `uv` deben apuntar al proyecto `app` y utilizar el entorno virtual activo.

## 2. Requisitos previos

Se necesita tener instalados:

- Python 3.13 o una versión compatible con el proyecto.
- `uv`, el gestor de paquetes y entornos de Python.
- Git, si se desea clonar el repositorio.

## 3. Crear el entorno virtual

Desde la raíz del proyecto, crea el entorno virtual:

```bash
uv venv .agro-help-ml --python 3.13
```

### Activar el entorno virtual

En Ubuntu:
```bash
source .agro-help-ml/bin/activate
```

Verifica que Python corresponda al entorno virtual:
```bash
which python
```

La ruta debería ser similar a:
```text
/home/usuario/Develop/AgroHelp/.agro-help-ml/bin/python
```

Para comprobar la versión de Python:

```bash
python --version
```

## 4. Instalar las dependencias del proyecto

Las dependencias se declaran en: app/pyproject.toml

Par instalar las dependencias existentes, desde la raíz del proyecto, activa primero el entorno virtual:

```bash
source .agro-help-ml/bin/activate
```
Después, sincroniza las dependencias:
```bash
uv sync --project app --active
```

La opción `--project app` indica dónde está el `pyproject.toml`.

La opción `--active` indica a `uv` que utilice el entorno virtual activo.

## 5. Agregar nuevas dependencias

Para añadir una biblioteca, utiliza `uv add`.

Por ejemplo, para agregar Pandas:

```bash
uv add --project app --active --no-sync pandas
```

Después, instala o sincroniza las dependencias:

```bash
uv sync --project app --active
```

## 6. Actualizar las dependencias

Para actualizar las dependencias según las restricciones declaradas en `pyproject.toml`, puedes utilizar:

```bash
uv lock --project app --upgrade
uv sync --project app --active
```

## 7. Eliminar una dependencia

Para quitar una biblioteca del proyecto:

```bash
uv remove --project app --active pandas
```

Si necesitas volver a sincronizar el entorno:

```bash
uv sync --project app --active
```

## 8. Ejecutar los tests

python3 -m tests.db_connection