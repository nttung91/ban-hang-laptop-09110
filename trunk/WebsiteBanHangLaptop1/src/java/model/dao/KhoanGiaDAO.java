/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.io.Serializable;
import model.pojo.KhoanGia;

/**
 *
 * @author MRKYT
 */
public class KhoanGiaDAO extends ObjectDAO<KhoanGia, String> {

    @Override
    protected Class getPOJOClass() {
        return KhoanGia.class;
    }
    
    
}
