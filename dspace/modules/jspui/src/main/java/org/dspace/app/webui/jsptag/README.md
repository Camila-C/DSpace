## Ficheros agregados

### ItemTag
Reemplaza la linea 1089-1090
```java
out.print(" " + DateFormatUtils.format(rp.getStartDate(), "yyyy-MM-dd"));
```
Por la siguiente:
```java
// Cambio el formato de la fecha de 'yyyy-MM-dd' a 'dd-MM-yyyy'
out.print(" " + DateFormatUtils.format(rp.getStartDate(), "dd-MM-yyyy"));
```

Cambia la línea 1143-1144
```java
out.print("<a class=\"btn btn-primary\" ");
out
    .print(bsLink
        + LocaleSupport
            .getLocalizedMessage(
                pageContext,
                "org.dspace.app.webui.jsptag.ItemTag.view")
        + "</a>");
```
por
```java
// Agrega IF que solo muestra el botón Visualizar/Abrir cuando el documento no está embargado
if (!(showRequestCopy && !authorizeService.authorizeActionBoolean(context, b, Constants.READ)))
{
    out.print("<a class=\"btn btn-primary\" ");
    out
        .print(bsLink
            + LocaleSupport
                .getLocalizedMessage(
                    pageContext,
                    "org.dspace.app.webui.jsptag.ItemTag.view")
            + "</a>");
}
```