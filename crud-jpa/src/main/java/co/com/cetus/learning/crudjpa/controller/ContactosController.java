package co.com.cetus.learning.crudjpa.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;

import co.com.cetus.learning.crudjpa.domain.Contacto;
import co.com.cetus.learning.crudjpa.service.AgendaService;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
@CrossOrigin("*")
@Slf4j
public class ContactosController {

    // @Value("${SPRING_URL}")
    // String SPRING_URL;
    // @Value("${SPRING_PORT}")
    // String SPRING_PORT;
    // @Value("${SPRING_USER}")
    // String SPRING_USER;
    // @Value("${SPRING_PASSWORD}")
    // String SPRING_PASSWORD;
    @Value("${spring.datasource.url}")
    String absoluteUrl;

    @Value("${spring.datasource.username}")
    String usernameConnection;
    @Value("${spring.datasource.password}")
    String passwordConnection;

    @Autowired
    private AgendaService service;

    @GetMapping(value = "contactos", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Contacto> getAllContacts() {
        log.info("Llegue a recuperar");
        return service.recuperar();
    }

    @GetMapping(value = "contactos/{idContacto}")
    public Contacto getSingleContact(@PathVariable("idContacto") int idContacto) {
        return service.buscarContacto(idContacto);
    }

    @PostMapping(value = "contactos", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public Contacto createContact(@RequestBody Contacto contacto) {
        if (service.agregarContacto(contacto)) {
            log.info("Entró a crear usuario");
            return service.buscarContacto(contacto.getIdContacto());
        }
        return null;
    }

    @PutMapping(value = "contactos", consumes = MediaType.APPLICATION_JSON_VALUE)
    public int actualizarContacto(@RequestBody Contacto contacto) {
        service.actualizar(contacto);
        if (service.buscarContacto(contacto.getIdContacto()) != null)
            return 1;
        return 0;
    }

    @DeleteMapping(value = "contactos/{idContacto}")
    public int deleteContacto(@PathVariable("idContacto") int idContacto) {
        service.eliminarContacto(idContacto);
        if (service.buscarContacto(idContacto) == null)
            return 1;
        return 0;
    }

    @GetMapping(value = "/info", produces = MediaType.TEXT_PLAIN_VALUE)
    public String returnsInfo() {
        return String.format("absoluteUrl=%s",
                this.absoluteUrl).concat("\n Username: ").concat(this.usernameConnection).concat("\n Password: ")
                .concat(this.passwordConnection);
    }

}
