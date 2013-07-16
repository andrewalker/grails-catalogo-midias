package br.ufscar.dc.entidade

class Papel {

    static belongsTo = Dvd

    String nome
    String ator

    static constraints = {
    }
}
