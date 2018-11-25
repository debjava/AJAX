package ajaxsample;

import org.apache.struts.action.ActionForm;

/**
 * Simple Struts Form that we use to hold data
 * @author Paul Browne , release under GPL
 * */
public class SampleForm extends ActionForm {
	
	//Fields that hold data
	private String field1="";
	private String field2="";
	private String field3="";
	private String ask="";
	private String showBlue="true";
	private String showGreen="true";
	private String showMain="true";
	
	public String toString(){
		
		return "SampleForm Values -"+" ask:"+ask+" field1:"+field1+" field2:"+field2+" showMain:"+getShowMain()+" showBlue:"+showBlue+" showGreen:";
	
	}
	
	/**
	 * Default constructor,
	 */
  public SampleForm() {
		super();
  }


	/**
	 * @param field1 The field1 to set.
	 */
	public void setField1(String field1) {
		this.field1 = field1;
	}


	/**
	 * @return Returns the field1.
	 */
	public String getField1() {
		return field1;
	}


	/**
	 * @param field2 The field2 to set.
	 */
	public void setField2(String field2) {
		this.field2 = field2;
	}


	/**
	 * @return Returns the field2.
	 */
	public String getField2() {
		return field2;
	}


	/**
	 * @param ask The ask to set.
	 */
	public void setAsk(String ask) {
		this.ask = ask;
	}


	/**
	 * @return Returns the ask.
	 */
	public String getAsk() {
		return ask;
	}

	/**
	 * @param showBlue The showBlue to set.
	 */
	public void setShowBlue(String showBlue) {
		this.showBlue = showBlue;
	}

	/**
	 * @return Returns the showBlue.
	 */
	public String getShowBlue() {
		return showBlue;
	}

	/**
	 * @param showGreen The showGreen to set.
	 */
	public void setShowGreen(String showGreen) {
		this.showGreen = showGreen;
	}

	/**
	 * @return Returns the showGreen.
	 */
	public String getShowGreen() {
		return showGreen;
	}

	/**
	 * @param field3 The field3 to set.
	 */
	public void setField3(String field3) {
		this.field3 = field3;
	}

	/**
	 * @return Returns the field3.
	 */
	public String getField3() {
		return field3;
	}

	/**
	 * @param showMain The showMain to set.
	 */
	private void setShowMain(String showMain) {
		this.showMain = showMain;
	}

	/**
	 * @return Returns the showMain.
	 */
	private String getShowMain() {
		return showMain;
	}




}
