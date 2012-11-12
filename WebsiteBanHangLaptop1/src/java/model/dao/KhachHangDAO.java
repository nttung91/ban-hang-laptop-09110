/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.pojo.KhachHang;

/**
 *
 * @author THANHTUNG
 */
public class KhachHangDAO extends ObjectDAO<KhachHang, String> {

    @Override
    protected Class getPOJOClass() {
        return KhachHang.class;
    }
    
}
