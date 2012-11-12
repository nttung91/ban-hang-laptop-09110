package model.pojo;
// Generated Oct 23, 2012 10:38:34 AM by Hibernate Tools 3.2.1.GA



/**
 * ChiTietKhuyenMaiId generated by hbm2java
 */
public class ChiTietKhuyenMaiId  implements java.io.Serializable {


     private String maSanPham;
     private String maKhuyenMai;

    public ChiTietKhuyenMaiId() {
    }

    public ChiTietKhuyenMaiId(String maSanPham, String maKhuyenMai) {
       this.maSanPham = maSanPham;
       this.maKhuyenMai = maKhuyenMai;
    }
   
    public String getMaSanPham() {
        return this.maSanPham;
    }
    
    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }
    public String getMaKhuyenMai() {
        return this.maKhuyenMai;
    }
    
    public void setMaKhuyenMai(String maKhuyenMai) {
        this.maKhuyenMai = maKhuyenMai;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ChiTietKhuyenMaiId) ) return false;
		 ChiTietKhuyenMaiId castOther = ( ChiTietKhuyenMaiId ) other; 
         
		 return ( (this.getMaSanPham()==castOther.getMaSanPham()) || ( this.getMaSanPham()!=null && castOther.getMaSanPham()!=null && this.getMaSanPham().equals(castOther.getMaSanPham()) ) )
 && ( (this.getMaKhuyenMai()==castOther.getMaKhuyenMai()) || ( this.getMaKhuyenMai()!=null && castOther.getMaKhuyenMai()!=null && this.getMaKhuyenMai().equals(castOther.getMaKhuyenMai()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getMaSanPham() == null ? 0 : this.getMaSanPham().hashCode() );
         result = 37 * result + ( getMaKhuyenMai() == null ? 0 : this.getMaKhuyenMai().hashCode() );
         return result;
   }   


}


