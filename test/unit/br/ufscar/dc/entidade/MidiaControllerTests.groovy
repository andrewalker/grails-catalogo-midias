package br.ufscar.dc.entidade



import org.junit.*
import grails.test.mixin.*

@TestFor(MidiaController)
@Mock(Midia)
class MidiaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/midia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.midiaInstanceList.size() == 0
        assert model.midiaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.midiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.midiaInstance != null
        assert view == '/midia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/midia/show/1'
        assert controller.flash.message != null
        assert Midia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/midia/list'

        populateValidParams(params)
        def midia = new Midia(params)

        assert midia.save() != null

        params.id = midia.id

        def model = controller.show()

        assert model.midiaInstance == midia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/midia/list'

        populateValidParams(params)
        def midia = new Midia(params)

        assert midia.save() != null

        params.id = midia.id

        def model = controller.edit()

        assert model.midiaInstance == midia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/midia/list'

        response.reset()

        populateValidParams(params)
        def midia = new Midia(params)

        assert midia.save() != null

        // test invalid parameters in update
        params.id = midia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/midia/edit"
        assert model.midiaInstance != null

        midia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/midia/show/$midia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        midia.clearErrors()

        populateValidParams(params)
        params.id = midia.id
        params.version = -1
        controller.update()

        assert view == "/midia/edit"
        assert model.midiaInstance != null
        assert model.midiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/midia/list'

        response.reset()

        populateValidParams(params)
        def midia = new Midia(params)

        assert midia.save() != null
        assert Midia.count() == 1

        params.id = midia.id

        controller.delete()

        assert Midia.count() == 0
        assert Midia.get(midia.id) == null
        assert response.redirectedUrl == '/midia/list'
    }
}
