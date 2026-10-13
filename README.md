# mac-ram-monitor

Script simples em shell para descobrir **qual processo está fazendo a RAM subir** no macOS.

A cada intervalo ele registra os 8 processos que mais usam memória, as páginas livres e os *pageouts*
(quando o macOS começa a jogar dados da RAM para o disco).

## Download

Baixe o `ram-monitor.sh` na [última release](https://github.com/Marcelobrau/mac-ram-monitor/releases/latest) ou clone o repo.
Se baixou o arquivo solto, dê permissão de execução antes de rodar:

```sh
chmod +x ram-monitor.sh
```

## Uso

```sh
./ram-monitor.sh            # 10 amostras, a cada 30s, salva em ram-monitor.log
./ram-monitor.sh 20 10 meu.log   # 20 amostras, a cada 10s, em meu.log
```

Depois compare a primeira e a última amostra: o processo que cresceu é o suspeito.

## Como ler

- `free_pages` baixo **não é problema por si só**: o macOS usa RAM livre como cache.
- `pageouts` subindo é o sinal real de pressão de memória.

## Ajuda é bem-vinda! 🙌

Issues e pull requests são muito bem-vindos. Ideias:

- Somar o uso por aplicativo (ex.: todos os processos do Chrome juntos)
- Saída em CSV e gráfico
- Alerta quando os pageouts começarem a subir
- Versão com `launchd` para rodar em segundo plano
- Testes em outras versões do macOS

## Licença

MIT
