package br.ufscar.dc.entidade

class Faixa {

    belongsTo = Cd

    String nome
    int duracao

    static constraints = {
    }
}
