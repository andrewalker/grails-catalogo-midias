package br.ufscar.dc.entidade

import org.springframework.dao.DataIntegrityViolationException

class JogoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [jogoInstanceList: Jogo.list(params), jogoInstanceTotal: Jogo.count()]
    }

    def create() {
        [jogoInstance: new Jogo(params)]
    }

    def save() {
        def jogoInstance = new Jogo(params)
        if (!jogoInstance.save(flush: true)) {
            render(view: "create", model: [jogoInstance: jogoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'jogo.label', default: 'Jogo'), jogoInstance.id])
        redirect(action: "show", id: jogoInstance.id)
    }

    def show(Long id) {
        def jogoInstance = Jogo.get(id)
        if (!jogoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jogo.label', default: 'Jogo'), id])
            redirect(action: "list")
            return
        }

        [jogoInstance: jogoInstance]
    }

    def edit(Long id) {
        def jogoInstance = Jogo.get(id)
        if (!jogoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jogo.label', default: 'Jogo'), id])
            redirect(action: "list")
            return
        }

        [jogoInstance: jogoInstance]
    }

    def update(Long id, Long version) {
        def jogoInstance = Jogo.get(id)
        if (!jogoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jogo.label', default: 'Jogo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (jogoInstance.version > version) {
                jogoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'jogo.label', default: 'Jogo')] as Object[],
                          "Another user has updated this Jogo while you were editing")
                render(view: "edit", model: [jogoInstance: jogoInstance])
                return
            }
        }

        jogoInstance.properties = params

        if (!jogoInstance.save(flush: true)) {
            render(view: "edit", model: [jogoInstance: jogoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'jogo.label', default: 'Jogo'), jogoInstance.id])
        redirect(action: "show", id: jogoInstance.id)
    }

    def delete(Long id) {
        def jogoInstance = Jogo.get(id)
        if (!jogoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jogo.label', default: 'Jogo'), id])
            redirect(action: "list")
            return
        }

        try {
            jogoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'jogo.label', default: 'Jogo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'jogo.label', default: 'Jogo'), id])
            redirect(action: "show", id: id)
        }
    }
}
