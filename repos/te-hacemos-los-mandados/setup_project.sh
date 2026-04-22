#!/data/data/com.termux/files/usr/bin/bash

# ====================================================================
# SCRIPT EMPAQUETADOR ENSDELIZ PARA TERMUX (NO ROOT)
# FUNCIÓN: Configura el entorno, instala dependencias e inicia el micro-servicio.
# ====================================================================

# Nombre del directorio del proyecto en Termux
PROJECT_DIR="mandados-valle-roble"

echo "=========================================================="
echo "      🚀 INICIANDO EMPAQUETADOR ENSDELIZ (TERMUX)         "
echo "=========================================================="

# --- 1. ACTUALIZAR PAQUETES E INSTALAR DEPENDENCIAS BÁSICAS ---
echo "✅ 1/3: Actualizando repositorios e instalando Node.js y Git..."
pkg update -y
pkg upgrade -y
pkg install nodejs -y
pkg install git -y

if [ $? -ne 0 ]; then
    echo "❌ ERROR: Fallo en la instalación de paquetes (Node.js/Git). Revise su conexión."
    exit 1
fi

# --- 2. CLONAR EL REPOSITORIO Y PREPARAR EL ENTORNO ---
echo "✅ 2/3: Clonando el repositorio y preparando el directorio de trabajo..."

if [ -d "$PROJECT_DIR" ]; then
    echo "⚠️ Directorio $PROJECT_DIR ya existe. Saltando clonación."
else
    # ATENCIÓN: Reemplaza ESTA URL con la URL real de tu repositorio GitHub cuando esté listo.
    # Por ahora, usamos una URL de ejemplo
    GIT_REPO_URL="https://github.com/tu-usuario/mandados-valle-roble.git"
    git clone "$GIT_REPO_URL" "$PROJECT_DIR"

    if [ $? -ne 0 ]; then
        echo "❌ ERROR: Fallo al clonar el repositorio de GitHub: $GIT_REPO_URL"
        exit 1
    fi
    echo "   Clonación exitosa. Moviéndose al directorio del proyecto."
fi

cd "$PROJECT_DIR"

# El código server.js no requiere 'npm install' si solo se usa JavaScript nativo,
# pero si usas paquetes externos (ej. express), descomenta la siguiente línea:
# echo "   Instalando dependencias de Node.js..."
# npm install

# --- 3. INICIAR EL SERVICIO DE PRUEBA ---
echo "✅ 3/3: Iniciando el servicio de micro-logística EnsDeLiz..."

# Usaremos 'node' para ejecutar el código principal del backend (server.js)
# y usaremos 'termux-open' para intentar abrir el frontend en el navegador.

# Ejecutar el backend en segundo plano y guardar su PID
node src/server.js > server.log 2>&1 &
SERVER_PID=$!
echo "   Backend (server.js) iniciado en segundo plano. PID: $SERVER_PID"
echo "   Logs del backend: $PROJECT_DIR/server.log"

# Abrir el Frontend (index-asistente.html) en el navegador de Android (requiere Termux:API y la app)
echo "   Intentando abrir el Asistente EnsDeLiz en su navegador..."
termux-open "file://$PWD/src/index-asistente.html"

echo "=========================================================="
echo "      🎉 ¡CONFIGURACIÓN COMPLETA!                          "
echo "=========================================================="
echo "El Asistente EnsDeLiz se abrió en su navegador."
echo "Para verificar el estado del backend, use: cat server.log"
echo ""
echo "Para detener el servicio del backend, use el comando:"
echo "kill $SERVER_PID"
echo "=========================================================="

# Fin del script