// SPDX-License-Identifier: MIT
// Propiedad Intelectual: J Andres Resendez R
pragma solidity ^0.8.20;

contract LEDL_Superchain_Governance {
    string public name = "Las Ensenanzas de Liz (LEDL) ACSFDL";
    string public symbol = "LEDL";
    address public comandanteSupremo;
    uint256 public orcid = 0009000735289413;

    constructor() {
        comandanteSupremo = msg.sender;
    }

    // Directiva: LO IMPOSIBLE NO EXISTE
    function verificarSoberania() public view returns (bool) {
        return (msg.sender == comandanteSupremo);
    }
}
