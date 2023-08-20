package com.barberia.barberia.controlador;

import com.barberia.barberia.interfacesServicios.IServicesEmpleado;
import com.barberia.barberia.interfacesServicios.IServicesProducto;
import com.barberia.barberia.interfacesServicios.IServicesRegistro;
import com.barberia.barberia.interfacesServicios.IServicetipoProducto;
import com.barberia.barberia.modelo.empleado;
import com.barberia.barberia.modelo.producto;
import com.barberia.barberia.modelo.proveedor;
import com.barberia.barberia.modelo.registro;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping
public class ControladorRegistro {
    @Autowired
    private IServicesRegistro services;
    @Autowired
    private IServicesProducto servicespro;
    @Autowired
    private IServicesEmpleado servicesemp;

    @GetMapping ("/registro")
    public String listar (Model model){
        List<registro> registro= services.listarregistro();
        model.addAttribute("registro",registro);
        return "registro";
    }
    @GetMapping("/nuevoregis")
    public String agregar(Model model){
        model.addAttribute("registro", new registro());
        List<producto> producto = servicespro.listarProducto();
        model.addAttribute("producto", producto);
        List<empleado> empleado = servicesemp.listar();
        model.addAttribute("empleado",empleado);
        return "moiregistro";
    }
    @PostMapping("/guardarregis")
    public String guardar(@Valid registro reg, Model model){
        services.save(reg);
        return "redirect:/registro";
    }
    @PutMapping("/editarres")
    public String editar(@PathVariable int idReg, Model model){
        Optional<registro> registros =services.listarIdR(idReg);
        model.addAttribute("registro",registros);
        return "moiregistro";
    }
}
