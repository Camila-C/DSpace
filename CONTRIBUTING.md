# Proceso de contribución

## Reglas de los mensajes de commits

- Use la conjugación presente, como por ejemplo "Agrega característica" y no "Agregó característica".
Antes de escribir, piense que "El commit agrega" o "El commit corrige".
- Limite el título del commit a 72 caracteres o menos.
- Referencie Issues y Merge Requests (MR), también conocidos como Pull Requests (PR) siempre que sea necesario. 
Por ejemplo, cuando un commit corrige un bug de una issue, o cuando una nueva característica está relacionada otra, 
desarrollada en otra rama.
- Inicie el título del commit con un emoji que lo describa:
  - ✨ cuando se genere una nueva versión.
  - 🎨 cuando se mejora el formato o la estructura del código.
  - 🏇 cuando se mejora la performance.
  - 📝 cuando se escriba documentación.
  - 🚀 cuando se agregue una nueva característica.
  - 🐛 cuando se corrija un bug.
  - 🔥 cuando se eliminen códigos o archivos.
  - ⚙️ cuando se refactorice código.
  - 💚 cuando se corrija la build del CI.
  - ✅ cuando se agreguen tests.
  - 🆕 cuando se agreguen nuevas dependencias.
  - ⬆ cuando se aumente la versión de las dependencias.
  - ⬇ cuando se disminuya la versión de las dependencias.
  - 🗑️ cuando se eliminen dependencias.
  - 👕 cuando se corrijan errores de un lint.
  - 🔧 cuando se modifican archivos de configuración.

## Idioma

- Todo el código debe estar escrito en inglés. Esto quiere decir que los nombres de variables, funciones, componentes, 
métodos, etc. deben estar en inglés.
- Todos los comentarios deben estar en español.
- El contenido de la aplicación, como los textos, debe estar en castellano, por supuesto.

## Configuración del CI

### Cómo hacer que un commit evite ejecutar el CI

Incluya `[ci skip]` en el cuerpo del mensaje del commit. NUNCA en el título.
