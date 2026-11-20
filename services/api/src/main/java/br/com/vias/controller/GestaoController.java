package br.com.vias.controller;

import br.com.vias.dto.ResumoGestaoResponse;
import br.com.vias.service.GestaoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/gestao")
@Tag(name = "Painel do gestor", description = "Indicadores agregados do cadastro, sem dados pessoais")
public class GestaoController {

    private final GestaoService service;

    public GestaoController(GestaoService service) {
        this.service = service;
    }

    @GetMapping("/resumo")
    @Operation(summary = "Resumo agregado do cadastro, com a definicao de cada indicador")
    public ResponseEntity<ResumoGestaoResponse> resumo() {
        return ResponseEntity.ok(service.resumo());
    }
}
