package model.pojo;
// Generated Sep 28, 2012 7:25:13 PM by Hibernate Tools 3.2.1.GA



/**
 * KhachHangTrucTuyen generated by hbm2java
 */
public class KhachHangTrucTuyen  implements java.io.Serializable {


     private String username;
     private String matKhau;
     private String hoTen;
     private Integer tinhTrang;
     private String email;

    public KhachHangTrucTuyen() {
    }

	
    public KhachHangTrucTuyen(String username) {
        this.username = username;
    }
    public KhachHangTrucTuyen(String username, String matKhau, String hoTen, Integer tinhTrang, String email) {
       this.username = username;
       this.matKhau = matKhau;
       this.hoTen = hoTen;
       this.tinhTrang = tinhTrang;
       this.email = email;
    }
   
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getMatKhau() {
        return this.matKhau;
    }
    
    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }
    public String getHoTen() {
        return this.hoTen;
    }
    
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    public Integer getTinhTrang() {
        return this.tinhTrang;
    }
    
    public void setTinhTrang(Integer tinhTrang) {
        this.tinhTrang = tinhTrang;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }




}


