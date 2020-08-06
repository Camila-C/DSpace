## Indice de archivos modificados

- [choose-file.jsp](#choose-file)
- [edit-metada.jsp](#edit-metada)

## choose-file

### `[06-04-2020]`: Corrige error `TypeError: $ is not a function`
Al seleccionar un archivo a subir en la opción de
Autoarchivo, el sistema mostraba un error con respecto a jQuery.

```
TypeError: $ is not a function
```

Esto se debía a que la función `$` no estaba definida o existía conflicto con jQuery.
Para resolverlo reemplacé las funciones iniciales de `$` por `jQuery`. Ejemplo:

De esto

```javascript
$(document).ready(function(){

    // jQuery code is in here

});
```

A esto

```javascript
jQuery(document).ready(function($){

    // jQuery code is in here

});
```

## edit-metada

### `[30-07-2020]`: Modifica todas las clases `input-group col-md-XX` ya que genera error en el formato.

**Ejemplo:**

Corrige codigo Java de la linea 1067, de esto:

```java
sb.append("<div class=\"row col-md-12\"><span class=\"input-group col-md-10\"><span class=\"input-group-addon\"><select name=\"")
```

a esto:

```java
sb.append("<div class=\"row col-md-12\"><div class=\"col-md-10\"><span class=\"input-group\"><span class=\"input-group-addon\"><select name=\"")
```

Además, agrega el cierre del div `col-md-10` en la línea 1102:

```java
sb.append("\"/></span></div>\n");
```