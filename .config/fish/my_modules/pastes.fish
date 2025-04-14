# ~/.config/fish/functions/paste.fish
function paste --description "Sube un paste (expira en 90 días)"
    if test "$argv[1]" = help
        echo "Sube un archivo a pastes.sh. Expira en 90 días (por defecto)."
        echo "Uso: paste <fichero>"
    else if test -n "$argv[1]"
        cat -- "$argv[1]" | ssh pastes.sh "$argv[1]"
    else
        echo "Error: Se requiere el nombre del fichero." >&2
        echo "Uso: paste <fichero>"
        return 1
    end
end

# ~/.config/fish/functions/paste-p.fish
function paste-p --description "Sube un paste permanente (-p)"
    if test "$argv[1]" = help
        echo "Sube un archivo a pastes.sh que no expira (permanente)."
        echo "Uso: paste-p <fichero>"
    else if test -n "$argv[1]"
        cat -- "$argv[1]" | ssh pastes.sh "$argv[1]" expires=false
    else
        echo "Error: Se requiere el nombre del fichero." >&2
        echo "Uso: paste-p <fichero>"
        return 1
    end
end

# ~/.config/fish/functions/paste-h.fish
function paste-h --description "Sube un paste oculto (-h, expira en 90 días)"
    if test "$argv[1]" = help
        echo "Sube un archivo oculto a pastes.sh. Expira en 90 días."
        echo "Uso: paste-h <fichero>"
    else if test -n "$argv[1]"
        cat -- "$argv[1]" | ssh pastes.sh "$argv[1]" hidden=true
    else
        echo "Error: Se requiere el nombre del fichero." >&2
        echo "Uso: paste-h <fichero>"
        return 1
    end
end

# ~/.config/fish/functions/paste-ph.fish
function paste-ph --description "Sube un paste permanente y oculto (-p -h)"
    if test "$argv[1]" = help
        echo "Sube un archivo oculto y permanente a pastes.sh."
        echo "Uso: paste-ph <fichero>"
    else if test -n "$argv[1]"
        cat -- "$argv[1]" | ssh pastes.sh "$argv[1]" expires=false hidden=true
    else
        echo "Error: Se requiere el nombre del fichero." >&2
        echo "Uso: paste-ph <fichero>"
        return 1
    end
end

# ~/.config/fish/functions/pasteget.fish
function pasteget --description "Descarga (get) un paste"
    if test "$argv[1]" = help
        echo "Descarga (get) un archivo/paste desde pastes.sh."
        echo "Uso: pasteget <ruta-remota>"
    else if test -n "$argv[1]"
        rsync pastes.sh:/"$argv[1]" .
    else
        echo "Error: Se requiere la ruta remota." >&2
        echo "Uso: pasteget <ruta-remota>"
        return 1
    end
end

# ~/.config/fish/functions/pastels.fish
function pastels --description "Lista (ls) los pastes en el servidor"
    if test "$argv[1]" = help
        echo "Lista (ls) los archivos/pastes en el servidor pastes.sh."
        echo "Uso: pastels"
    else if test -n "$argv[1]"
        echo "Error: pastels no admite argumentos." >&2
        echo "Uso: pastels"
        return 1
    else
        echo ls | sftp -b - pastes.sh
    end
end
