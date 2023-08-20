package com.barberia.barberia.controlador;


import com.barberia.barberia.interfacesServicios.IServicesFactura;
import com.barberia.barberia.interfacesServicios.IServicesProducto;
import com.barberia.barberia.interfacesServicios.IServicesServicio;
import com.barberia.barberia.modelo.factura;
import com.barberia.barberia.modelo.producto;
import com.barberia.barberia.modelo.servicio;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping
public class ControladorFactura {
    @Autowired
    private IServicesFactura services;
    @Autowired
    private IServicesServicio servicesser;
    @Autowired
    private IServicesProducto servicespro;

    @GetMapping("/factura")
    public  String listar (Model model){
        List<factura> factura=services.listarfactura();
        model.addAttribute("factura",factura);
        return "factura";
    }

    @GetMapping("/nuevofactura")
    public String agregar(Model model){
        List<servicio> servicio = servicesser.listarservicio();
        model.addAttribute("servicio", servicio);
        List<producto> producto = servicespro.listarProducto();
        model.addAttribute("producto", producto);
        model.addAttribute("factura", new factura());
        return "moifactura";
    }

    @PostMapping("/guardarfactura")
    public String guardar(@Valid factura fac, Model model){
        services.save(fac);
        return "redirect:/factura";
    }

    @PostMapping("/editarfactura")
    public String editar(@PathVariable int id_factura, Model model){
        Optional<factura> factura=services.listarIdF(id_factura);
        model.addAttribute("factura",factura);
        return "moifactura";
    }
}
