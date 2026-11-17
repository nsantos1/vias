package br.com.vias.service;

import br.com.vias.dto.ServicoResponse;
import br.com.vias.exception.RecursoNaoEncontradoException;
import br.com.vias.repository.ServicoSaudeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/** Camada BO: catalogo de servicos. */
@Service
public class ServicoSaudeService {

    private final ServicoSaudeRepository servicoRepository;

    public ServicoSaudeService(ServicoSaudeRepository servicoRepository) {
        this.servicoRepository = servicoRepository;
    }

    @Transactional(readOnly = true)
    public List<ServicoResponse> listar() {
        return servicoRepository.listarComTotais();
    }

    @Transactional(readOnly = true)
    public ServicoResponse buscar(Long id) {
        return servicoRepository.buscarComTotal(id).stream().findFirst()
                .orElseThrow(() -> new RecursoNaoEncontradoException("Servico", id));
    }
}
