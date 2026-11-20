package br.com.vias.controller;

import br.com.vias.dto.*;
import br.com.vias.model.enums.RespostaCadastro;
import br.com.vias.model.enums.StatusAcessibilidade;
import br.com.vias.service.UnidadeSaudeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/api/unidades")
@Tag(name = "Unidades de saude", description = "Pesquisa, detalhe e cadastro de unidades (CNES + cadastros manuais)")
public class UnidadeSaudeController {

    private final UnidadeSaudeService service;

    public UnidadeSaudeController(UnidadeSaudeService service) {
        this.service = service;
    }

    @GetMapping
    @Operation(summary = "Pesquisa unidades",
            description = "Filtros opcionais e combinaveis. tipoUnidade usa o codigo do CNES (2 = UBS, 4 = policlinica, 5 = hospital geral, 73 = pronto atendimento).")
    public ResponseEntity<PaginaResponse<UnidadeResumoResponse>> pesquisar(
            @RequestParam(required = false) Long servicoId,
            @RequestParam(required = false) Long regiaoId,
            @RequestParam(required = false) String bairro,
            @RequestParam(required = false) String nome,
            @RequestParam(required = false) StatusAcessibilidade acessibilidade,
            @RequestParam(required = false) RespostaCadastro atendeSus,
            @RequestParam(required = false) Integer tipoUnidade,
            @RequestParam(defaultValue = "0") @Min(0) int pagina,
            @RequestParam(defaultValue = "20") @Min(1) @Max(100) int tamanho) {
        return ResponseEntity.ok(service.pesquisar(servicoId, regiaoId, bairro, nome, acessibilidade, atendeSus,
                tipoUnidade, pagina, tamanho));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Detalhe da unidade, com servicos, regiao, proveniencia e avisos")
    public ResponseEntity<UnidadeDetalheResponse> buscar(@PathVariable Long id) {
        return ResponseEntity.ok(service.buscar(id));
    }

    @PostMapping
    @Operation(summary = "Cadastra unidade manualmente (fonte CADASTRO_MANUAL)")
    public ResponseEntity<UnidadeDetalheResponse> criar(@RequestBody @Valid UnidadeRequest req) {
        UnidadeDetalheResponse criada = service.criar(req);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(criada.id()).toUri();
        return ResponseEntity.created(uri).body(criada);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Atualiza unidade",
            description = "Em unidade do CNES, so acessibilidade e regiaoId podem mudar; campos cadastrais diferentes sao recusados (422).")
    public ResponseEntity<UnidadeDetalheResponse> atualizar(@PathVariable Long id, @RequestBody @Valid UnidadeRequest req) {
        return ResponseEntity.ok(service.atualizar(id, req));
    }

    @PutMapping("/{id}/acessibilidade")
    @Operation(summary = "Registra a acessibilidade verificada (qualquer unidade)")
    public ResponseEntity<UnidadeDetalheResponse> atualizarAcessibilidade(@PathVariable Long id,
                                                                          @RequestBody @Valid AcessibilidadeDto req) {
        return ResponseEntity.ok(service.atualizarAcessibilidade(id, req));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Exclui unidade de cadastro manual (unidades do CNES sao protegidas)")
    public ResponseEntity<Void> excluir(@PathVariable Long id) {
        service.excluir(id);
        return ResponseEntity.noContent().build();
    }
}
