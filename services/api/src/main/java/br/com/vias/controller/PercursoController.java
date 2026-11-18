package br.com.vias.controller;

import br.com.vias.dto.PercursoRequest;
import br.com.vias.dto.PercursoResponse;
import br.com.vias.service.PercursoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/percursos")
@Tag(name = "Percurso", description = "Transporte público até a unidade (Google Routes + SPTrans Olho Vivo)")
public class PercursoController {

    private final PercursoService service;

    public PercursoController(PercursoService service) {
        this.service = service;
    }

    /** POST para a localizacao da pessoa ir no corpo, e nao na URL (que fica em logs e historico). */
    @PostMapping
    @Operation(summary = "Calcula o percurso de transporte público até a unidade",
            description = "Devolve opções com horário sugerido de saída, linhas, horários de embarque e, nos ônibus "
                    + "da SPTrans, a previsão ao vivo com os veículos acessíveis. Sem horarioAtendimento, calcula "
                    + "saindo agora. A origem é usada só neste cálculo: não é gravada nem registrada em log. "
                    + "Responde 503 quando o serviço de rotas não está configurado ou não respondeu.")
    public ResponseEntity<PercursoResponse> calcular(@RequestBody @Valid PercursoRequest req) {
        return ResponseEntity.ok(service.calcular(req));
    }
}
