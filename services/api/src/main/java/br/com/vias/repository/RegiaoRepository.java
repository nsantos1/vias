package br.com.vias.repository;

import br.com.vias.dto.RegiaoResponse;
import br.com.vias.model.Regiao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/** Camada DAO: regioes. */
@Repository
public interface RegiaoRepository extends JpaRepository<Regiao, Long> {

    /** Regioes com a quantidade de unidades cadastradas em cada uma. */
    @Query("""
            select new br.com.vias.dto.RegiaoResponse(r.id, r.nome, r.tipo, r.codigoMunicipio, r.uf, f.sigla, count(u.id))
              from Regiao r join r.fonte f left join UnidadeSaude u on u.regiao = r
             where (:nome is null or upper(r.nome) like upper(concat('%', :nome, '%')))
             group by r.id, r.nome, r.tipo, r.codigoMunicipio, r.uf, f.sigla
             order by r.nome
            """)
    List<RegiaoResponse> listarComTotais(@Param("nome") String nome);

    @Query("""
            select new br.com.vias.dto.RegiaoResponse(r.id, r.nome, r.tipo, r.codigoMunicipio, r.uf, f.sigla, count(u.id))
              from Regiao r join r.fonte f left join UnidadeSaude u on u.regiao = r
             where r.id = :id
             group by r.id, r.nome, r.tipo, r.codigoMunicipio, r.uf, f.sigla
            """)
    List<RegiaoResponse> buscarComTotal(@Param("id") Long id);
}
