## Build

`docker build --tag vespa-bug-repro .`

## Run

`docker run -p 8080:8080 -p 19071:19071 vespa-bug-repro`

## Verify

The following command:

`curl --data-urlencode 'yql=select * from diary_page where default contains phrase("JOAO", "PAULO", "MARTINS", "DE", "SOUZA", "BARBOZA")' localhost:8080/search/`

Should highlight:

```txt
"<sep />BUSCA E APREENSÃO CRIMINAL Meio: Diário Eletrônico de Justiça Nacional Inteiro Teor: https://pje1g.tjrn.jus.br:443/pje/Processo/ConsultaDocumento/listView.seam?x=23022714224705600000090540621 Envolvido: <hi>JOAO</hi> <hi>PAULO</hi> <hi>MARTINS</hi> DE SOUZA BARBOZA (POLO: Polo passivo) Advogado: <hi>JOAO</hi> <hi>PAULO</hi> <hi>MARTINS</hi> <hi>DE</hi> <hi>SOUZA</hi> <hi>BARBOZA</hi> (OAB: 0001304S/RN) Conteúdo: PODER JUDICIÁRIO DO ESTADO DO RIO GRANDE<sep />
```

But it produces no matches (the error appears when `DE` is asked).