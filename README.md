# systemSimPT19
Compilation of backup scripts for the PT-19 sim

PT-19 Readme

O que é isso tudo aqui?
Os scripts acima são o cérebro de uma simulação. 
Estamos simulando o funcionamento da aeronave Fairchild PT-19, uma aeronave de treinamento usada na segunda guerra mundial antes que os pilotos fossem enviados para o front em aeronaves mais complexas (e custosas).

init.lua define as variáveis customizadas que vamos usar. Elas são várias, como quantidade de óleo, se há óleo, o estado dos componentes diversos do motor e da cabine. 
Essas variáveis serão lidas e editadas múltiplas vezes nos outros scripts,

starter.lua configura o comportamento do motor de partida, bem como outros comportamentos referentes ao estado do motor e carburador;
e também gerencia os gráficos que serão vistos dentro do ambiente da simulação (Engine gráfica proprietária da Laminar Research, baseada em OpenGL). Um dos sistemas gerenciados aqui é a lógica por trás da cor da fumaça do escapamento dependendo
da quantidade de óleo presente em cada pistão do motor, bem como a quantidade de fumaça que será dispersada pelo mesmo (ou mesmo se haverá fumaça). Também se definem todos os estados do motor e da partida, como um acionamento sem primer, acionamento com 
calço hidráulico, partida quente, partida fria, etc. Todas as falhas e parâmetros são definidas aqui.

clocky.lua define o comportamento do relógio de bordo, modelo militar A-11. As interações do usuário com o relógio bem como seus modos de funcionamento são todos definidos aqui (quantidade de "corda" presente, medição do tempo, desgaste, etc.)

mechanics.lua define muitos outros comportamentos relativos ao óleo, sistema pneumático, desgaste e manutenção de componentes individuais, como pneus, últimas inspeções de manutenção, e até mesmo conduz simulação dos insetos que podem colidir com nossa aeronave
a depender da latidude e longitude, temperatura, umidade, e altitude de voo.

Há mais, mas essas são alguns dos comportamentos presentes no código acima.
Obrigado pela leitura!
Dan.
