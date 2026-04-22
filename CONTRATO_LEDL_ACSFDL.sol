// SPDX-License-Identifier: MIT
// Propiedad Intelectual: J Andres Resendez R
pragma solidity ^0.8.20;

contract LEDL_Superchain_Governance {
    string public name = "Las Ensenanzas de Liz (LEDL) ACSFDL";
    string public symbol = "LEDL";
    address public comandanteSupremo;
    string public orcid_autor = "0009-0007-3528-9413";

    mapping(bytes32 => bool) public documentosFirmados;

    event DocumentoNotarizado(bytes32 indexed hashDocumento, string metadata);

    constructor() {
        comandanteSupremo = msg.sender;
    }

    modifier soloComandante() {
        require(msg.sender == comandanteSupremo, "Acceso Denegado: Solo JARR");
        _;
    }

    // Firma de Documentos ORCID
    function firmarDocumento(string memory _metadata) public soloComandante {
        bytes32 hashDoc = keccak256(abi.encodePacked(_metadata, block.timestamp));
        documentosFirmados[hashDoc] = true;
        emit DocumentoNotarizado(hashDoc, _metadata);
    }

    function verificarSoberania() public view returns (bool) {
        return (msg.sender == comandanteSupremo);
    }
}
