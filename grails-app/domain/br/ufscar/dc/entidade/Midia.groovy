package br.ufscar.dc.entidade

class Midia {

    static belongsTo = Usuario

    String titulo
    int ano

    static constraints = {
        titulo(blank: false)
        ano(range: 1900..2100)
    }
}
