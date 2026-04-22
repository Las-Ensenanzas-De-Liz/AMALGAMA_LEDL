# 3. Documento de Logística y Protocolo Operacional (V. 1.2)

## Reglas Clave de Asignación (Algoritmo EnsDeLiz)

La asignación de pedidos sigue un riguroso sistema de filtros de distancia y puntuación:

### A. Doble Restricción de Distancia

1.  **Límite Geográfico (Colonia):** Distancia máxima de **5.0 km** por servicio. Si la distancia es mayor, el pedido se rechaza.
2.  **Límites Vehiculares (Eficiencia):** Los repartidores son excluidos si la distancia excede el límite de su vehículo:
    * **SCOOTER / CAMINANDO:** Límite de **1.5 km**.
    * **BICI / TRICICLO:** Límite de **2.5 km**.
    * **MOTO / AUTO:** Límite de **5.0 km**.

### B. Puntuación de Prioridad

El repartidor elegible que cumpla con las restricciones de distancia es seleccionado en base a la siguiente ponderación:

| Factor | Prioridad (Ponderación) |
| :--- | :--- |
| **Distancia al Origen** | **Alta (50%)** |
| **Reputación / Rating** | Media (30%) |
| **Carga de Trabajo** | Baja (20%) |

---

## Protocolo de Servicio Estándar

El repartidor debe seguir el siguiente flujo estricto para garantizar la calidad:

1.  **Aceptación:** Máximo **90 segundos**.
2.  **Recolección:** Confirmar el subtotal del pedido con el negocio.
3.  **Notificación:** Presionar "En Ruta" para notificar al cliente del ETA.
4.  **Entrega:** Cobrar el **TOTAL CLIENTE** (si es pago contra-entrega).
5.  **Finalización:** Registrar el servicio como "Entregado".
