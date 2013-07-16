package br.ufscar.dc.entidade

class Faixa {

    static belongsTo = Cd

    String nome
    int duracao

    static constraints = {
    }
}
