/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Tags;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author THANHTUNG
 */
public class AttributeTag  extends TagSupport{
    private String ten;
    private String tuoi;
    @Override
    public int doEndTag() throws JspException {
        try {
            JspWriter out = this.pageContext.getOut();
            if (this.ten ==null) this.ten = "No Name";
            if (this.tuoi ==null) this.ten = "No Age";
            out.println(String.format("<h3>Hello, %s. You are %s years old.</h3>",this.ten,this.tuoi));
           
        } catch (IOException ex) {
            Logger.getLogger(AttributeTag.class.getName()).log(Level.SEVERE, null, ex);
        }
         return SKIP_BODY;
    }

    @Override
    public int doAfterBody() throws JspException {
        return EVAL_PAGE;
    }

    @Override
    public void release() {
        super.release();
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public void setTuoi(String tuoi) {
        this.tuoi = tuoi;
    }
    
    
}
