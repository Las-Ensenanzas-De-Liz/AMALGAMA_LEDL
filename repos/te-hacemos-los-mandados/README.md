# 🚀 Te hacemos los mandados VALLE DEL ROBLE - Micro-Logística Comunitaria

## Visión General
Este repositorio contiene el código fuente y la documentación para un proyecto de micro-logística diseñado para operar en un radio estricto de **5.0 km por colonia**. El objetivo es ofrecer un servicio de mandados ultrarrápido, económico y transparente para comunidades localizadas, utilizando un sistema financiero y logístico basado en la doble restricción de distancia.

**Ubicación de Referencia:** Valle del Roble, Cadereyta Jiménez, Nuevo León, México.

---

## 🏛️ Componentes de la Arquitectura

### 1. Backend: Lógica de Negocio (`src/server.js V1.2`)
Define el modelo financiero, las tarifas y el "Algoritmo EnsDeLiz" con la clave de la **doble restricción de distancia**:
- Límite Geográfico de 5.0 km (del servicio).
- Límites internos de 2.5 km (BICI/TRICICLO) y 1.5 km (SCOOTER/CAMINANDO) para optimizar la eficiencia y el tiempo de entrega.

### 2. Frontend: Experiencia de Usuario (`src/index-asistente.html`)
Implementa el **Asistente EnsDeLiz**, una interfaz conversacional (chatbot) que guía al cliente desde la búsqueda de productos hasta el cálculo final de costos, garantizando la transparencia de la comisión del 2% y el costo de envío.

---

## ⚙️ Configuración y Uso Local

Este proyecto puede ser ejecutado directamente en un navegador (para el Frontend) o en Node.js (para la lógica Backend).

### Ejecutar el Frontend (Asistente EnsDeLiz)

1.  Asegúrate de tener los archivos en la carpeta `/src`.
2.  Abre el archivo `src/index-asistente.html` directamente en tu navegador web.
3.  Utiliza el formato de ejemplo en el paso 3 del chatbot: `[Subtotal] [tipo] [distancia] [vehiculo]` (Ej: `250.00 domicilio 2.3 BICI`).

### Probar el Backend (server.js)

1.  Asegúrate de tener Node.js instalado.
2.  Abre la consola en el directorio `/src`.
3.  **Descomenta** la sección de `EJEMPLO DE USO` al final del archivo `server.js`.
4.  Ejecuta el script:
    ```bash
    node server.js
    ```

---

## 📜 Documentación y Licenciamiento

### **Licencia**
Este proyecto está bajo la **Licencia Las Enseñanzas De Liz**, la cual es **Irremplazable e Irrevocable**. Ver el archivo [LICENSE](LICENSE) para detalles.

### **Marco Ético**
El sistema operativo del Asistente EnsDeLiz se rige por la **Constitución del Robot y/o la Robótica Versión 1.0**, escrita por J. Andrés Reséndez R. (Ver [docs/2-Constitucion-Robotica.md](docs/2-Constitucion-Robotica.md)).

### **Contacto**
Para cualquier consulta o propuesta, contactar al autor del proyecto.
