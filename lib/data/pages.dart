const pages = {
  'bankera_formalizacao_upgrade_consulta': {
    'header': {
      "show": true,
      "color": "ec7000",
      "title": {
        "accessibility": "value",
        "text": "Formalização Upgrade de Cartão"
      }
    },
    'body': {
      "type": "ListView",
      "padding": "10, 10, 10, 10",
      "pageSize": 10,
      "children": [
        {
          "type": "Padding",
          "padding": "0,10,0,10",
          "child": {
            "type": "ListTile",
            "title": {
              "type": "Padding",
              "padding": "0,10,0,10",
              "child": {
                "type": "Text",
                "data": "Upgrade Conta",
                "style": {"color": "#000000", "fontSize": 20.1}
              }
            },
            "subtitle": {
              "type": "Text",
              "data":
                  "Faça o upgrade da sua conta 1.0 para uma 2.0 na palma da sua mão",
              "maxLines": 5
            }
          }
        },
        {
          "type": "ListTile",
          "title": {"type": "Text", "data": "Seu atual limite"},
          "subtitle": {"type": "Text", "data": "2.000,00"}
        },
        {
          "type": "ListTile",
          "title": {"type": "Text", "data": "Sua atual modalidade"},
          "subtitle": {"type": "Text", "data": "1.0"}
        },
        {
          "type": "ListTile",
          "title": {"type": "Text", "data": "Sua atual bandeira"},
          "subtitle": {
            "type": "AssetImage",
            "alignment": "centerLeft",
            "width": 50.1,
            "height": 50.1,
            "name": "assets/imgs/visa.png"
          }
        },
        {
          "type": "ListTile",
          "title": {"type": "Text", "data": "Seu novo limite"},
          "subtitle": {"type": "Text", "data": "5.000,00"}
        },
        {
          "type": "ListTile",
          "title": {"type": "Text", "data": "Sua nova modalidade"},
          "subtitle": {"type": "Text", "data": "2.0"}
        },
        {
          "type": "ListTile",
          "title": {"type": "Text", "data": "Sua nova bandeira"},
          "subtitle": {
            "type": "AssetImage",
            "alignment": "centerLeft",
            "width": 50.1,
            "height": 50.1,
            "name": "assets/imgs/mastercard.png"
          }
        },
        {
          "type": "Padding",
          "padding": "10,10,10,10",
          "child": {
            "type": "Text",
            "data":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            "maxLines": 10
          }
        },
        {
          "type": "Padding",
          "padding": "10,10,10,10",
          "child": {
            "type": "RaisedButton",
            "color": "##EC7000",
            "padding": "20,20,20,20",
            "textColor": "#FFFFFF",
            "splashColor": "#EC7000",
            "click_event": "bankera_home",
            "child": {"type": "Text", "data": "Aceito"}
          }
        }
      ]
    }
  },
  'bankera_formalizacoes': {
    'header': {
      "show": true,
      "color": "ec7000",
      "title": {
        "accessibility": "value",
        "text": "Formalização Upgrade de Cartão"
      }
    },
    'body': {
      "type": "ListView",
      "padding": "10, 10, 10, 10",
      "pageSize": 10,
      "children": [
        {
          "type": "Padding",
          "padding": "0,10,0,10",
          "child": {
            "type": "ListTile",
            "title": {
              "type": "Padding",
              "padding": "0,10,0,10",
              "child": {
                "type": "Text",
                "data": "Abaixo estão as formalizações pendentes na sua conta",
                "style": {"color": "#000000", "fontSize": 20.1},
                "maxLines": 5
              }
            }
          }
        },
        {
          "type": "ListTile",
          "title": {"type": "Text", "data": "Upgrade de cartão"},
          "subtitle": {
            "type": "Text",
            "data": "Faça upgrade do seu cartão 1.0 para 2.0"
          },
          "tapEvent": "bankera_formalizacao_upgrade_consulta",
        },
        {
          "type": "ListTile",
          "title": {"type": "Text", "data": "Upgrade de conta"},
          "subtitle": {
            "type": "Text",
            "data": "Faça upgrade da sua conta Uniclass para Personalite"
          },
        },
      ]
    }
  },
  'bankera_home': {
    'header': {
      "show": false,
      "color": "ec7000",
      "title": {"accessibility": "value", "text": "Home"}
    },
    'body': {
      "type": "ListView",
      "children": [
        {
          "type": "Container",
          "height": 160.1,
          "width": 160.1,
          "color": "#ec7000",
          "padding": "10,30,10,50",
          "click_event": null,
          "child": {
            "type": "Center",
            "child": {
              "type": "Column",
              "mainAxisAlignment": "spaceEvenly",
              "children": [
                {
                  "type": "Padding",
                  "padding": "0,0,0,20",
                  "child": {
                    "type": "Text",
                    "data": "Saldo",
                    "style": {"color": "#ffffff", "fontSize": 15.1}
                  }
                },
                {
                  "type": "Text",
                  "data": "R\$ 25.000,00",
                  "style": {"color": "#ffffff", "fontSize": 30.1}
                }
              ]
            }
          }
        },
        {
          "type": "Container",
          "click_event": "bankera_formalizacoes",
          "margin": "10,10,10,10",
          "child": {
            "type": "ClipRRect",
            "borderRadius": "5,5,5,5",
            "child": {
              "type": "SizedBox",
              "child": {
                "type": "Container",
                "click_event": "bankera_formalizacoes",
                "padding": "20,20,20,20",
                "color": "#24292e",
                "child": {
                  "type": "Center",
                  "child": {
                    "type": "Text",
                    "data": "Você tem formalizações pendentes",
                    "maxLines": 5,
                    "style": {"color": "#ffffff", "fontSize": 15.1}
                  }
                },
              }
            }
          }
        },
        {
          "type": "GridView",
          "crossAxisCount": 2,
          "padding": "0, 0, 0, 0",
          "shrinkWrap": true,
          "children": [
            {
              "type": "Container",
              "margin": "10,10,10,10",
              "child": {
                "type": "ClipRRect",
                "borderRadius": "5,5,5,5",
                "child": {
                  "type": "SizedBox",
                  "child": {
                    "type": "Container",
                    "click_event": "bankera_formalizacoes",
                    "padding": "20,20,20,20",
                    "color": "#004a7f",
                    "child": {
                      "type": "Center",
                      "child": {
                        "type": "Text",
                        "data": "Extrato",
                        "textAlign": "center",
                        "maxLines": 5,
                        "style": {"color": "#ffffff", "fontSize": 15.1}
                      }
                    },
                  }
                }
              }
            },
            {
              "type": "Container",
              "margin": "10,10,10,10",
              "child": {
                "type": "ClipRRect",
                "borderRadius": "5,5,5,5",
                "child": {
                  "type": "SizedBox",
                  "child": {
                    "type": "Container",
                    "click_event": "bankera_formalizacoes",
                    "padding": "20,20,20,20",
                    "color": "#004a7f",
                    "child": {
                      "type": "Center",
                      "child": {
                        "type": "Text",
                        "data": "Transferência",
                        "textAlign": "center",
                        "maxLines": 5,
                        "style": {"color": "#ffffff", "fontSize": 15.1}
                      }
                    },
                  }
                }
              }
            },
            {
              "type": "Container",
              "margin": "10,10,10,10",
              "child": {
                "type": "ClipRRect",
                "borderRadius": "5,5,5,5",
                "child": {
                  "type": "SizedBox",
                  "child": {
                    "type": "Container",
                    "click_event": "bankera_formalizacoes",
                    "padding": "20,20,20,20",
                    "color": "#004a7f",
                    "child": {
                      "type": "Center",
                      "child": {
                        "type": "Text",
                        "data": "Serviços",
                        "textAlign": "center",
                        "maxLines": 5,
                        "style": {"color": "#ffffff", "fontSize": 15.1}
                      }
                    },
                  }
                }
              }
            },
            {
              "type": "Container",
              "margin": "10,10,10,10",
              "child": {
                "type": "ClipRRect",
                "borderRadius": "5,5,5,5",
                "child": {
                  "type": "SizedBox",
                  "child": {
                    "type": "Container",
                    "click_event": "bankera_formalizacoes",
                    "padding": "20,20,20,20",
                    "color": "#004a7f",
                    "child": {
                      "type": "Center",
                      "child": {
                        "type": "Text",
                        "data": "Lorem",
                        "textAlign": "center",
                        "maxLines": 5,
                        "style": {"color": "#ffffff", "fontSize": 15.1}
                      }
                    },
                  }
                }
              }
            },
            {
              "type": "Container",
              "margin": "10,10,10,10",
              "child": {
                "type": "ClipRRect",
                "borderRadius": "5,5,5,5",
                "child": {
                  "type": "SizedBox",
                  "child": {
                    "type": "Container",
                    "click_event": "bankera_formalizacoes",
                    "padding": "20,20,20,20",
                    "color": "#004a7f",
                    "child": {
                      "type": "Center",
                      "child": {
                        "type": "Text",
                        "data": "Ipsum",
                        "textAlign": "center",
                        "maxLines": 5,
                        "style": {"color": "#ffffff", "fontSize": 15.1}
                      }
                    },
                  }
                }
              }
            }
          ]
        }
      ]
    }
  }
};
