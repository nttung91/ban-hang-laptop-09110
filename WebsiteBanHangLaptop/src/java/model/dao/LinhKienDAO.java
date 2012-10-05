/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.io.Serializable;
import model.pojo.LinhKien;

/**
 *
 * @author THANHTUNG
 */
public class LinhKienDAO  extends ObjectDAO<LinhKien, String> {
     @Override
    protected Class getPOJOClass() {
        return LinhKien.class;
    }
    
}
