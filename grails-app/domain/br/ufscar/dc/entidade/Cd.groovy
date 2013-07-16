package br.ufscar.dc.entidade

class Cd extends Midia {

    static hasMany = [ faixas: Faixa ]

    String artista

    static constraints = {
        artista(blank:false)
    }
}
