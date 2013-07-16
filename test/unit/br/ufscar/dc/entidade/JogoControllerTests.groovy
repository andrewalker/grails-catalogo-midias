package br.ufscar.dc.entidade



import org.junit.*
import grails.test.mixin.*

@TestFor(JogoController)
@Mock(Jogo)
class JogoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/jogo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.jogoInstanceList.size() == 0
        assert model.jogoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.jogoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.jogoInstance != null
        assert view == '/jogo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/jogo/show/1'
        assert controller.flash.message != null
        assert Jogo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/jogo/list'

        populateValidParams(params)
        def jogo = new Jogo(params)

        assert jogo.save() != null

        params.id = jogo.id

        def model = controller.show()

        assert model.jogoInstance == jogo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/jogo/list'

        populateValidParams(params)
        def jogo = new Jogo(params)

        assert jogo.save() != null

        params.id = jogo.id

        def model = controller.edit()

        assert model.jogoInstance == jogo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/jogo/list'

        response.reset()

        populateValidParams(params)
        def jogo = new Jogo(params)

        assert jogo.save() != null

        // test invalid parameters in update
        params.id = jogo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/jogo/edit"
        assert model.jogoInstance != null

        jogo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/jogo/show/$jogo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        jogo.clearErrors()

        populateValidParams(params)
        params.id = jogo.id
        params.version = -1
        controller.update()

        assert view == "/jogo/edit"
        assert model.jogoInstance != null
        assert model.jogoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/jogo/list'

        response.reset()

        populateValidParams(params)
        def jogo = new Jogo(params)

        assert jogo.save() != null
        assert Jogo.count() == 1

        params.id = jogo.id

        controller.delete()

        assert Jogo.count() == 0
        assert Jogo.get(jogo.id) == null
        assert response.redirectedUrl == '/jogo/list'
    }
}
