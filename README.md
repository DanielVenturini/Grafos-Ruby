# Grafos-Ruby

Como estou come�ando a aprender a linguagem Ruby, estou criando um grafos para ir praticando.

O grafo j� tem as fun��es basicas de inserir, printar e duas de busca: largura; e profundidade. Tambem tem a fun��o de ordena��o topol�gica, porem a mesma depende da ordem em que os vertices e arestas s�o inseridos. Em qualquer ordem ela funciona, por�m o resultado varia.

Agora est� adicionado a classe Aresta, Tree, e Node, assim sendo possivel implementar alguns algoritmos para gerar a arvore minima.

Para quem tem o programa Graphviz instalado, foi adicionado a classe ToGraphviz, que chama este programa e desenho o grafo. Isto � muito bom para podermos ver o grafo como ele est�. O programa pode ser baixado aqui: http://www.graphviz.org/pub/graphviz/stable/windows/graphviz-2.38.msi. Depois � necess�rio colocar o executavel nas Variaveis de Ambiente.

Meu computador->Propriedades->Configura�oes avan�adas do sistema->V�riaveis de ambiente->V�riaveis de sistema->Path->Editar. Coloque um ; no final e cole o endere�o dos executaveis do Graphviz: C:\Program Files (x86)\Graphviz2.38\bin
