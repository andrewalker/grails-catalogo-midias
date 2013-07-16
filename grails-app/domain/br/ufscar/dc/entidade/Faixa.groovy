package br.ufscar.dc.entidade

class Faixa {

    static belongsTo = Cd

    String nome
    int duracao

    static constraints = {
        nome(blank: false)
        duracao(blank: false)
    }

    String toString() {
        return duracao + 's - ' + nome
    }
}
