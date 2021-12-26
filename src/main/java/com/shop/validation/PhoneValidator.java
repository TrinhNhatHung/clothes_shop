package com.shop.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator<ValidPhone, String> {

	@Override
	public boolean isValid(String phone, ConstraintValidatorContext context) {
		if (phone == null) {
			return false;
		}
		return phone.matches("^0[0-9]{9,10}$");
	}

}
