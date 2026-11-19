package br.com.vias.config;

import io.swagger.v3.oas.annotations.Hidden;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

/** A raiz do deploy abre direto a documentacao Swagger. */
@Hidden
@RestController
public class RaizController {

    @GetMapping("/")
    public RedirectView raiz() {
        return new RedirectView("/swagger-ui.html");
    }
}
