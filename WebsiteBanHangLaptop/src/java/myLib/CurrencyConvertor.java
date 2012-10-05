/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myLib;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;

/**
 *
 * @author THANHTUNG
 */
public class CurrencyConvertor {
   
    public static String AmountToCurrencyFomat(Double amount,String currencySymbol)
    {
      NumberFormat nf = NumberFormat.getCurrencyInstance();
        DecimalFormatSymbols decimalFormatSymbols = ((DecimalFormat) nf).getDecimalFormatSymbols();
        decimalFormatSymbols.setCurrencySymbol("");
        ((DecimalFormat) nf).setDecimalFormatSymbols(decimalFormatSymbols);
           nf.setMaximumFractionDigits(0);
       return nf.format(amount).trim()+" "+currencySymbol;
    }
    
    
}
