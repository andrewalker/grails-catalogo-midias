package br.ufscar.dc.entidade



import org.junit.*
import grails.test.mixin.*

@TestFor(FaixaController)
@Mock(Faixa)
class FaixaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/faixa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.faixaInstanceList.size() == 0
        assert model.faixaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.faixaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.faixaInstance != null
        assert view == '/faixa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/faixa/show/1'
        assert controller.flash.message != null
        assert Faixa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/faixa/list'

        populateValidParams(params)
        def faixa = new Faixa(params)

        assert faixa.save() != null

        params.id = faixa.id

        def model = controller.show()

        assert model.faixaInstance == faixa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/faixa/list'

        populateValidParams(params)
        def faixa = new Faixa(params)

        assert faixa.save() != null

        params.id = faixa.id

        def model = controller.edit()

        assert model.faixaInstance == faixa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/faixa/list'

        response.reset()

        populateValidParams(params)
        def faixa = new Faixa(params)

        assert faixa.save() != null

        // test invalid parameters in update
        params.id = faixa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/faixa/edit"
        assert model.faixaInstance != null

        faixa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/faixa/show/$faixa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        faixa.clearErrors()

        populateValidParams(params)
        params.id = faixa.id
        params.version = -1
        controller.update()

        assert view == "/faixa/edit"
        assert model.faixaInstance != null
        assert model.faixaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/faixa/list'

        response.reset()

        populateValidParams(params)
        def faixa = new Faixa(params)

        assert faixa.save() != null
        assert Faixa.count() == 1

        params.id = faixa.id

        controller.delete()

        assert Faixa.count() == 0
        assert Faixa.get(faixa.id) == null
        assert response.redirectedUrl == '/faixa/list'
    }
}
