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
public class ParentTag extends TagSupport {

    private boolean condition;

    public boolean isCondition() {
        return condition;
    }

    public void setCondition(boolean condition) {
        this.condition = condition;
    }
    @Override
    public int doStartTag() throws JspException {
       
        return EVAL_BODY_INCLUDE;

    }

    @Override
    public int doEndTag() throws JspException {
        
        return EVAL_PAGE;
    }

    @Override
    public void release() {
        super.release();
    }
}
