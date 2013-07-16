package br.ufscar.dc.entidade

class Dvd extends Midia {

    static hasMany = [ papeis: Papel ]

    String diretor

    static constraints = {
        diretor(blank:false)
    }

    String toString() {
        return "DVD - " + this.titulo
    }
}
