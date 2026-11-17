package br.com.vias.controller;

import br.com.vias.dto.RegiaoResponse;
import br.com.vias.service.RegiaoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/regioes")
@Tag(name = "Regioes", description = "Regioes para filtrar a busca (hoje: bairros informados no CNES)")
public class RegiaoController {

    private final RegiaoService service;

    public RegiaoController(RegiaoService service) {
        this.service = service;
    }

    @GetMapping
    @Operation(summary = "Lista as regioes com o total de unidades; nome filtra por trecho do nome")
    public ResponseEntity<List<RegiaoResponse>> listar(@RequestParam(required = false) String nome) {
        return ResponseEntity.ok(service.listar(nome));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Detalhe de uma regiao")
    public ResponseEntity<RegiaoResponse> buscar(@PathVariable Long id) {
        return ResponseEntity.ok(service.buscar(id));
    }
}
