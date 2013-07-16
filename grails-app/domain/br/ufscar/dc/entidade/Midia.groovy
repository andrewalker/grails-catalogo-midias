package br.ufscar.dc.entidade

class Midia {

    static belongsTo = Usuario

    String titulo
    int ano

    static constraints = {
    }
}
