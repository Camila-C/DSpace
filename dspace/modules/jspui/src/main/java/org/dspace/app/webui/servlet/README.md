## Ficheros agregados

### FAQServlet
Es una página estática del RID-UNRN

### RIDPoliciesServlet
Es una página estática del RID-UNRN

### RequestItemServlet

#### Validación para el mensaje
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

#### Recaptcha
Agrega código que verifica el recaptcha

```jsp
if (request.getParameter("submit") != null)
{
     	// Start Recaptcha
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		boolean verify = RecaptchaQuery.verify(gRecaptchaResponse);
		// End Recaptcha
```

Luego se agrega la validación `!verify` en el `if` del paso anterior

```jsp
// Check all data is there
if (requesterEmail == null || requesterEmail.equals("")
		|| reqname == null || reqname.equals("")
		|| coment == null || coment.equals("")
		|| !verify
)
{
  ...
}
```