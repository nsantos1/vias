import MapaDecorativo from "@/components/decor/MapaDecorativo";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import Etapas from "@/components/ui/Etapas";
import { TextField } from "@/components/ui/Field";

/**
 * Tela 1 de 3, Necessidade (referência docs/referencias/01-necessidade.webp).
 *
 * O formulário ainda está desabilitado: ele depende de GET /api/servicos (D-04)
 * e só fica ativo no FE-11. Até lá, a tela mostra o layout real, mas não
 * sugere nenhum serviço, região ou unidade. O seletor "Atendimento pelo"
 * (SUS/plano) fica fora até D-12 ser decidido (R-02).
 */
export default function Home() {
  return (
    <div className="relative isolate overflow-hidden">
      <MapaDecorativo className="absolute top-24 -right-12 -z-10 w-[min(72vw,28rem)] opacity-80 sm:top-20" />

      <div className="mx-auto max-w-5xl px-4 pt-4 pb-10 sm:px-6 sm:pt-6">
        <div className="flex max-w-xl flex-col gap-8">
          <Etapas atual={1} />

          <div className="flex flex-col gap-3">
            <h1 className="text-5xl leading-[1.02] font-bold sm:text-6xl">
              O que você
              <br />
              precisa?
            </h1>
            <p className="text-lead text-salvia">
              Busque por um exame, serviço ou especialidade.
            </p>
          </div>

          <form aria-describedby="aviso-busca" className="flex flex-col gap-5">
            <TextField
              rotulo="Exame, serviço ou especialidade"
              icone="busca"
              destaque
              disabled
              name="servico"
            />

            <div className="flex flex-col items-center gap-3">
              <Button type="submit" largo seta disabled>
                Buscar unidades
              </Button>
              <p className="text-center text-salvia">
                Encontre unidades com o serviço procurado.
              </p>
            </div>
          </form>

          <div id="aviso-busca">
            <Alert tom="info" titulo="Busca em preparação">
              A lista de serviços ainda não está disponível. Assim que a consulta estiver
              pronta, a busca fica ativa nesta tela.
            </Alert>
          </div>
        </div>
      </div>
    </div>
  );
}
