package br.com.vias.service;

import br.com.vias.dto.RegiaoResponse;
import br.com.vias.exception.RecursoNaoEncontradoException;
import br.com.vias.repository.RegiaoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/** Camada BO: regioes. */
@Service
public class RegiaoService {

    private final RegiaoRepository regiaoRepository;

    public RegiaoService(RegiaoRepository regiaoRepository) {
        this.regiaoRepository = regiaoRepository;
    }

    @Transactional(readOnly = true)
    public List<RegiaoResponse> listar(String nome) {
        return regiaoRepository.listarComTotais(nome == null || nome.isBlank() ? null : nome.trim());
    }

    @Transactional(readOnly = true)
    public RegiaoResponse buscar(Long id) {
        return regiaoRepository.buscarComTotal(id).stream().findFirst()
                .orElseThrow(() -> new RecursoNaoEncontradoException("Região", id));
    }
}
