package br.ufscar.dc.entidade

class Usuario extends UsuarioSec {

    static hasMany = [ midias: Midia ]

    String nome

    static constraints = {
        nome blank: false
    }
}
