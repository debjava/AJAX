/**
 * 	This is a very simple servlet for interaction
 *	with Ajax. This application is an 
 *	outcome of the RnD division run Debadatta Mishra.
 *	Very shortly you will find several java and other
 *	related articles in the internet.
 *
 *	It is a learning application, please do not integrate
 *	in your application. It has been made open source.
 *	It is not for any commercial purpose.
 *	Please enjoy it at your own convenience.
 *
 */
package com.ajax.rnd.test;
/**
 * @author PIKU
 *
 */
public class EmployeeBean {

    private String id;
    private String firstName;
    private String lastName;
    
    public EmployeeBean (String id, String firstName, String lastName) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
    }
    
    public String getId() {
        return id;
    }
    
    public String getFirstName() {
        return firstName;
    }
    
    public String getLastName() {
        return lastName;
    }
}


