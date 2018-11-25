package net.kencochrane.form;
/*
*  Created for Part 2, by Ken Cochrane
*  http://KenCochrane.net , http://CampRate.com , http://PopcornMonsters.com
*/
import org.apache.struts.validator.ValidatorForm;
import org.apache.struts.upload.FormFile;

/**
 * User: Ken Cochrane
 * Date: Mar 19, 2006
 * Time: 8:35:27 AM
 */
public class UploadForm extends ValidatorForm {
    private FormFile file1,file2,file3,file4;

    public FormFile getFile1() {
        return file1;
    }

    public void setFile1(FormFile file1) {
        this.file1 = file1;
    }

    public FormFile getFile2() {
        return file2;
    }

    public void setFile2(FormFile file2) {
        this.file2 = file2;
    }

    public FormFile getFile3() {
        return file3;
    }

    public void setFile3(FormFile file3) {
        this.file3 = file3;
    }

    public FormFile getFile4() {
        return file4;
    }

    public void setFile4(FormFile file4) {
        this.file4 = file4;
    }


    public String toString() {
        return "[UploadForm]\n" +
                " file1= " + file1 + "\n" +
                " file2= " + file2 + "\n" +
                " file3= " + file3 + "\n" +
                " file4= " + file4 + "\n" +
                "[/ UploadForm]\n";
    }
}
