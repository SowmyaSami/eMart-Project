package com.project.loginservice.service;

import com.project.loginservice.pojo.BuyerSignupPojo;

public interface BuyerSignupService {

	
	BuyerSignupPojo validateBuyerSignup(BuyerSignupPojo buyerSignupPojo);

	BuyerSignupPojo getBuyer(int BuyerId);
	
}
