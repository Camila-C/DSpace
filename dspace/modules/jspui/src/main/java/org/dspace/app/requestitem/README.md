## Ficheros agregados

### RequestItemHelpdeskStrategy
Se agregó el siguiente código:

Método que retorna la comunidad padre.
```java
/**
 * Return a Community parent object from collection
 * @param col collection
 * @return Community
 */
public Community findCommunityParent(Collection col) throws SQLException {
    return findParent(col.getCommunities().get(0));
}

public Community findParent(Community com) throws SQLException {
    if (com.getParentCommunities().size() > 0) {
        return findParent(com.getParentCommunities().get(0));
    }

    return com;
}
```

Al momento de enviar el mail, se chequea si la comunidad de procedencia es Digesto
```java
Collection col = (Collection) item.getCollections().get(0);
Community com = (Community) findCommunityParent(col);

String helpDeskEmail = ConfigurationManager.getProperty("mail.helpdesk");

// Si la comunidad padre es Digesto, cambia el mail de destino
if (com.getName() == "Digesto" || com.getName().equals("Digesto")) {
    helpDeskEmail = ConfigurationManager.getProperty("mail.helpdesk.digesto");
}
```

También, se agregaron los imports
```java
import org.dspace.content.Collection;
import org.dspace.content.Community;

import java.util.ArrayList;
import java.util.List;
```