package br.com.vias.model;

import br.com.vias.model.enums.RespostaCadastro;
import br.com.vias.model.enums.StatusAcessibilidade;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * Estabelecimento de saude. O codigo CNES e identificador externo (a PK e interna).
 * Campos sem correspondencia na fonte ficam NULL ou com estado explicito de "nao informado".
 */
@Entity
@Table(name = "UNIDADE_SAUDE")
public class UnidadeSaude {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_unidade")
    private Long id;

    @Column(name = "codigo_cnes", length = 7, unique = true)
    private String codigoCnes;

    @Column(name = "nome", nullable = false, length = 150)
    private String nome;

    @Column(name = "razao_social", length = 150)
    private String razaoSocial;

    @Column(name = "codigo_tipo_unidade")
    private Integer codigoTipoUnidade;

    /** Descricao do tipo conforme a origem (ex.: CENTRO DE SAUDE/UNIDADE BASICA). */
    @Column(name = "tipo_unidade", length = 120)
    private String tipoUnidade;

    @Column(name = "logradouro", length = 150)
    private String logradouro;

    @Column(name = "numero", length = 10)
    private String numero;

    @Column(name = "bairro", length = 80)
    private String bairro;

    @Column(name = "cep", length = 8)
    private String cep;

    @Column(name = "codigo_municipio", length = 7)
    private String codigoMunicipio;

    @Column(name = "uf", length = 2)
    private String uf;

    @Column(name = "telefone", length = 30)
    private String telefone;

    @Column(name = "latitude", precision = 10, scale = 7)
    private BigDecimal latitude;

    @Column(name = "longitude", precision = 10, scale = 7)
    private BigDecimal longitude;

    /** Horario/turno CADASTRAL (ex.: turno do CNES). Nao e o horario operacional de hoje. */
    @Column(name = "horario_funcionamento", length = 120)
    private String horarioFuncionamento;

    @Enumerated(EnumType.STRING)
    @Column(name = "atende_sus", nullable = false, length = 15)
    private RespostaCadastro atendeSus = RespostaCadastro.NAO_INFORMADO;

    @Enumerated(EnumType.STRING)
    @Column(name = "status_acessibilidade", nullable = false, length = 15)
    private StatusAcessibilidade statusAcessibilidade = StatusAcessibilidade.NAO_INFORMADO;

    @Column(name = "fonte_acessibilidade", length = 200)
    private String fonteAcessibilidade;

    @Column(name = "data_verificacao_acessibilidade")
    private LocalDate dataVerificacaoAcessibilidade;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_regiao")
    private Regiao regiao;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_fonte", nullable = false)
    private FonteDado fonte;

    /** Data de atualizacao informada pela propria fonte (ex.: data_atualizacao do CNES). */
    @Column(name = "data_referencia_fonte")
    private LocalDate dataReferenciaFonte;

    /** Momento em que o registro entrou no banco. Diferente da data da fonte. */
    @Column(name = "data_carga", nullable = false, updatable = false)
    private LocalDateTime dataCarga;

    /** Ultima alteracao feita pela API (PUT). */
    @Column(name = "data_atualizacao")
    private LocalDateTime dataAtualizacao;

    @OneToMany(mappedBy = "unidade", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UnidadeServico> servicos = new ArrayList<>();

    @PrePersist
    void aoCriar() {
        if (dataCarga == null) dataCarga = LocalDateTime.now();
    }

    /** Registros de fonte oficial (CNES) tem os campos cadastrais protegidos contra edicao manual. */
    public boolean isOrigemOficial() {
        return fonte != null && fonte.isOficial();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getCodigoCnes() { return codigoCnes; }
    public void setCodigoCnes(String codigoCnes) { this.codigoCnes = codigoCnes; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getRazaoSocial() { return razaoSocial; }
    public void setRazaoSocial(String razaoSocial) { this.razaoSocial = razaoSocial; }
    public Integer getCodigoTipoUnidade() { return codigoTipoUnidade; }
    public void setCodigoTipoUnidade(Integer codigoTipoUnidade) { this.codigoTipoUnidade = codigoTipoUnidade; }
    public String getTipoUnidade() { return tipoUnidade; }
    public void setTipoUnidade(String tipoUnidade) { this.tipoUnidade = tipoUnidade; }
    public String getLogradouro() { return logradouro; }
    public void setLogradouro(String logradouro) { this.logradouro = logradouro; }
    public String getNumero() { return numero; }
    public void setNumero(String numero) { this.numero = numero; }
    public String getBairro() { return bairro; }
    public void setBairro(String bairro) { this.bairro = bairro; }
    public String getCep() { return cep; }
    public void setCep(String cep) { this.cep = cep; }
    public String getCodigoMunicipio() { return codigoMunicipio; }
    public void setCodigoMunicipio(String codigoMunicipio) { this.codigoMunicipio = codigoMunicipio; }
    public String getUf() { return uf; }
    public void setUf(String uf) { this.uf = uf; }
    public String getTelefone() { return telefone; }
    public void setTelefone(String telefone) { this.telefone = telefone; }
    public BigDecimal getLatitude() { return latitude; }
    public void setLatitude(BigDecimal latitude) { this.latitude = latitude; }
    public BigDecimal getLongitude() { return longitude; }
    public void setLongitude(BigDecimal longitude) { this.longitude = longitude; }
    public String getHorarioFuncionamento() { return horarioFuncionamento; }
    public void setHorarioFuncionamento(String horarioFuncionamento) { this.horarioFuncionamento = horarioFuncionamento; }
    public RespostaCadastro getAtendeSus() { return atendeSus; }
    public void setAtendeSus(RespostaCadastro atendeSus) { this.atendeSus = atendeSus; }
    public StatusAcessibilidade getStatusAcessibilidade() { return statusAcessibilidade; }
    public void setStatusAcessibilidade(StatusAcessibilidade statusAcessibilidade) { this.statusAcessibilidade = statusAcessibilidade; }
    public String getFonteAcessibilidade() { return fonteAcessibilidade; }
    public void setFonteAcessibilidade(String fonteAcessibilidade) { this.fonteAcessibilidade = fonteAcessibilidade; }
    public LocalDate getDataVerificacaoAcessibilidade() { return dataVerificacaoAcessibilidade; }
    public void setDataVerificacaoAcessibilidade(LocalDate dataVerificacaoAcessibilidade) { this.dataVerificacaoAcessibilidade = dataVerificacaoAcessibilidade; }
    public Regiao getRegiao() { return regiao; }
    public void setRegiao(Regiao regiao) { this.regiao = regiao; }
    public FonteDado getFonte() { return fonte; }
    public void setFonte(FonteDado fonte) { this.fonte = fonte; }
    public LocalDate getDataReferenciaFonte() { return dataReferenciaFonte; }
    public void setDataReferenciaFonte(LocalDate dataReferenciaFonte) { this.dataReferenciaFonte = dataReferenciaFonte; }
    public LocalDateTime getDataCarga() { return dataCarga; }
    public void setDataCarga(LocalDateTime dataCarga) { this.dataCarga = dataCarga; }
    public LocalDateTime getDataAtualizacao() { return dataAtualizacao; }
    public void setDataAtualizacao(LocalDateTime dataAtualizacao) { this.dataAtualizacao = dataAtualizacao; }
    public List<UnidadeServico> getServicos() { return servicos; }
    public void setServicos(List<UnidadeServico> servicos) { this.servicos = servicos; }
}
