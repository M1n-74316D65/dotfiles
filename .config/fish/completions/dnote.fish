# ~/.config/fish/completions/dnote.fish

# --- Definición de comandos principales ---

# Lista de los comandos válidos para dnote
set -l dnote_commands add view edit remove find sync login logout help version

# Autocompletado para los comandos principales (cuando escribes 'dnote ' y pulsas TAB)
# -n '__fish_use_subcommand' asegura que esto solo se active para el primer argumento después de 'dnote'.
complete -c dnote -n __fish_use_subcommand -a "$dnote_commands" -d 'Subcomando de dnote'

# --- Autocompletado para argumentos de subcomandos específicos ---

# Función auxiliar para obtener y filtrar nombres de notas
# Se usa para los comandos view, v, add, a
function __fish_dnote_complete_names
    # Obtiene el token actual que se está escribiendo
    set -l token (commandline -ct)
    # Escapa caracteres especiales en el token para usarlo en una expresión regular de forma segura
    set -l escaped_token (string escape --style=regex -- $token)
    # Ejecuta 'dnote view --name-only' para obtener la lista de nombres
    # Luego, 'string match --regex' filtra esa lista para mostrar solo las líneas
    # que contienen el token que se está escribiendo.
    dnote view --name-only | string match --regex -- "$escaped_token"
end

# Autocompletado para los argumentos de los comandos 'view', 'v', 'add', 'a'
# -n '__fish_seen_subcommand_from view v add a' asegura que esto se active solo
# después de que se haya escrito uno de estos subcomandos.
# Llama a la función auxiliar para generar las sugerencias.
complete -c dnote -n '__fish_seen_subcommand_from view v add a' -a '(__fish_dnote_complete_names)' -d 'Nombre de la nota'

# --- Notas sobre el script ---
# 1. Guarda este archivo como ~/.config/fish/completions/dnote.fish
# 2. Reinicia tu sesión de Fish o ejecuta `source ~/.config/fish/completions/dnote.fish` para que los cambios surtan efecto.
# 3. La función `__fish_dnote_complete_names` se encarga de obtener la lista de notas (`dnote view --name-only`)
#    y filtrarla según lo que estés escribiendo actualmente (`commandline -ct`).
# 4. Se usa `string escape --style=regex` para manejar correctamente nombres de notas que puedan contener
#    caracteres especiales para las expresiones regulares.
# 5. La condición `-n '__fish_seen_subcommand_from ...'` es la forma en Fish de replicar la lógica
#    del script Bash que verifica `cmd=${COMP_WORDS[1]}` y `COMP_CWORD >= 2`.
