/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CreateSanPhamByCode;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;

/**
 *
 * @author MRKYT
 */
public class Read_DirectoryOfImage {

    File dir;
    static final String[] EXTENSIONS = new String[]{
        "gif", "png", "bmp","jpg" // and other formats you need
    };
    // filter to identify images based on their extensions
   static final FilenameFilter IMAGE_FILTER = new FilenameFilter() {
        @Override
        public boolean accept(final File dir, final String name) {
            for (final String ext : EXTENSIONS) {
                if (name.endsWith("." + ext)) {
                    return (true);
                }
            }
            return (false);
        }
    };

    public Read_DirectoryOfImage(String Dir_URL) {
        dir = new File(Dir_URL);

    }

    public List<String> getListOfName() {
        List<String> arr = new ArrayList<String>();

        if (dir.isDirectory()) { // make sure it's a directory
            for (final File f : dir.listFiles(IMAGE_FILTER)) {
                
                
                arr.add(f.getName());


            }
        }
        
        return arr;
    }
}
