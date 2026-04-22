// ====================================================================
// Te hacemos los mandados VALLE DEL ROBLE - MÓDULO DE CÁLCULO V1.2
// FUNCIÓN: Calcula el costo total del pedido y la distribución de ganancias
// Se mantiene la restricción de distancia por tipo de vehículo.
// ====================================================================

// CONFIGURACIÓN DE TARIFAS Y COMISIONES (SIN CAMBIOS)
const COMISION_CLIENTE = 0.02; 
const COMISION_NEGOCIO = 0.02; 
const TARIFA_DIURNA = 25.00; 
const TARIFA_NOCTURNA = 35.00; 

// CONFIGURACIÓN DE DISTANCIA Y GANANCIA (ACTUALIZADA V1.2)
const LIMITE_MAXIMO_SERVICIO = 5.0; // km - Límite exterior de la micro-zona de servicio

// Restricciones de distancia por vehículo (REINTRODUCIDAS)
const LIMITE_BICI = 2.5; // km
const LIMITE_SCOOTER = 1.5; // km

// Porcentajes de ganancia (Mantenemos los valores de incentivo mejorados)
const GANANCIA_MOTO_AUTO = 0.75; // 75%
const GANANCIA_BICI_TRICICLO = 0.70; // 70%
const GANANCIA_SCOOTER_CAMINANDO = 0.65; // 65%


// ... (Las funciones 'obtenerCuotaFija', 'TipoEntrega', 'TipoVehiculo' se mantienen iguales) ...


/**
 * Calcula el costo total del pedido, las comisiones y las ganancias del repartidor.
 * @param {number} subtotalCompra - Total de la venta antes de comisiones (valor del catálogo).
 * @param {TipoEntrega} tipoEntrega - 'RECOLECTA' o 'DOMICILIO'.
 * @param {TipoVehiculo} [tipoVehiculoAsignado] - Solo para tipoEntrega 'DOMICILIO'.
 * @param {number} [distanciaKm] - Distancia calculada por la API.
 * @returns {object} Objeto con todos los cálculos financieros.
 * @throws {Error} Si el medio de entrega no es válido o excede el límite de distancia.
 */
function calcularCostoYComisiones(subtotalCompra, tipoEntrega, tipoVehiculoAsignado = null, distanciaKm = null) {
    const horaPedido = new Date(); 
    let costoEnvio = 0.00;
    let pagoRepartidor = 0.00;
    let gananciaPlataformaEnvio = 0.00;

    // VALIDACIÓN BÁSICA DEL SUBTOTA
    if (typeof subtotalCompra !== 'number' || subtotalCompra <= 0) {
        throw new Error("El subtotal de la compra debe ser un número positivo.");
    }
    
    const comisionPlataformaCliente = subtotalCompra * COMISION_CLIENTE;
    
    if (tipoEntrega === 'DOMICILIO') {
        if (!tipoVehiculoAsignado || typeof distanciaKm !== 'number') {
             throw new Error("Para Envío a Domicilio, se requiere el tipo de vehículo y la distancia en km.");
        }

        // RESTRICCIÓN 1: LÍMITE GEOGRÁFICO DE LA COLONIA (5.0 km)
        if (distanciaKm > LIMITE_MAXIMO_SERVICIO) {
             throw new Error(`🚫 ERROR GEOGRÁFICO: El servicio excede el límite de ${LIMITE_MAXIMO_SERVICIO.toFixed(1)} km establecido para esta colonia/micro-servicio.`);
        }
        
        const cuotaFija = obtenerCuotaFija(horaPedido);
        costoEnvio = cuotaFija;
        
        let porcentajeGanancia = 0;
        let limiteMaximoVehicular = Infinity; // Para la RESTRICCIÓN 2

        // Definición de porcentajes y LÍMITES POR TIPO DE VEHÍCULO
        switch (tipoVehiculoAsignado) {
            case 'MOTO':
            case 'AUTO':
                porcentajeGanancia = GANANCIA_MOTO_AUTO; 
                break;
            case 'BICI':
            case 'TRICICLO':
                porcentajeGanancia = GANANCIA_BICI_TRICICLO; 
                limiteMaximoVehicular = LIMITE_BICI; // 2.5 km
                break;
            case 'SCOOTER':
            case 'CAMINANDO':
                porcentajeGanancia = GANANCIA_SCOOTER_CAMINANDO; 
                limiteMaximoVehicular = LIMITE_SCOOTER; // 1.5 km
                break;
            default:
                throw new Error("Medio de entrega no válido o no asignado.");
        }
        
        // RESTRICCIÓN 2: VERIFICACIÓN DEL LÍMITE DE DISTANCIA DEL VEHÍCULO
        if (distanciaKm > limiteMaximoVehicular) {
             throw new Error(`🚫 ERROR DE LOGÍSTICA: El vehículo (${tipoVehiculoAsignado}) solo puede cubrir hasta ${limiteMaximoVehicular.toFixed(1)} km. La distancia requerida es ${distanciaKm.toFixed(2)} km.`);
        }

        // Cálculo de pagos
        pagoRepartidor = cuotaFija * porcentajeGanancia;
        gananciaPlataformaEnvio = cuotaFija * (1 - porcentajeGanancia);

    } else if (tipoEntrega === 'RECOLECTA') {
        costoEnvio = 0.00; 
        pagoRepartidor = 0.00;
    } else {
        throw new Error("Tipo de entrega no válido.");
    }
    
    const comisionPlataformaNegocio = subtotalCompra * COMISION_NEGOCIO;
    const totalCliente = subtotalCompra + comisionPlataformaCliente + costoEnvio;
    const gananciaTotalPlataforma = comisionPlataformaCliente + comisionPlataformaNegocio + gananciaPlataformaEnvio;

    // ... (El objeto return se mantiene igual) ...
    return { /* ... */ }; 
}
