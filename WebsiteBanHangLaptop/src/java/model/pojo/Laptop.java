package model.pojo;
// Generated Oct 5, 2012 5:03:29 PM by Hibernate Tools 3.2.1.GA



/**
 * Laptop generated by hbm2java
 */
public class Laptop  implements java.io.Serializable {


     private String maSanPham;
     private SanPham sanPham;
     private String chipCpu;
     private String ram;
     private String OCung;
     private String cardDoHoa;
     private String heDieuHanh;
     private Double canNang;
     private String manHinh;
     private String pin;
     private String diaQuang;
     private String cardKhongDay;
     private String tinhNangKhac;

    public Laptop() {
    }

	
    public Laptop(String maSanPham, SanPham sanPham) {
        this.maSanPham = maSanPham;
        this.sanPham = sanPham;
    }
    public Laptop(String maSanPham, SanPham sanPham, String chipCpu, String ram, String OCung, String cardDoHoa, String heDieuHanh, Double canNang, String manHinh, String pin, String diaQuang, String cardKhongDay, String tinhNangKhac) {
       this.maSanPham = maSanPham;
       this.sanPham = sanPham;
       this.chipCpu = chipCpu;
       this.ram = ram;
       this.OCung = OCung;
       this.cardDoHoa = cardDoHoa;
       this.heDieuHanh = heDieuHanh;
       this.canNang = canNang;
       this.manHinh = manHinh;
       this.pin = pin;
       this.diaQuang = diaQuang;
       this.cardKhongDay = cardKhongDay;
       this.tinhNangKhac = tinhNangKhac;
    }
   
    public String getMaSanPham() {
        return this.maSanPham;
    }
    
    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }
    public SanPham getSanPham() {
        return this.sanPham;
    }
    
    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }
    public String getChipCpu() {
        return this.chipCpu;
    }
    
    public void setChipCpu(String chipCpu) {
        this.chipCpu = chipCpu;
    }
    public String getRam() {
        return this.ram;
    }
    
    public void setRam(String ram) {
        this.ram = ram;
    }
    public String getOCung() {
        return this.OCung;
    }
    
    public void setOCung(String OCung) {
        this.OCung = OCung;
    }
    public String getCardDoHoa() {
        return this.cardDoHoa;
    }
    
    public void setCardDoHoa(String cardDoHoa) {
        this.cardDoHoa = cardDoHoa;
    }
    public String getHeDieuHanh() {
        return this.heDieuHanh;
    }
    
    public void setHeDieuHanh(String heDieuHanh) {
        this.heDieuHanh = heDieuHanh;
    }
    public Double getCanNang() {
        return this.canNang;
    }
    
    public void setCanNang(Double canNang) {
        this.canNang = canNang;
    }
    public String getManHinh() {
        return this.manHinh;
    }
    
    public void setManHinh(String manHinh) {
        this.manHinh = manHinh;
    }
    public String getPin() {
        return this.pin;
    }
    
    public void setPin(String pin) {
        this.pin = pin;
    }
    public String getDiaQuang() {
        return this.diaQuang;
    }
    
    public void setDiaQuang(String diaQuang) {
        this.diaQuang = diaQuang;
    }
    public String getCardKhongDay() {
        return this.cardKhongDay;
    }
    
    public void setCardKhongDay(String cardKhongDay) {
        this.cardKhongDay = cardKhongDay;
    }
    public String getTinhNangKhac() {
        return this.tinhNangKhac;
    }
    
    public void setTinhNangKhac(String tinhNangKhac) {
        this.tinhNangKhac = tinhNangKhac;
    }




}


