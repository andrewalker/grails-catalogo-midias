package br.ufscar.dc.entidade

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class MidiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
    }

    def searchAJAX() {
        def midias = Midia.findAllByTituloLike("%${params.query}%")

        render(contentType: "text/xml") {
            results() {
                midias.each { midia->
                    result () {
                        name(midia.titulo)
                        id(midia.id)
                    }
                }
            }
        }
    }

    def show(Long id) {
        def midiaInstance = Midia.get(id)
        if (!midiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'midia.label', default: 'Midia'), id])
            redirect(action: "list")
            return
        }

        def classe = midiaInstance.getClass().getSimpleName()

        if (classe == "Dvd") {
            redirect controller: 'dvd', action: 'show', params: [ id: id ]
            return
        }

        if (classe == "Cd") {
            redirect controller: 'cd', action: 'show', params: [ id: id ]
            return
        }

        if (classe == "Jogo") {
            redirect controller: 'jogo', action: 'show', params: [ id: id ]
            return
        }

        [midiaInstance: midiaInstance]
    }

}
