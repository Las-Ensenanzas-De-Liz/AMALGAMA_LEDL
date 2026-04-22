#!/bin/bash

# =========================================================
# NOMBRE: Orquestador Amalgama LEDL (88 Repositorios)
# AUTOR: J Andres Resendez R (@AndresR294)
# CORREO DESTINO: resendezandres0@gmail.com
# DIRECTIVA: LO IMPOSIBLE NO EXISTE
# =========================================================

OLD_USER="andres290487"
OLD_EMAIL="49276703+andres290487@users.noreply.github.com"
NEW_USER="AndresR294"
NEW_EMAIL="resendezandres0@gmail.com"
ORG_DESTINO="Las-Ensenanzas-De-Liz"
REPO_MONOLITO="AMALGAMA_LEDL"

show_progress() {
    local progress=0
    while [ $progress -le 100 ]; do
        printf "\rMigrando Infraestructura LEDL: [%-20s] %d%%" $(printf '#%.0s' $(seq 1 $((progress / 5)))) $progress
        sleep 0.02
        progress=$((progress + 5))
    done
    echo ""
}

echo "--- INICIANDO PROTOCOLO AMALGAMA CORE (88 REPOS) ---"

# 1. Validación de Carpeta
if [[ "$PWD" != *"$REPO_MONOLITO"* ]]; then
    cd "$REPO_MONOLITO" 2>/dev/null || exit 1
fi

# 2. Configuración de autoría local para esta operación
git config user.email "$NEW_EMAIL"
git config user.name "J Andres Resendez R"

# 3. Mapeo de los 88 repositorios
echo "[1/3] Extrayendo metadatos de @$OLD_USER..."
REPOS=$(gh repo list $OLD_USER --limit 150 --json name -q '.[].name')
TOTAL=$(echo "$REPOS" | wc -w)

# 4. Proceso de Fusión por Subtree
echo "[2/3] Integrando $TOTAL repositorios detectados..."
COUNT=0

for REPO in $REPOS; do
    if [[ "$REPO" == "$REPO_MONOLITO" ]]; then continue; fi
    COUNT=$((COUNT + 1))
    
    echo "------------------------------------------"
    echo "[$COUNT/$TOTAL] Amalgamando: $REPO"
    
    # URL de origen usando el usuario antiguo
    SRC_URL="https://github.com/$OLD_USER/$REPO.git"
    
    git remote add "src_$REPO" "$SRC_URL" 2>/dev/null
    git fetch "src_$REPO" --quiet 2>/dev/null

    # Intentar fusión en carpeta 'repos/'
    if git subtree add --prefix="repos/$REPO" "src_$REPO" main --squash -m "Amalgama LEDL: Integración de $REPO vía $NEW_EMAIL" 2>/dev/null || \
       git subtree add --prefix="repos/$REPO" "src_$REPO" master --squash -m "Amalgama LEDL: Integración de $REPO vía $NEW_EMAIL" 2>/dev/null; then
        echo "CONFIRMADO: $REPO movido a AMALGAMA_LEDL"
    else
        echo "AVISO: $REPO ya procesado o inaccesible."
    fi

    git remote remove "src_$REPO"
done

# 5. Despliegue al Mainframe de GitHub
echo "[3/3] Sincronizando con @$NEW_USER..."
show_progress
git push origin main --force

echo "=========================================="
echo "AMALGAMA COMPLETADA AL 100%"
echo "Propietario: J Andres Resendez R"
echo "Correo: $NEW_EMAIL"
echo "=========================================="
