package br.ufscar.dc.entidade

class Papel {

    static belongsTo = [ dvd: Dvd ]

    String nome
    String ator

    static constraints = {
        nome(blank: false)
        ator(blank: false)
    }

    String toString() {
        return nome + ' (' + ator + ')'
    }
}
