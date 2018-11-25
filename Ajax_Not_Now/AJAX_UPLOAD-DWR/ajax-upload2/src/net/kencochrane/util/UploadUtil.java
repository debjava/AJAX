package net.kencochrane.util;

import org.apache.log4j.Logger;
import org.apache.struts.upload.FormFile;
import java.io.*;

/*
*  Created for Part 2, by Ken Cochrane
*  http://KenCochrane.net , http://CampRate.com , http://PopcornMonsters.com
*/

/**
 * User: Ken Cochrane
 * Date: Mar 20, 2006
 * Time: 10:21:21 PM
 */
public class UploadUtil {
    static Logger log = Logger.getLogger(UploadUtil.class);

    public static void writeToDisk(FormFile file, String fileName, String destinationPath) throws FileNotFoundException, IOException {

        log.info("[writeToDisk] - Entering Fuction");
        InputStream stream = null;
        OutputStream bos = null;
        int bytesRead = 0;
        int fileSize = 0;
        byte[] buffer = null;

        log.info("[writeToDisk] - Get InputFileStream and FileOutputStream");
        stream = file.getInputStream();
        bos = new FileOutputStream(destinationPath + fileName);

        fileSize = file.getFileSize();
        log.info("[writeToDisk] - Got File Size of " + fileSize + " bytes");

        bytesRead = 0;
        buffer = new byte[fileSize];
        while ((bytesRead = stream.read(buffer, 0, fileSize)) != -1) {
            bos.write(buffer, 0, bytesRead);
        }
        log.info("[writeToDisk] - Finished writing file(" + fileSize + ") to disk (" + destinationPath + ").");

        bos.close();
        stream.close();
    }
}
