/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import DAO.usuarioDAO;
import POJOS.Usuario;
import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author tetsu
 */
@Named(value="loginBean")
@SessionScoped

public class loginBean implements Serializable{
    private String nombre ;
    private String password;

    public String Login(){
        Usuario usu = new Usuario(getNombre(),getPassword());
        usuarioDAO dausu= new usuarioDAO();
        if(dausu.getUsuario(usu)){
            return "inicio";
        }else{
            return "login";
        }
        
    }
 
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
    
    
}
