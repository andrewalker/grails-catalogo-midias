package br.ufscar.dc.entidade

class Jogo {

    String genero

    static constraints = {
        genero(blank: false)
    }

    String toString() {
        return "Jogo - " + this.titulo
    }
}
