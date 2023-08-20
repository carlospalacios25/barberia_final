package com.barberia.barberia.controlador;

import com.barberia.barberia.interfacesServicios.IServicesCliente;
import com.barberia.barberia.interfacesServicios.IServicesCortes;
import com.barberia.barberia.interfacesServicios.IServicesEmpleado;
import com.barberia.barberia.interfacesServicios.IServicesServicio;
import com.barberia.barberia.modelo.*;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping
public class ControladorServicio {
    @Autowired
    private IServicesServicio services;
    @Autowired
    private IServicesCliente servicescli;
    @Autowired
    private IServicesCortes servicesCortes;
    @Autowired
    private IServicesEmpleado servicesEmpleado;

    @GetMapping("/servicio")
    public String listar (Model model){
        List<servicio> servicio = services.listarservicio();
        model.addAttribute("servicio", servicio);
        return "servicio";
    }

    @GetMapping("/nuevoservi")
    public String agregar(Model model){
        List<clientes> cliente = servicescli.listarcliente();
        model.addAttribute("clientes",cliente);
        List<cortes> cortes=servicesCortes.listar();
        model.addAttribute("cortes",cortes);
        List<empleado> empleado=servicesEmpleado.listar();
        model.addAttribute("empleado",empleado);
        model.addAttribute("servicio", new servicio());
        return "moiservicio";
    }

    @PostMapping("/guardarservi")
    public String guardar(@Valid servicio servi, Model model){
        services.save(servi);
        return "redirect:/servicio";
    }

    @GetMapping("/editarservi/{idSer}")
    public String editar(@PathVariable int idSer, Model model){
        Optional<servicio> servicio=services.listaridS(idSer);
        model.addAttribute("servicio",servicio);
        return "servicio";
    }
}
