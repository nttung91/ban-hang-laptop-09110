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
public class IfTag extends SimpleTagSupport{
    boolean condition;

    public boolean isCondition() {
        return condition;
    }

    public void setCondition(boolean condition) {
        this.condition = condition;
    }

    @Override
    public void doTag() throws JspException, IOException {
        this.getJspBody().invoke(null);
    }
    
}
