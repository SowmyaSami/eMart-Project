package com.emart.billing.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.emart.billing.pojo.BillPojo;
import com.emart.billing.service.BillService;

@RestController
@RequestMapping("billing")
@CrossOrigin
public class BillController {
	/* Logging */
	static Logger LOG = Logger.getLogger(BillController.class.getClass());
	@Autowired
	BillService billService;

	@PostMapping("/savebill")

	BillPojo save(@RequestBody BillPojo billPojo) {
		LOG.info("Entered end point \'emart/bill \' ");

		LOG.info("Exited end point \'emart/bill \' ");
		return billService.saveBill(billPojo);

	}

}
