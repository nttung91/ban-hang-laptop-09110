/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.io.Serializable;
import model.pojo.HangSanXuat;

/**
 *
 * @author MRKYT
 */
public class HangSanXuatDAO extends ObjectDAO<HangSanXuat, String> {

    @Override
    protected Class getPOJOClass() {
        return HangSanXuat.class;
    }
    
}
