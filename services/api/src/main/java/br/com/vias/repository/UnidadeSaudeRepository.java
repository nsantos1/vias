package br.com.vias.repository;

import br.com.vias.model.UnidadeSaude;
import br.com.vias.model.enums.RespostaCadastro;
import br.com.vias.model.enums.StatusAcessibilidade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/** Camada DAO: unidades de saude, pesquisa com filtros e agregados do painel. */
@Repository
public interface UnidadeSaudeRepository extends JpaRepository<UnidadeSaude, Long> {

    @EntityGraph(attributePaths = {"regiao", "fonte", "servicos", "servicos.servico", "servicos.fonte"})
    Optional<UnidadeSaude> findComDetalhesById(Long id);

    /** Pesquisa combinando os filtros acordados; filtro nulo e ignorado. */
    @Query(value = """
            select u from UnidadeSaude u left join fetch u.regiao join fetch u.fonte
             where (:servicoId is null or exists (select 1 from UnidadeServico us
                                                   where us.unidade = u and us.servico.id = :servicoId))
               and (:regiaoId is null or u.regiao.id = :regiaoId)
               and (:bairro is null or upper(u.bairro) like upper(concat('%', :bairro, '%')))
               and (:nome is null or upper(u.nome) like upper(concat('%', :nome, '%')))
               and (:acessibilidade is null or u.statusAcessibilidade = :acessibilidade)
               and (:atendeSus is null or u.atendeSus = :atendeSus)
               and (:tipoUnidade is null or u.codigoTipoUnidade = :tipoUnidade)
            """,
            countQuery = """
            select count(u) from UnidadeSaude u
             where (:servicoId is null or exists (select 1 from UnidadeServico us
                                                   where us.unidade = u and us.servico.id = :servicoId))
               and (:regiaoId is null or u.regiao.id = :regiaoId)
               and (:bairro is null or upper(u.bairro) like upper(concat('%', :bairro, '%')))
               and (:nome is null or upper(u.nome) like upper(concat('%', :nome, '%')))
               and (:acessibilidade is null or u.statusAcessibilidade = :acessibilidade)
               and (:atendeSus is null or u.atendeSus = :atendeSus)
               and (:tipoUnidade is null or u.codigoTipoUnidade = :tipoUnidade)
            """)
    Page<UnidadeSaude> pesquisar(@Param("servicoId") Long servicoId,
                                 @Param("regiaoId") Long regiaoId,
                                 @Param("bairro") String bairro,
                                 @Param("nome") String nome,
                                 @Param("acessibilidade") StatusAcessibilidade acessibilidade,
                                 @Param("atendeSus") RespostaCadastro atendeSus,
                                 @Param("tipoUnidade") Integer tipoUnidade,
                                 Pageable pageable);

    boolean existsByCodigoCnes(String codigoCnes);

    boolean existsByCodigoCnesAndIdNot(String codigoCnes, Long id);

    // ---------------- agregados do painel gestor (sem dados pessoais)

    @Query("select coalesce(u.tipoUnidade, 'NAO_INFORMADO'), count(u) from UnidadeSaude u group by u.tipoUnidade order by count(u) desc")
    List<Object[]> contarPorTipo();

    @Query("select u.statusAcessibilidade, count(u) from UnidadeSaude u group by u.statusAcessibilidade order by count(u) desc")
    List<Object[]> contarPorAcessibilidade();

    @Query("select u.atendeSus, count(u) from UnidadeSaude u group by u.atendeSus order by count(u) desc")
    List<Object[]> contarPorAtendeSus();

    @Query("""
            select r.nome, count(u) from UnidadeSaude u join u.regiao r
             group by r.nome order by count(u) desc, r.nome
            """)
    List<Object[]> contarPorRegiao(Pageable limite);

    @Query("select s.nome, count(us) from UnidadeServico us join us.servico s group by s.nome order by count(us) desc")
    List<Object[]> contarPorServico();

    @Query("select count(u) from UnidadeSaude u where u.latitude is null or u.longitude is null")
    long contarSemCoordenadas();

    @Query("select count(u) from UnidadeSaude u where u.regiao is null")
    long contarSemRegiao();

    @Query("select min(u.dataReferenciaFonte) from UnidadeSaude u")
    LocalDate menorDataReferencia();

    @Query("select max(u.dataReferenciaFonte) from UnidadeSaude u")
    LocalDate maiorDataReferencia();
}
