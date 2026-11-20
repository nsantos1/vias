package br.com.vias.model;

import br.com.vias.model.enums.TipoRegiao;
import jakarta.persistence.*;

/** Agrupamento territorial das unidades (hoje: bairro informado no CNES; granularidade provisoria). */
@Entity
@Table(name = "REGIAO")
public class Regiao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_regiao")
    private Long id;

    @Column(name = "nome", nullable = false, length = 100)
    private String nome;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_regiao", nullable = false, length = 25)
    private TipoRegiao tipo;

    @Column(name = "codigo_municipio", nullable = false, length = 7)
    private String codigoMunicipio;

    @Column(name = "uf", nullable = false, length = 2)
    private String uf;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_fonte", nullable = false)
    private FonteDado fonte;

    public Regiao() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public TipoRegiao getTipo() { return tipo; }
    public void setTipo(TipoRegiao tipo) { this.tipo = tipo; }
    public String getCodigoMunicipio() { return codigoMunicipio; }
    public void setCodigoMunicipio(String codigoMunicipio) { this.codigoMunicipio = codigoMunicipio; }
    public String getUf() { return uf; }
    public void setUf(String uf) { this.uf = uf; }
    public FonteDado getFonte() { return fonte; }
    public void setFonte(FonteDado fonte) { this.fonte = fonte; }
}
