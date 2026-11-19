package br.com.vias.model;

import jakarta.persistence.*;

import java.time.LocalDate;

/**
 * Vinculo cadastral entre unidade e servico, com a fonte que o informou.
 * NAO representa vaga, agenda nem atendimento disponivel hoje.
 */
@Entity
@Table(name = "UNIDADE_SERVICO")
public class UnidadeServico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_unidade_servico")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_unidade", nullable = false)
    private UnidadeSaude unidade;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_servico", nullable = false)
    private ServicoSaude servico;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_fonte", nullable = false)
    private FonteDado fonte;

    @Column(name = "data_referencia_fonte")
    private LocalDate dataReferenciaFonte;

    public UnidadeServico() {
    }

    public UnidadeServico(UnidadeSaude unidade, ServicoSaude servico, FonteDado fonte, LocalDate dataReferenciaFonte) {
        this.unidade = unidade;
        this.servico = servico;
        this.fonte = fonte;
        this.dataReferenciaFonte = dataReferenciaFonte;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public UnidadeSaude getUnidade() { return unidade; }
    public void setUnidade(UnidadeSaude unidade) { this.unidade = unidade; }
    public ServicoSaude getServico() { return servico; }
    public void setServico(ServicoSaude servico) { this.servico = servico; }
    public FonteDado getFonte() { return fonte; }
    public void setFonte(FonteDado fonte) { this.fonte = fonte; }
    public LocalDate getDataReferenciaFonte() { return dataReferenciaFonte; }
    public void setDataReferenciaFonte(LocalDate dataReferenciaFonte) { this.dataReferenciaFonte = dataReferenciaFonte; }
}
