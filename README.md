# Desafio LuizaLabs


https://github.com/user-attachments/assets/7597e836-f4b8-4e24-a02d-da6c7f760773



## Observações
Foi muito legal ter feito esse desafio, pois quando olhei as telas do desafio eu pensei que era uma besteira, que ia ser fácil.
Mas depois de eu ver que eu seria avaliado de acordo com o nível da posição eu vi a oportunidade de ~fazer overengineering~ caprichar
na solução. Então fiz o que estava dentro dos meus limites de conhecimento e tempo (que eu não tive muito pois só consegui iniciar
o projeto na quinta-feira).

## Autocrítica
Eu acho que eu podia ter feito telas mais elaboradas, pois achei o design, apesar de funcional e bonito (na minha opinião e na dos meus amigos),
é bem simplória, além de eu não ter feito tantos testes quanto eu acho que deveria ter feito. Algo que com certeza eu teria tempo pra fazer se
eu tivesse conseguido iniciarn o dia em que o desafio foi passado pra mim. Além, também, de eu não ter testado as `UIView` e `UIViewController`,
e portanto os testes só tiveram uma cobertura de (quase) 100% nos Models, ViewModels e Repositorys.

## Libs utilizadas
Utilizei estas bibliotecas pois são as que eu mais tenho experiência, e portanto, mais facilidade.
Tentei usar Hero para animações mas eu acabei perdendo horas tentando fazer ele dar certo do jeito que eu queria,
porém não tive sucesso, infelizmente. Percebi que as imagens da listagem de repositórios estavam tendo _flickering_
e percebi que teria que cachear as imagens para uma melhor performance e menos bugs na interface, então usei SDWebImage.

- UIkit
- SnapKit
- RxSwift
- Alamofire
- SDWebImage

## Arquitetura
MVVM-C

## Solução adotada e Escolhas feitas
Fiz o projeto de forma modularizada (packages independentes uns dos outros), com um design system básico, e o código mais limpo
que eu pude pensar na hora, e portanto escalável. Tentei abstrair o máximo possível as coisas que poderiam ser reutilizadas múltiplas vezes, além de
tentar sempre facilitar o desenvolvimento com extensions que aceleram e que ajudam em diversos casos. A interface, apesar de simplória, é algo que
é bastante do meu agrado algo bem nativo iOS, poderia ser mais elaborada. Algo que eu gostei foram as animações na listagem principal, que por mais simples que seja, fez sentido pra mim pois ela só ocorre em células que não foram vistas antes, parecendo que está a todo momento carregando, dando a ideia do scroll infinito só que mais _smooth_ 

Algumas funções de extensões eu peguei de códigos que eu já conhecia e que julgava extremamente úteis e indispensáveis para ajudar no desenvolvimento.
Quero deixar claro que essas funções só serviram apenas para essa finalidade, acelerar o desenvolvimento, não descartando o fato de eu ter um extenso 
conhecimento prévio desse código antes de usar uma parte pequena dele aqui (é fácil de entender se imaginar que é mais uma lib externa que facilita 
a vida, tipo SDWebImage). 

## Instruções
Com sua [chave API do Github](https://docs.github.com/en/rest?apiVersion=2022-11-28) em mãos, edite o esquema principal do projeto:
<br>
<img width="406" alt="image" src="https://github.com/user-attachments/assets/8ada83c5-f2c7-464f-93f0-306c377143a6">
<br>

Na janela que abrir, clique em "Run" e depois em "Arguments". Procure por "Environment Variables" subistitua na chave `API_KEY` o campo que explicita o local que
você deve substituir pela chave, na coluna "Value":
<br>
<img width="939" alt="image" src="https://github.com/user-attachments/assets/eecbe3c9-d7b9-4f59-85c7-5ec93257e689">
<br>

Por último, caso tenha problemas com os pacotes, resete o cache deles:
<img width="549" alt="image" src="https://github.com/user-attachments/assets/11d5a720-4703-42b0-917e-932544fd9562">
<br>
<br>
<br>

Isso é tudo. Obrigado pela oportunidade!




