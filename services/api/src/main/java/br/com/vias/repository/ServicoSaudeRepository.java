package br.com.vias.repository;

import br.com.vias.dto.ServicoResponse;
import br.com.vias.model.ServicoSaude;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/** Camada DAO: catalogo de servicos. */
@Repository
public interface ServicoSaudeRepository extends JpaRepository<ServicoSaude, Long> {

    @Query("""
            select new br.com.vias.dto.ServicoResponse(s.id, s.codigo, s.nome, s.descricao, s.campoOrigem, s.categoria, f.sigla, count(us.id))
              from ServicoSaude s join s.fonte f left join UnidadeServico us on us.servico = s
             group by s.id, s.codigo, s.nome, s.descricao, s.campoOrigem, s.categoria, f.sigla
             order by s.nome
            """)
    List<ServicoResponse> listarComTotais();

    @Query("""
            select new br.com.vias.dto.ServicoResponse(s.id, s.codigo, s.nome, s.descricao, s.campoOrigem, s.categoria, f.sigla, count(us.id))
              from ServicoSaude s join s.fonte f left join UnidadeServico us on us.servico = s
             where s.id = :id
             group by s.id, s.codigo, s.nome, s.descricao, s.campoOrigem, s.categoria, f.sigla
            """)
    List<ServicoResponse> buscarComTotal(@Param("id") Long id);
}
