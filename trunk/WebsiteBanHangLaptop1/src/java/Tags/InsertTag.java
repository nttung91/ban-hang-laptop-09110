 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Tags;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Stack;
import javax.servlet.ServletException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author THANHTUNG
 */
public class InsertTag extends TagSupport{
    private String template; 
   public void setTemplate(String template) { 
      this.template = template; 
   } 
   public Stack getStack() { 
     Stack stack = (Stack) this.pageContext.getAttribute( 
              AttributeUtil.templateStack, 
              PageContext.REQUEST_SCOPE); 
      if (stack == null) { 
         stack = new Stack(); 
         this.pageContext.setAttribute( 
                     AttributeUtil.templateStack, stack,  
                     PageContext.REQUEST_SCOPE); 
      } 
      return stack; 
   }
    @Override
   public int doStartTag() { 
      Stack stack=this.getStack(); 
      Hashtable params = new Hashtable(); 
      stack.add(params); 
      return EVAL_BODY_INCLUDE; 
   } 
    @Override
   public int doEndTag() throws JspException { 
      try { 
         this.pageContext.include(template); 
         this.getStack().pop(); 
      } catch (IOException ex) { 
         throw new JspException(ex.getMessage()); 
      } catch (ServletException ex) { 
         throw new JspException(ex.getMessage()); 
      } 
      return EVAL_PAGE; 
   }
    
}
