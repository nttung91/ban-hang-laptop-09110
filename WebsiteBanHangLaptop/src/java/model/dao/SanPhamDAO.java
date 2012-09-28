/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.pojo.SanPham;

/**
 *
 * @author THANHTUNG
 */
public class SanPhamDAO extends ObjectDAO<SanPham, String> {

    @Override
    protected Class getPOJOClass() {
        return SanPham.class;
    }
    
}
