/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.io.Serializable;
import model.pojo.Laptop;

/**
 *
 * @author THANHTUNG
 */
public class LaptopDAO extends ObjectDAO<Laptop, String> {

    @Override
    protected Class getPOJOClass() {
        return Laptop.class;
    }
    
}
