## Ficheros agregados

### FAQServlet
Es una página estática del RID-UNRN

### RIDPoliciesServlet
Es una página estática del RID-UNRN

### RequestItemServlet
Agrega validación para el mensaje en la solicitud del ítem.
```jsp
// Check all data is there
if (requesterEmail == null || requesterEmail.equals("") ||
    reqname == null || reqname.equals("") || coment == null || coment.equals("")) 
{
  ...
}
```
Sólo se agregaron las líneas `coment == null || coment.equals("")`. De esta forma, se valida el campo de mensaje.