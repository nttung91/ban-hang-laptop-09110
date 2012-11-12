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
public class ElseTag  extends SimpleTagSupport{

    @Override
    public void doTag() throws JspException, IOException {
        IfTag it = (IfTag)this.getParent();
        if (!it.isCondition()){
            this.getJspBody().invoke(null);
        }
    }
    
}
