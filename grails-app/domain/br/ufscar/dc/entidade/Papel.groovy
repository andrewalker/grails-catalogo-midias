package br.ufscar.dc.entidade

class Papel {

    belongsTo = Dvd

    String nome
    String ator

    static constraints = {
    }
}
