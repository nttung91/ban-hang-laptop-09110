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
public class BodyTag extends TagSupport {

    private int rows, cols, width;

    public void setRows(int rows) {
        this.rows = rows;
    }

    public void setCols(int cols) {
        this.cols = cols;
    }

    public void setWidth(int width) {
        this.width = width;
    }


    @Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out = this.pageContext.getOut();

            out.println("<table width='" + this.width + "' border='1'>");
            for (int i = 0; i < this.rows; i++) {
                out.println("  <tr>");
                for (int j = 0; j < this.cols; j++) {
                    out.println("    <td>&nbsp;</td>");

                }
                out.println("  </tr>");

            }
            out.println("</table>");
            out.println("<div style='width:"+this.width+"px;height:100px;background-color:#F00;'>");
        } catch (IOException ex) {
            Logger.getLogger(BodyTag.class.getName()).log(Level.SEVERE, null, ex);
        }
        return EVAL_BODY_INCLUDE;

    }

    @Override
    public int doEndTag() throws JspException {
        try {
            JspWriter out = this.pageContext.getOut();
            out.println("</div>");
            
        } catch (IOException ex) {
            Logger.getLogger(BodyTag.class.getName()).log(Level.SEVERE, null, ex);
        }
        return EVAL_PAGE;
    }

    @Override
    public void release() {
        super.release();
    }
}
