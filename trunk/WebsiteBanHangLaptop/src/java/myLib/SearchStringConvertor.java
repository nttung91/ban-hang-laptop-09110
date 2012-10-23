/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myLib;

import java.util.ArrayList;
import java.util.List;
import model.dao.HangSanXuatDAO;
import model.dao.SanPhamDAO;
import model.pojo.HangSanXuat;
import model.pojo.SanPham;

/**
 *
 * @author MRKYT
 */
public class SearchStringConvertor {
    // output = (LoaiSP , Hãng , TenSP)

    public static List<String> GetClear(String timkiem)//("Texttimkiem , MaHang") 
    {

        String LoaiSp = " ";
        String Hang = " ";
        String TenSp = " ";
        List<String> list = new ArrayList<String>();

        String[] arr = timkiem.split(",");
        HangSanXuatDAO hsxDAO = new HangSanXuatDAO();
        List<HangSanXuat> listhsx = hsxDAO.getList();
        if (arr.length!=0) {
            //Xu Ly arr[0] (tensp)
            if (!arr[0].equals("")) {
                String mem1 = arr[0];
                mem1 = mem1.trim();
                boolean check = false;
                if (!mem1.equals("")) {
                    String[] arrMem1 = mem1.split(" ");
                    for (int i = 0; i < arrMem1.length; i++) {
                        check = false;
                        for (int j = 0; j < listhsx.size(); j++) {
                            HangSanXuat sp = listhsx.get(j);
                            if (arrMem1[i].trim().toLowerCase().equals(sp.getTenHang().toLowerCase())) {
                                Hang = sp.getMaHang();
                                check = true;
                                break;
                            }
                        }
                        if (check) {
                            continue;
                        }
                        if (arrMem1[i].toLowerCase().trim().equals("laptop") || arrMem1[i].toLowerCase().trim().equals("linhkien")) {
                            LoaiSp = arrMem1[i].toLowerCase().trim();
                            continue;
                        }
                        TenSp += arrMem1[i] + " ";
                    }


                }
                TenSp = TenSp.trim();
            }
            ////////////////


            //Xu Ly arr[1](Mã Hãng San Xuat)
            if (arr.length>1)
            if (!arr[1].equals("")) {
                if (Hang.equals(" ")) {
                    Hang = arr[1];
                }
            }
        }
            list.add(LoaiSp);
            list.add(Hang);
            list.add(TenSp);
            return list;
        
        
    }
}
