package br.com.vias.repository;

import br.com.vias.model.FonteDado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/** Camada DAO: fontes de dados. */
@Repository
public interface FonteDadoRepository extends JpaRepository<FonteDado, Long> {

    Optional<FonteDado> findBySigla(String sigla);
}
