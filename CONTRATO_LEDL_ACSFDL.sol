// SPDX-License-Identifier: MIT
// Propiedad Intelectual e Inalienable: J Andres Resendez R
pragma solidity ^0.8.20;

contract LEDL_Licencia_Perpetua {
    string public constant LICENCIA_HASH = "c3d9109396a414c2f61cfed7c5ca46414e8fdcc94adfacf19e559e637f0dabfc";
    address public immutable comandanteSupremo;
    bool public bloqueado = false;

    constructor() {
        comandanteSupremo = msg.sender;
    }

    modifier soloSoberano() {
        require(msg.sender == comandanteSupremo, "Acceso Denegado");
        _;
    }

    // Función para sellar la licencia para siempre
    function sellarSistema() public soloSoberano {
        bloqueado = true;
    }
}
