package br.com.vias.integracao.olhovivo;

import java.util.List;

/** Previsões ao vivo dos ônibus municipais da SPTrans (API Olho Vivo). */
public interface ClienteOlhoVivo {

    /** Próximos ônibus previstos para a parada, de todas as linhas que passam nela. */
    List<PrevisaoChegada> previsoesNaParada(long codigoParada);
}
