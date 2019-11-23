# Achados e Perdidos

Aplicativo para cadastro de objetos achados ou perdidos utilizando Firebase, criado para disciplina de Programação Mobile com Flutter.

<p align="center">
    <img src="https://github.com/MateusPalomo/Lost-and-Found/blob/master/assets/screen2.PNG" height="400"/>
    <img src="https://github.com/MateusPalomo/Lost-and-Found/blob/master/assets/screen1.PNG" height="400"/>
    <img src="https://github.com/MateusPalomo/Lost-and-Found/blob/master/assets/screen3.PNG" height="400"/>
    <img src="https://github.com/MateusPalomo/Lost-and-Found/blob/master/assets/screen4.PNG" height="400"/>
    <img src="https://media.giphy.com/media/Z9KdG7wGi40oupWKGc/giphy.gif" height="400" />
    
    
</p>

## Alguns desafios resolvidos do projeto:

:heavy_check_mark: Criar e usar temas Light e Dark;

:heavy_check_mark: Criar um IconButton na AppBar para alternar entre os temas;

:heavy_check_mark: Criar um formulário para adicionar todos os campos do JSON;

:heavy_check_mark: Validar o campo de digitação de CEP;

:heavy_check_mark: Tratar todas exceções e utilizar um Flushbar para exibir os erros para o usuário;

:heavy_check_mark: Adicionar um IconButton na AppBar para compartilhar o CEP.

## Plugins
Plugins utilizados neste repositório.

| Plugin | Pub |
|--------|-----|
| share | [![pub package](https://img.shields.io/pub/v/share.svg)](https://pub.dev/packages/share) |
| flushbar |[pub](https://pub.dev/packages/flushbar) |
| http | [![pub package](https://img.shields.io/pub/v/http.svg)](https://pub.dev/packages/http) |
| dynamic theme |[pub](https://pub.dev/packages/dynamic_theme#-readme-tab-) |
| font awesome flutter |[pub](https://pub.dev/packages/font_awesome_flutter) |

## API

### ViaCEP
https://viacep.com.br/

Exemplo de uso: https://viacep.com.br/ws/13087440/json/
```
{
  "cep": "13087-440",
  "logradouro": "Rua das Hortências",
  "complemento": "",
  "bairro": "Chácara Primavera",
  "localidade": "Campinas",
  "uf": "SP",
  "unidade": "",
  "ibge": "3509502",
  "gia": "2446"
}

```
