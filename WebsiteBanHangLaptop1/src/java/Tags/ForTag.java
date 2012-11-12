/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Tags;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author THANHTUNG
 */
public class ForTag extends SimpleTagSupport{
        int size;

    public void setSize(int size) {
        this.size = size;
    }

    @Override
    public void doTag() throws JspException, IOException {
        for (int i=0;i<size;i++){
            this.getJspBody().invoke(null);
        }
    }
       
}
