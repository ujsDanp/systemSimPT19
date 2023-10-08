# systemSimPT19
Compilation of backup scripts for the PT-19 sim

PT-19 Readme

pt-BR

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

Há mais, mas esses são alguns dos comportamentos presentes no código acima.
Obrigado pela leitura!
Dan.

en-US

What is all this here?
The scripts above are the brains of a simulation.
We are simulating the operation of the Fairchild PT-19 aircraft, a training aircraft used in World War II before pilots were sent to the front in more complex (and costly) aircraft.

init.lua defines the custom variables we will use. There are many of them, such as the amount of oil, whether there is oil, the state of various engine and cabin components.
These variables will be read and edited multiple times in the other scripts,

starter.lua configures the behavior of the starter motor, as well as other behaviors related to the engine and carburetor state;
and also manages the graphics that will be seen within the simulation environment (Laminar Research's proprietary graphics engine, based on OpenGL). One of the systems managed here is the logic behind the color of the exhaust smoke depending
on the amount of oil present in each engine piston, as well as the amount of smoke that will be emitted (or if there will be smoke at all). It also defines all the engine and starting states, such as starting without a primer, starting with
hydraulic lock, hot start, cold start, etc. All failures and parameters are defined here.

clocky.lua defines the behavior of the on-board clock, a military A-11 model. User interactions with the clock as well as its operating modes are all defined here (amount of "winding" present, time measurement, wear, etc.)

mechanics.lua defines many other behaviors related to oil, pneumatic system, wear, and maintenance of individual components, such as tires, last maintenance inspections, and even simulates insects that may collide with our aircraft
depending on latitude and longitude, temperature, humidity, and flight altitude.

There's more, but these are some of the behaviors present in the code above.
Thank you for reading!
Dan.


