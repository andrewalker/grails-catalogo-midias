import br.ufscar.dc.entidade.*
import grails.plugins.springsecurity.*

class BootStrap {

    def init = { servletContext ->
        def usuarioPapel = PapelSec.findByAuthority("ROLE_USER") ?:
        new PapelSec(authority: "ROLE_USER", name: "Usuario").save()

        def adminPapel = PapelSec.findByAuthority("ROLE_ADMIN") ?:
        new PapelSec(authority: "ROLE_ADMIN", name: "Administrador").save()

        if (Usuario.findAll().isEmpty()) {
            println "populando usuarios"

            // criação do administrador
            def admin = new Usuario(
                username: "admin",
                password: "admin",
                nome: "Administrador",
                enabled: true
            )
            admin.save()

            if (admin.hasErrors()) {
                println admin.errors
            }

            UsuarioSecPapelSec.create(admin, adminPapel)

            // criação do usuário comum
            def maria = new Usuario(
                username: "maria",
                password: "maria",
                nome: "Maria",
                enabled: true
            )
            maria.save()

            if (maria.hasErrors()) {
                println maria.errors
            }

            UsuarioSecPapelSec.create(maria, usuarioPapel)

            // create dvd

            def tonto = new Papel(
                nome: "Tonto",
                ator: "Johnny Depp"
            )
            tonto.save()

            def reid = new Papel(
                nome: "John Reid",
                ator: "Armie Hammer"
            )
            reid.save()

            def mydvd = new Dvd(
                titulo: "The Lone Ranger",
                ano: 2013,
                diretor: "Gore Verbinski"
            )
            mydvd.save()

            mydvd.addToPapeis(tonto)
            mydvd.addToPapeis(reid)

        }
    }
    def destroy = {
    }
}
