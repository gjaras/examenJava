/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import DAO.postulacionDAO;
import POJOS.Comuna;
import POJOS.Educacione;
import POJOS.Estadocivil;
import POJOS.Postulante;
import POJOS.Usuario;
import POJOS.Venta;

import Util.HibernateUtil;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.faces.model.SelectItem;
import javax.inject.Named;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

@Named(value="postulacionBean")
@SessionScoped
public class postulacionBean implements Serializable{

     private String postulanteRut;
     private Comuna comuna;
     private Educacione educacione;
     private Estadocivil estadocivil;
     private Venta venta;
     private String postulanteNombre;
     private String postulanteApepa;
     private String postulanteApema;
     private Date postulanteFecnac;
     private char postulanteSexo;
     private int postulanteHijos;
     private int postulanteTelefono;
     private String postulanteEmail;
     private String postulanteDireccion;
     private int postulanteSueldo;
     private char postulanteEnfermedad;

     private String postulanteRut1;
     private String postulanteRut2;
    //Agregar Postulante
    public String addPostulante() throws ParseException{
        Postulante p = new Postulante (getPostulanteRutT(),getComuna(),getEducacione(),getEstadocivil(),getVenta(),getPostulanteNombre(),getPostulanteApepa(),getPostulanteApema(),getPostulanteFecnac(),getPostulanteSexo(),getPostulanteHijos(),getPostulanteTelefono(),getPostulanteEmail(),getPostulanteDireccion(),getPostulanteSueldo(),getPostulanteEnfermedad());
        postulacionDAO pd = new postulacionDAO();
        pd.addPostulante(p);
        
        return "ListPostulante";
    }
    //Update Postulante
    public void updatePostulante() throws ParseException {
        Postulante p = new Postulante (getPostulanteRutT(),getComuna(),getEducacione(),getEstadocivil(),getVenta(),getPostulanteNombre(),getPostulanteApepa(),getPostulanteApema(),getPostulanteFecnac(),getPostulanteSexo(),getPostulanteHijos(),getPostulanteTelefono(),getPostulanteEmail(),getPostulanteDireccion(),getPostulanteSueldo(),getPostulanteEnfermedad());
        postulacionDAO pd = new postulacionDAO();
        pd.updatePostulante(p);
    }
////GET
    
    public String getPostulanteNombre(String rutPostulante){
        postulacionDAO pd = new postulacionDAO();
        Postulante pos = pd.getPostulante(rutPostulante);
        return pos.getPostulanteNombre();
    } 
//LISTAR
    public SelectItem[] listPostulante(){
        postulacionDAO pt = new postulacionDAO();
        List<Postulante> ptl = pt.listPostulante();
        SelectItem[] ret = new SelectItem[ptl.size()];
        int index = 0;
        for(Postulante p : ptl){
            SelectItem agregar = new SelectItem();
            String json = "{\"postulante_rut\":\""+p.getPostulanteRut()+"\",\"postulante_nombre\":\""+p.getPostulanteNombre()+"\",\"postulante_apepa\":\""+p.getPostulanteApepa()+"\",\"postulante_apema\":\""+p.getPostulanteApema()+"\",\"postulante_fecnac\":\""+p.getPostulanteFecnac()+"\",\"postulante_sexo\":\""+p.getPostulanteSexo()+"\",\"postulante_hijos\":\""+p.getPostulanteHijos()+"\",\"postulante_telefono\":\""+p.getPostulanteTelefono()+"\",\"postulante_email\":\""+p.getPostulanteEmail()+"\",\"postulante_direccion\":\""+p.getPostulanteDireccion()+"\",\"postulante_sueldo\":\""+p.getPostulanteSueldo()+"\",\"postulante_enfermedad\":\""+p.getPostulanteEnfermedad()+"\",\"educacione_educacione_id\":\""+p.getEducacione()+"\",\"estadocivil_estadocivil_id\":\""+p.getEstadocivil()+"\",\"comuna_comuna_id\":\""+p.getComuna()+"\",\"venta_venta_id\":\""+p.getVenta()+"\"}";
            agregar.setValue(json);
            agregar.setLabel(p.getPostulanteNombre());
            ret[index] = agregar;
            index++;
        }
        
        return ret;
    }
    
    //LISTAR
    public SelectItem[] listComuna(){
        postulacionDAO pt = new postulacionDAO();
        List<Comuna> ptl = pt.listComuna();
        SelectItem[] ret = new SelectItem[ptl.size()];
        int index = 0;
        for(Comuna p : ptl){
            SelectItem agregar = new SelectItem();
            String json = "{\"comuna_id\":\""+p.getComunaId()+"\",\"comuna_nombre\":\""+p.getComunaNombre()+"\"}";
            agregar.setValue(json);
            agregar.setLabel(p.getComunaNombre());
            ret[index] = agregar;
            index++;
        }
        
        return ret;
    }
    //LISTAR
    public SelectItem[] listEducacione(){
        postulacionDAO pt = new postulacionDAO();
        List<Educacione> ptl = pt.listEducacione();
        SelectItem[] ret = new SelectItem[ptl.size()];
        int index = 0;
        for(Educacione p : ptl){
            SelectItem agregar = new SelectItem();
            String json = "{\"educacione_id\":\""+p.getEducacioneId()+"\",\"educacione_nombre\":\""+p.getEducacioneTipo()+"\"}";
            agregar.setValue(json);
            agregar.setLabel(p.getEducacioneTipo());
            ret[index] = agregar;
            index++;
        }
        return ret;
    }
     //LISTAR
    public SelectItem[] listEstadoCivil(){
        postulacionDAO pt = new postulacionDAO();
        List<Estadocivil> ptl = pt.listEstadocivil();
        SelectItem[] ret = new SelectItem[ptl.size()];
        int index = 0;
        for(Estadocivil p : ptl){
            SelectItem agregar = new SelectItem();
            String json = "{\"estadocivil_id\":\""+p.getEstadocivilId()+"\",\"estadocivil_tipo\":\""+p.getEstadocivilTipo()+"\"}";
            agregar.setValue(json);
            agregar.setLabel(p.getEstadocivilTipo());
            ret[index] = agregar;
            index++;
        }
        return ret;
    }
    public SelectItem[] listVenta(){
        postulacionDAO pt = new postulacionDAO();
        List<Venta> ptl = pt.listVenta();
        SelectItem[] ret = new SelectItem[ptl.size()];
        int index = 0;
        for(Venta p : ptl){
            SelectItem agregar = new SelectItem();
            String json = "{\"venta_id\":\""+p.getVentaId()+"\",\"venta_tipo\":\""+p.getVentaTipo()+"\"}";
            agregar.setValue(json);
            agregar.setLabel(p.getVentaTipo());
            ret[index] = agregar;
            index++;
        }
        return ret;
    }
    
    
    
    public List listPostulantes(){
        postulacionDAO pt = new postulacionDAO();
        List<Postulante> ptl = pt.listPostulante();
        return ptl;
    }
////ELIMINAR
//    public void deleteProducto(Producto producto){
//        Producto p = new Producto(getIdProducto());
//        ProductoDAO pd = new ProductoDAO();
//        pd.deleteProducto(p);
//    }

  
    public String getPostulanteRutT() {
        return this.postulanteRut;
    }
    
    public void setPostulanteRutT(String postulanteRut1,String postulanteRut2) {
        this.postulanteRut = postulanteRut1+"-"+postulanteRut2;
    }
    
    public String getPostulanteRut1() {
        return this.postulanteRut1;
    }
    
    public void setPostulanteRut1(String postulanteRut1) {
        this.postulanteRut1 = postulanteRut1;
    }
    public String getPostulanteRut2() {
        return this.postulanteRut2;
    }
    
    public void setPostulanteRut2(String postulanteRut2) {
        this.postulanteRut2 = postulanteRut2;
    }
    public Comuna getComuna() {
        return this.comuna;
    }
    
    public void setComuna(Comuna comuna) {
        this.comuna = comuna;
    }
    public Educacione getEducacione() {
        return this.educacione;
    }
    
    public void setEducacione(Educacione educacione) {
        this.educacione = educacione;
    }
    public Estadocivil getEstadocivil() {
        return this.estadocivil;
    }
    
    public void setEstadocivil(Estadocivil estadocivil) {
        this.estadocivil = estadocivil;
    }
    public Venta getVenta() {
        return this.venta;
    }
    
    public void setVenta(Venta venta) {
        this.venta = venta;
    }
    public String getPostulanteNombre() {
        return this.postulanteNombre;
    }
    
    public void setPostulanteNombre(String postulanteNombre) {
        this.postulanteNombre = postulanteNombre;
    }
    public String getPostulanteApepa() {
        return this.postulanteApepa;
    }
    
    public void setPostulanteApepa(String postulanteApepa) {
        this.postulanteApepa = postulanteApepa;
    }
    public String getPostulanteApema() {
        return this.postulanteApema;
    }
    
    public void setPostulanteApema(String postulanteApema) {
        this.postulanteApema = postulanteApema;
    }
    public Date getPostulanteFecnac() {
        return this.postulanteFecnac;
    }
    
    public void setPostulanteFecnac(Date postulanteFecnac) {
        this.postulanteFecnac = postulanteFecnac;
    }
    public char getPostulanteSexo() {
        return this.postulanteSexo;
    }
    
    public void setPostulanteSexo(char postulanteSexo) {
        this.postulanteSexo = postulanteSexo;
    }
    public int getPostulanteHijos() {
        return this.postulanteHijos;
    }
    
    public void setPostulanteHijos(int postulanteHijos) {
        this.postulanteHijos = postulanteHijos;
    }
    public int getPostulanteTelefono() {
        return this.postulanteTelefono;
    }
    
    public void setPostulanteTelefono(int postulanteTelefono) {
        this.postulanteTelefono = postulanteTelefono;
    }
    public String getPostulanteEmail() {
        return this.postulanteEmail;
    }
    
    public void setPostulanteEmail(String postulanteEmail) {
        this.postulanteEmail = postulanteEmail;
    }
    public String getPostulanteDireccion() {
        return this.postulanteDireccion;
    }
    
    public void setPostulanteDireccion(String postulanteDireccion) {
        this.postulanteDireccion = postulanteDireccion;
    }
    public int getPostulanteSueldo() {
        return this.postulanteSueldo;
    }
    
    public void setPostulanteSueldo(int postulanteSueldo) {
        this.postulanteSueldo = postulanteSueldo;
    }
    public char getPostulanteEnfermedad() {
        return this.postulanteEnfermedad;
    }
    
    public void setPostulanteEnfermedad(char postulanteEnfermedad) {
        this.postulanteEnfermedad = postulanteEnfermedad;
    }

     


    
}
