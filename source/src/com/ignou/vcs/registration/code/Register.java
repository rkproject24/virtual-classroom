package com.ignou.vcs.registration.code;

import com.ignou.vcs.registration.beans.RegistrationBean;

public class Register {
	
	public RegistrationBean setRegFormData(String name,String dayBirth,String monthBirth,String yearBirth,String email_id_primary,String email_id_secondary,String contact_no_primary,String contact_no_secondary,String address,String father_name,String occupation,String password) 
		{
		
		RegistrationBean register= new RegistrationBean();
		register.setName(name);
		register.setDayBirth(dayBirth);
		register.setMonthBirth(monthBirth);
		register.setYearBirth(yearBirth);
		register.setEmailP(email_id_primary);
		register.setEmailS(email_id_secondary);
		register.setContactP(contact_no_primary);
		register.setContactS(contact_no_secondary);
		register.setAddress(address);
		register.setFatherName(father_name);
		register.setOccupation(occupation);
		register.setPassword(password);
		return register;
		}
	
}


