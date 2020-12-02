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

Luego se agrega la validación `!verify` (del paso anterior) en el `if` de chequeo de la información

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

### FeedbackServlet

#### Recaptcha
Agrega código que verifica el recaptcha y la linea `!verify` en el `if` de chequeo de la información
```jsp
// Has the user just posted their feedback?
if (request.getParameter("submit") != null)
{
    EmailValidator ev = EmailValidator.getInstance();
    String feedback = request.getParameter("feedback");

    // Start Recaptcha
    String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
    boolean verify = RecaptchaQuery.verify(gRecaptchaResponse);
    // End Recaptcha

    // Check all data is there
    if ((formEmail == null) || formEmail.equals("")
            || (feedback == null) || feedback.equals("") || !ev.isValid(formEmail) || !verify)
    {
        request.setAttribute("email", formEmail);
        request.setAttribute("feedback", feedback);
        request.setAttribute("fromPage", fromPage);

        log.info(LogManager.getHeader(context, "show_feedback_form",
                "problem=true"));
        request.setAttribute("feedback.problem", Boolean.TRUE);
        JSPManager.showJSP(request, response, "/feedback/form.jsp");

        return;
    }
    ...
}
```

### RIDStatisticsServlet

Es una página estática del RID-UNRN que contiene las estadísticas del repositorio.
Los gráficos son embebidos de DataWrapper