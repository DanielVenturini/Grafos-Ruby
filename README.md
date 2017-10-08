# Grafos-Ruby

Como estou começando a aprender a linguagem Ruby, estou criando um grafos para ir praticando.

O grafo já tem as funções basicas de inserir, printar e duas de busca: largura; e profundidade. Tambem tem a função de ordenação topológica, porem a mesma depende da ordem em que os vertices e arestas são inseridos. Em qualquer ordem ela funciona, porém o resultado varia.

Agora está adicionado a classe Aresta, Tree, e Node, assim sendo possivel implementar alguns algoritmos para gerar a arvore minima.

Para quem tem o programa Graphviz instalado, foi adicionado a classe ToGraphviz, que chama este programa e desenho o grafo. Isto é muito bom para podermos ver o grafo como ele está. O programa pode ser baixado aqui: http://www.graphviz.org/pub/graphviz/stable/windows/graphviz-2.38.msi. Depois é necessário colocar o executavel nas Variaveis de Ambiente.

Meu computador->Propriedades->Configuraçoes avançadas do sistema->Váriaveis de ambiente->Váriaveis de sistema->Path->Editar. Coloque um ; no final e cole o endereço dos executaveis do Graphviz: C:\Program Files (x86)\Graphviz2.38\bin
