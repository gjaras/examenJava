/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJOS.Postulante;
import POJOS.Usuario;
import Util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class usuarioDAO {

//GET
    public boolean getUsuario(Usuario usuario){
        Transaction tx =null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        tx= s.beginTransaction();
        Query q = s.createQuery("from Usuario where usuarioNombre='"+usuario.getUsuarioNombre()+"' and usuarioPass='"+usuario.getUsuarioPass()+"'");
        Usuario retorno = (Usuario)q.uniqueResult();
        s.flush();
        s.close();
        if (retorno ==null) {
            return false;    
        }else{
            return true;
        }
        
    }



    
}

