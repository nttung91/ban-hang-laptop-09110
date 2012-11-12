/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author THANHTUNG
 */
public class ChildTag extends TagSupport {

    
    


    @Override
    public int doStartTag() throws JspException {
        ParentTag pt = (ParentTag)this.getParent();
        if (pt.isCondition())
        return EVAL_BODY_INCLUDE;
        else return  SKIP_BODY;
        
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
