/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CreateSanPhamByCode;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import model.dao.HangSanXuatDAO;
import model.dao.SanPhamDAO;
import model.dao.TinhTrangSanPhamDAO;
import model.pojo.HangSanXuat;
import model.pojo.Laptop;
import model.pojo.LinhKien;
import model.pojo.SanPham;
import model.pojo.TinhTrangSanPham;
import myLib.StringConverter;

/**
 *
 * @author MRKYT
 */
public class CreateSanPham {

    SanPhamDAO spd = new SanPhamDAO();

    public String nextSPID() {


        List<SanPham> arr = spd.getList();
        String svb = arr.get(0).getMaSanPham().trim();

        for (int i = 0; i < arr.size(); i++) {
            SanPham sd = arr.get(i);
            if (sd.getMaSanPham().trim().length() >= svb.length()) {
                svb = sd.getMaSanPham().trim();

            }

        }
        //return arr.get(0).getMaSanPham();
        // return String.valueOf(a);
        //return String.valueOf(arr.size());
        return StringConverter.nextid(svb, "SP");
    }
    Read_DirectoryOfImage rd_laptop = new Read_DirectoryOfImage("E:/WEBthayNhanh/trunk/WebsiteBanHangLaptop1/web/imageSanPham/Laptop");
    //Read_DirectoryOfImage rd = new Read_DirectoryOfImage("C:/Users/THANHTUNG/Documents/NetBeansProjects/CNPMM/WebsiteBanHangLaptop1/web");
    List<String> HinhAnh_Ten_lap = rd_laptop.getListOfName();
    
     Read_DirectoryOfImage rd_linhkien = new Read_DirectoryOfImage("E:/WEBthayNhanh/trunk/WebsiteBanHangLaptop1/web/imageSanPham/LinhKien");
    //Read_DirectoryOfImage rd = new Read_DirectoryOfImage("C:/Users/THANHTUNG/Documents/NetBeansProjects/CNPMM/WebsiteBanHangLaptop1/web");
    List<String> HinhAnh_Ten_linhkien = rd_linhkien.getListOfName();
    
    List<HangSanXuat> MA_HANG = new ArrayList<HangSanXuat>();
    List<String> CHIP = new ArrayList<String>();
    List<String> RAM = new ArrayList<String>();
    List<String> O_CUNG = new ArrayList<String>();
    List<String> GCARD = new ArrayList<String>();
    List<String> OS = new ArrayList<String>();
    List<Double> WEIGHT = new ArrayList<Double>();
    List<String> SIZE = new ArrayList<String>();
    List<String> MOTA = new ArrayList<String>();

    public void init() {
        HangSanXuatDAO hsxdao = new HangSanXuatDAO();
        MA_HANG = hsxdao.getList();

        CHIP.add(" Intel Core i5_3210M ");
        CHIP.add(" Intel Core i3-3240T Processor3M Cache 2.90 GHz");
        CHIP.add("Intel Core i7-3940XM Processor Extreme Edition8M Cache up to 3.90 GHz");
        CHIP.add("Intel Core i5-3350P Processor6M Cache up to 3.30 GHz");

        RAM.add("2GB");
        RAM.add("3GB");
        RAM.add("4GB");
        RAM.add("6GB");

        O_CUNG.add("500GB");
        O_CUNG.add("250GB");
        O_CUNG.add("7500GB");
        O_CUNG.add("1TB");

        GCARD.add("GF 1Gb");
        GCARD.add("Onboard");
        GCARD.add("GF 2Gb");
        GCARD.add("GF 4Gb");

        OS.add("Win 7");
        OS.add("ubuntu");
        OS.add("Win 8");

        WEIGHT.add(7.0);
        WEIGHT.add(10.0);
        WEIGHT.add(8.5);

        SIZE.add("14");
        SIZE.add("16");
        SIZE.add("18");

        MOTA.add("Sac Pin");
        MOTA.add("Tai Nghe");
        MOTA.add("Đế Cắm");
    }

    public CreateSanPham() {
        init();
    }

    public int getRandomAt(List list) {
        Random random = new Random();
        int i = random.nextInt();
        if (i < 0) {
            i = i * -1;
        }
        int kq = i % list.size();
        return kq;
    }

    public int getRandomAt(int to) {
        Random random = new Random();
        int i = random.nextInt();
        if (i < 0) {
            i = i * -1;
        }
        int kq = 0;
        if (to != 0) {
            kq = i % to;
        }
        return kq;
    }

    private Laptop createLapTop() {


        Laptop lap = new Laptop();
        String idsp = spd.generateKeyCode("SanPham", "maSanPham", "SP");
        lap.setMaSanPham(idsp);

        lap.setChipCpu(CHIP.get(getRandomAt(CHIP)));
        lap.setRam(RAM.get(getRandomAt(RAM)));
        lap.setOCung(O_CUNG.get(getRandomAt(O_CUNG)));
        lap.setCardDoHoa(GCARD.get(getRandomAt(GCARD)));
        lap.setHeDieuHanh(OS.get(getRandomAt(OS)));
        lap.setCanNang(WEIGHT.get(getRandomAt(WEIGHT)));
        lap.setManHinh(SIZE.get(getRandomAt(SIZE)));

        SanPham sp = new SanPham();
        sp.setMaSanPham(idsp);
        
        
        
        String hihanh = HinhAnh_Ten_lap.get(getRandomAt(HinhAnh_Ten_lap));

        sp.setTenSanPham(StringConverter.getNamefromPicture(hihanh));
        sp.setHinhAnh("imageSanPham" + "/Laptop/" + hihanh);

        sp.setHangSanXuat(MA_HANG.get(getRandomAt(MA_HANG)));
        sp.setGia((double) getRandomAt(50) * 1000000);
        sp.setSoLuongTon(getRandomAt(100));
        Date d = new Date();
        sp.setNgayCapNhat(d);
        TinhTrangSanPhamDAO ttspdao = new TinhTrangSanPhamDAO();
        TinhTrangSanPham tt = ttspdao.getObject(1);
        sp.setTinhTrangSanPham(tt);
        sp.setThoiGianBaoHanh(12);

        lap.setSanPham(sp);
        return lap;
    }

    private LinhKien createLinhKien() {


        LinhKien lap = new LinhKien();
        String idsp = spd.generateKeyCode("SanPham", "maSanPham", "SP");
        lap.setMaSanPham(idsp);

        

        SanPham sp = new SanPham();
        sp.setMaSanPham(idsp);
        String hihanh = HinhAnh_Ten_linhkien.get(getRandomAt(HinhAnh_Ten_linhkien));
        sp.setTenSanPham(StringConverter.getNamefromPicture(hihanh));
        
        lap.setMoTa(sp.getTenSanPham());
        sp.setHinhAnh("imageSanPham" + "/LinhKien/" + hihanh);
        sp.setHangSanXuat(MA_HANG.get(getRandomAt(MA_HANG)));
        sp.setGia((double) getRandomAt(50) * 100000);
        sp.setSoLuongTon(getRandomAt(100));
        Date d = new Date();
        sp.setNgayCapNhat(d);
        TinhTrangSanPhamDAO ttspdao = new TinhTrangSanPhamDAO();
        TinhTrangSanPham tt = ttspdao.getObject(1);
        sp.setTinhTrangSanPham(tt);
        sp.setThoiGianBaoHanh(12);

        lap.setSanPham(sp);
        return lap;
    }

    public Object Create(int choose) {
        if (choose == 0) {
            return createLapTop();
        }
        if (choose == 1) {
            return createLinhKien();
        }
        return null;
    }
}
