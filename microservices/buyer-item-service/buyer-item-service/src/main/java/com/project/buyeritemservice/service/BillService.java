package com.project.buyeritemservice.service;

import java.net.URISyntaxException;

import com.project.buyeritemservice.pojo.BillPojo;

public interface BillService {
	BillPojo saveBill(BillPojo billPojo) throws URISyntaxException;

}
