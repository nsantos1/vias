package br.com.vias.model;

import br.com.vias.model.converter.SimNaoConverter;
import jakarta.persistence.*;

/** Origem de um dado (ex.: CNES/DATASUS ou cadastro manual pela API). */
@Entity
@Table(name = "FONTE_DADO")
public class FonteDado {

    public static final String CNES = "CNES_DEMAS";
    public static final String MANUAL = "CADASTRO_MANUAL";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_fonte")
    private Long id;

    @Column(name = "sigla", nullable = false, length = 30, unique = true)
    private String sigla;

    @Column(name = "nome", nullable = false, length = 150)
    private String nome;

    @Column(name = "url", length = 300)
    private String url;

    /** Fonte oficial: os campos vindos dela nao podem ser alterados pelo CRUD da API. */
    @Convert(converter = SimNaoConverter.class)
    @Column(name = "oficial", nullable = false, length = 1)
    private Boolean oficial;

    public FonteDado() {
    }

    public boolean isOficial() {
        return Boolean.TRUE.equals(oficial);
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getSigla() { return sigla; }
    public void setSigla(String sigla) { this.sigla = sigla; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }
    public Boolean getOficial() { return oficial; }
    public void setOficial(Boolean oficial) { this.oficial = oficial; }
}
