package br.com.vias.controller;

import br.com.vias.dto.ServicoResponse;
import br.com.vias.service.ServicoSaudeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/servicos")
@Tag(name = "Servicos", description = "Catalogo de servicos pesquisaveis (indicadores publicados pelo CNES)")
public class ServicoSaudeController {

    private final ServicoSaudeService service;

    public ServicoSaudeController(ServicoSaudeService service) {
        this.service = service;
    }

    @GetMapping
    @Operation(summary = "Lista o catalogo de servicos com o total de unidades vinculadas")
    public ResponseEntity<List<ServicoResponse>> listar() {
        return ResponseEntity.ok(service.listar());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Detalhe de um servico")
    public ResponseEntity<ServicoResponse> buscar(@PathVariable Long id) {
        return ResponseEntity.ok(service.buscar(id));
    }
}
