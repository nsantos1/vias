# OpenTripPlanner

Responsável: Nicolas (3). Motor de rotas do VIAS: transporte público, a pé, bicicleta e rota acessível para cadeira de rodas. Roda direto como arquivo `.jar`, sem Docker.

**Meta do portão 1:** uma rota de ônibus real em São Paulo saindo deste servidor.

## Versão e Java

Usamos o **OpenTripPlanner 2.8.1**, a última versão que roda em **Java 21** (o mesmo da API). A partir da 2.9, o OpenTripPlanner exige Java 25. Para trocar de versão, mude `OTP_VERSAO` nos scripts.

## O que vai na pasta `grafo/`

Nada desta pasta vai para o Git (são arquivos grandes). O OpenTripPlanner reconhece os arquivos pelo nome:

| Arquivo | De onde vem |
|---|---|
| `sptrans-gtfs.zip` | GTFS da SPTrans, baixado na área de desenvolvedores da SPTrans (cadastro gratuito). O nome precisa conter `gtfs` e terminar em `.zip`. |
| `sao-paulo.osm.pbf` | Mapa do OpenStreetMap recortado só para a cidade de São Paulo (passo 2) |
| `graph.obj` | Grafo montado pelo passo 3 |

## Passo a passo

### 1. Baixar o OpenTripPlanner

```bash
./baixar-otp.sh          # Linux, macOS ou Git Bash no Windows
.\baixar-otp.ps1         # Windows PowerShell
```

Baixa `otp-shaded-2.8.1-shaded.jar` do Maven Central para esta pasta.

### 2. Recortar o mapa só da cidade de São Paulo

Um recorte menor gasta menos memória, o que importa na máquina gratuita da Oracle Cloud (12 GB divididos com a API e o FastAPI).

1. Baixe o mapa da região Sudeste na Geofabrik: `https://download.geofabrik.de/south-america/brazil/sudeste-latest.osm.pbf`
2. Recorte com o osmium (Linux: `apt install osmium-tool`; Windows: `conda install -c conda-forge osmium-tool` ou pelo WSL):

   ```bash
   osmium extract -b -46.83,-24.01,-46.36,-23.35 sudeste-latest.osm.pbf -o grafo/sao-paulo.osm.pbf
   ```

   Os números são o retângulo que cobre o município de São Paulo (oeste, sul, leste, norte).

Sem o osmium, o site `extract.bbbike.org` recorta uma área desenhada no navegador e devolve o `.osm.pbf`.

### 3. Montar o grafo

```bash
./montar-grafo.sh
.\montar-grafo.ps1
```

Lê o GTFS e o mapa e salva `grafo/graph.obj`. Pode levar vários minutos. A memória máxima é definida por `OTP_MEMORIA` (padrão `4G`). Se aparecer `OutOfMemoryError`, aumente, por exemplo `OTP_MEMORIA=6G ./montar-grafo.sh`.

**Anote quanta memória foi necessária:** esse número decide se o deploy cabe na máquina gratuita.

### 4. Servir e testar

```bash
./servir.sh
.\servir.ps1
```

Sobe o servidor na porta **8081** (a 8080 fica para a API Java). Abra `http://localhost:8081` no navegador: a interface de teste do OpenTripPlanner permite marcar origem e destino no mapa e ver a rota de ônibus. Quando ela aparecer, o portão 1 está cumprido.

### 5. Conferir a acessibilidade do GTFS

A partir de `data/etl`:

```bash
python -m vias_etl.gtfs.acessibilidade ../../services/otp/grafo/sptrans-gtfs.zip
```

Se a maior parte das paradas e viagens vier sem informação, a rota acessível precisa do enriquecimento em `data/etl/vias_etl/acessibilidade`.
