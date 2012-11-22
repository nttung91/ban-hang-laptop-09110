/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.pojo.TinhTrangSanPham;

/**
 *
 * @author MRKYT
 */
public class TinhTrangSanPhamDAO extends ObjectDAO<TinhTrangSanPham, Integer> {

    @Override
    protected Class getPOJOClass() {
        return TinhTrangSanPham.class;
    }
    
}
