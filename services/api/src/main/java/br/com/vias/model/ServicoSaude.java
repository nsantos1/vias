package br.com.vias.model;

import jakarta.persistence.*;

/** Item do catalogo pesquisavel: indicadores do CNES (V2), exames e servicos especializados (V5). */
@Entity
@Table(name = "SERVICO_SAUDE")
public class ServicoSaude {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_servico")
    private Long id;

    @Column(name = "codigo", nullable = false, length = 40, unique = true)
    private String codigo;

    @Column(name = "nome", nullable = false, length = 100)
    private String nome;

    @Column(name = "descricao", length = 300)
    private String descricao;

    /** Campo da fonte que originou o servico (ex.: estabelecimento_possui_centro_cirurgico). */
    @Column(name = "campo_origem", length = 80)
    private String campoOrigem;

    /** EXAME, ESPECIALIDADE ou ATENDIMENTO (migration V5). Padrao igual ao do banco. */
    @Column(name = "categoria", nullable = false, length = 15)
    private String categoria = "ATENDIMENTO";

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_fonte", nullable = false)
    private FonteDado fonte;

    public ServicoSaude() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public String getCampoOrigem() { return campoOrigem; }
    public void setCampoOrigem(String campoOrigem) { this.campoOrigem = campoOrigem; }
    public String getCategoria() { return categoria; }

    public void setCategoria(String categoria) { this.categoria = categoria; }

    public FonteDado getFonte() { return fonte; }
    public void setFonte(FonteDado fonte) { this.fonte = fonte; }
}
