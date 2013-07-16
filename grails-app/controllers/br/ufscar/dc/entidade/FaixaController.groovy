package br.ufscar.dc.entidade

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class FaixaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [faixaInstanceList: Faixa.list(params), faixaInstanceTotal: Faixa.count()]
    }

    def create() {
        [faixaInstance: new Faixa(params)]
    }

    def save() {
        def faixaInstance = new Faixa(params)
        if (!faixaInstance.save(flush: true)) {
            render(view: "create", model: [faixaInstance: faixaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'faixa.label', default: 'Faixa'), faixaInstance.id])
        redirect(action: "show", id: faixaInstance.id)
    }

    def show(Long id) {
        def faixaInstance = Faixa.get(id)
        if (!faixaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'faixa.label', default: 'Faixa'), id])
            redirect(action: "list")
            return
        }

        [faixaInstance: faixaInstance]
    }

    def edit(Long id) {
        def faixaInstance = Faixa.get(id)
        if (!faixaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'faixa.label', default: 'Faixa'), id])
            redirect(action: "list")
            return
        }

        [faixaInstance: faixaInstance]
    }

    def update(Long id, Long version) {
        def faixaInstance = Faixa.get(id)
        if (!faixaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'faixa.label', default: 'Faixa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (faixaInstance.version > version) {
                faixaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'faixa.label', default: 'Faixa')] as Object[],
                          "Another user has updated this Faixa while you were editing")
                render(view: "edit", model: [faixaInstance: faixaInstance])
                return
            }
        }

        faixaInstance.properties = params

        if (!faixaInstance.save(flush: true)) {
            render(view: "edit", model: [faixaInstance: faixaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'faixa.label', default: 'Faixa'), faixaInstance.id])
        redirect(action: "show", id: faixaInstance.id)
    }

    def delete(Long id) {
        def faixaInstance = Faixa.get(id)
        if (!faixaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'faixa.label', default: 'Faixa'), id])
            redirect(action: "list")
            return
        }

        try {
            faixaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'faixa.label', default: 'Faixa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'faixa.label', default: 'Faixa'), id])
            redirect(action: "show", id: id)
        }
    }
}
