# La Mazmorra de Marcelo
Proyecto para la asignatura de Introducción a la Ingeniería del Software en la UMA.

## Instrucciones para ejecutar los tests

### Desde Godot

Una vez clonado he importado el repositorio, abra Godot y despliegue el submenú llamado "GUT" en la parte inferior del programa. Para ejcutar los tests, pulse en la opción "Run All" de dicho submenú.

### Desde la consola de comandos

Para ejecutar los tests desde la consola de comandos, necesita igualmente instalar Godot (ya que es el runtime de GDScript, el lenguaje de programación usado). Una vez instalado, siga las instrucciones correspondientes a su sistema operativo.

#### GNU/Linux

Abra el emulador de terminal de su sistema y acceda al directorio raíz del proyecto. Una vez hecho esto, ejecute el siguiente comando:

```
godot -d -s --path "$PWD" addons/gut/gut_cmdln.gd
```

#### MacOS

Localice el ejecutable de Godot en su sistema de archivos. En MacOS, la localización por defecto es `/Applications/Godot.app/Contents/MacOS/Godot`. Abra la terminal y acceda al directorio raíz del proyecto. Una vez hecho esto, ejecute el siguiente comando:

```
/Applications/Godot.app/Contents/MacOS/Godot -d -s --path "$PWD" addons/gut/gut_cmdln.gd
```

#### Windows (no recomendado)

Ejecutar los tests a través de la terminal en Windows es posible, pero es más complicado y propenso a fallar. Si aún así prefiere usar Windows, estas son las instrucciones.

En primer lugar, localice el ejecutable de Godot en su equipo (el archivo _.exe_). Anótelo y a continuación, localice el directorio raíz del proyecto. A continuación, ejecute el siguiente comando:

```
& "SU_EJECUTABLE_DE_GODOT_AQUI" -d -s --path "EL_DIRECTORIO_RAIZ_DEL_PROYECTO_AQUI" "addons/gut/gut_cmdln.gd"
```