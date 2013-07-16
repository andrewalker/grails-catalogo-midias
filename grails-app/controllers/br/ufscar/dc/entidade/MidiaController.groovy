package br.ufscar.dc.entidade

import org.springframework.dao.DataIntegrityViolationException

class MidiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [midiaInstanceList: Midia.list(params), midiaInstanceTotal: Midia.count()]
    }

    def create() {
        [midiaInstance: new Midia(params)]
    }

    def save() {
        def midiaInstance = new Midia(params)
        if (!midiaInstance.save(flush: true)) {
            render(view: "create", model: [midiaInstance: midiaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'midia.label', default: 'Midia'), midiaInstance.id])
        redirect(action: "show", id: midiaInstance.id)
    }

    def show(Long id) {
        def midiaInstance = Midia.get(id)
        if (!midiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'midia.label', default: 'Midia'), id])
            redirect(action: "list")
            return
        }

        [midiaInstance: midiaInstance]
    }

    def edit(Long id) {
        def midiaInstance = Midia.get(id)
        if (!midiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'midia.label', default: 'Midia'), id])
            redirect(action: "list")
            return
        }

        [midiaInstance: midiaInstance]
    }

    def update(Long id, Long version) {
        def midiaInstance = Midia.get(id)
        if (!midiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'midia.label', default: 'Midia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (midiaInstance.version > version) {
                midiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'midia.label', default: 'Midia')] as Object[],
                          "Another user has updated this Midia while you were editing")
                render(view: "edit", model: [midiaInstance: midiaInstance])
                return
            }
        }

        midiaInstance.properties = params

        if (!midiaInstance.save(flush: true)) {
            render(view: "edit", model: [midiaInstance: midiaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'midia.label', default: 'Midia'), midiaInstance.id])
        redirect(action: "show", id: midiaInstance.id)
    }

    def delete(Long id) {
        def midiaInstance = Midia.get(id)
        if (!midiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'midia.label', default: 'Midia'), id])
            redirect(action: "list")
            return
        }

        try {
            midiaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'midia.label', default: 'Midia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'midia.label', default: 'Midia'), id])
            redirect(action: "show", id: id)
        }
    }
}
