package model.pojo;
// Generated Nov 23, 2012 11:16:33 PM by Hibernate Tools 3.2.1.GA



/**
 * ChiTietDonHangId generated by hbm2java
 */
public class ChiTietDonHangId  implements java.io.Serializable {


     private String maDonHang;
     private String maSanPham;

    public ChiTietDonHangId() {
    }

    public ChiTietDonHangId(String maDonHang, String maSanPham) {
       this.maDonHang = maDonHang;
       this.maSanPham = maSanPham;
    }
   
    public String getMaDonHang() {
        return this.maDonHang;
    }
    
    public void setMaDonHang(String maDonHang) {
        this.maDonHang = maDonHang;
    }
    public String getMaSanPham() {
        return this.maSanPham;
    }
    
    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ChiTietDonHangId) ) return false;
		 ChiTietDonHangId castOther = ( ChiTietDonHangId ) other; 
         
		 return ( (this.getMaDonHang()==castOther.getMaDonHang()) || ( this.getMaDonHang()!=null && castOther.getMaDonHang()!=null && this.getMaDonHang().equals(castOther.getMaDonHang()) ) )
 && ( (this.getMaSanPham()==castOther.getMaSanPham()) || ( this.getMaSanPham()!=null && castOther.getMaSanPham()!=null && this.getMaSanPham().equals(castOther.getMaSanPham()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getMaDonHang() == null ? 0 : this.getMaDonHang().hashCode() );
         result = 37 * result + ( getMaSanPham() == null ? 0 : this.getMaSanPham().hashCode() );
         return result;
   }   


}


