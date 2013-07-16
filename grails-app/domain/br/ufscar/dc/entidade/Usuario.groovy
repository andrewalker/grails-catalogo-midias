package br.ufscar.dc.entidade

class Usuario {

    static hasMany = [ midias: Midia ]

    String nome
    String login
    String senha

    static constraints = {
    }
}
