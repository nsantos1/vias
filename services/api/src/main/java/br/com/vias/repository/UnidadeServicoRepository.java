package br.com.vias.repository;

import br.com.vias.model.UnidadeServico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

/** Camada DAO: vinculos unidade x servico. */
@Repository
public interface UnidadeServicoRepository extends JpaRepository<UnidadeServico, Long> {

    /** Servicos de varias unidades numa consulta so (evita N+1 na listagem). */
    @Query("select us from UnidadeServico us join fetch us.servico where us.unidade.id in :ids order by us.servico.nome")
    List<UnidadeServico> buscarPorUnidades(@Param("ids") Collection<Long> ids);
}
