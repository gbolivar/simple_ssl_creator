# Visitor

## Intención
El patrón Visitor permite definir nuevas operaciones sobre una estructura de objetos sin cambiar las clases de los objetos sobre los que opera.
Caso de uso real:

Un compilador que aplica múltiples operaciones (como análisis léxico y sintáctico) a una estructura de código.

- Ejemplo Ok código fuente ([PHP](php/ok.php))
- Ejemplo Ok Sandbox ([PHP](https://onlinephp.io/c/9894d))

Un mal ejemplo sería agregar métodos específicos para cada operación en la clase Book, violando el principio de responsabilidad única:

- Ejemplo NOk  ([PHP](php/nok.php))