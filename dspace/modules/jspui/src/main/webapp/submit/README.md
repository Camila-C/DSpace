## Cambios 06-04-2020

### choose-file.jsp
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