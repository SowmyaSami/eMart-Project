package com.project.buyeritemservice.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.transaction.Transactional;

//import org.apache.log4j.BasicConfigurator;
//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.project.buyeritemservice.dao.BillDao;
import com.project.buyeritemservice.dao.BillDetailsDao;
import com.project.buyeritemservice.pojo.BillPojo;

@Service
public class BillServiceImpl implements BillService {
	// static Logger LOG = Logger.getLogger(BillServiceImpl.class.getClass());

	@Autowired
	BillDao billDao;

	@Autowired
	BillDetailsDao billDetailsDao;

	@Override
	@Transactional

	public BillPojo saveBill(BillPojo billPojo) throws URISyntaxException {

		RestTemplate restTemplate = new RestTemplate();

		URI uri = new URI("http://localhost:9000/billing/savebill");
		ResponseEntity<BillPojo> response = restTemplate.postForEntity(uri, billPojo, BillPojo.class);
//		BasicConfigurator.configure();
//		//LOG.info("entered saveBill()");
//		
//
//		BuyerSignupPojo buyerSignupPojo = billPojo.getBuyer();
//		BuyerSignupEntity buyerSignupEntity = new BuyerSignupEntity(buyerSignupPojo.getId(),
//											buyerSignupPojo.getUsername(), 
//											buyerSignupPojo.getPassword(), 
//											buyerSignupPojo.getEmail(),
//											buyerSignupPojo.getMobile(), 
//											buyerSignupPojo.getDate(),
//											null);
//
//		BillEntity billEntity = new BillEntity();
//		billEntity.setId(0);
//		billEntity.setAmount(billPojo.getAmount());
//		billEntity.setRemarks(billPojo.getRemarks());
//		billEntity.setType(billPojo.getType());
//		billEntity.setDate(billPojo.getDate());
//		billEntity.setBuyer(buyerSignupEntity);
//
//		billEntity = billDao.saveAndFlush(billEntity);
//		billPojo.setId(billEntity.getId());
//
//		BillEntity setBillEntity = billDao.findById(billEntity.getId()).get();
//
//		Set<BillDetailsEntity> allBillDetails = new HashSet<BillDetailsEntity>();
//		Set<BillDetailsPojo> allBillDetailsPojo = billPojo.getAllBillDetails();
//
//		for (BillDetailsPojo billDetailsPojo : allBillDetailsPojo) {
//
//			ItemPojo itemPojo = billDetailsPojo.getItem();
//			SubCategoryPojo subCategoryPojo = itemPojo.getSubCategory();
//			CategoryPojo categoryPojo = subCategoryPojo.getCategory();
//			SellerSignupPojo sellerSignupPojo = itemPojo.getSellerId();
//
//			SellerSignupEntity sellerEntity = new SellerSignupEntity(sellerSignupPojo.getId(),
//												sellerSignupPojo.getUsername(), 
//												sellerSignupPojo.getPassword(), 
//												sellerSignupPojo.getCompany(),
//												sellerSignupPojo.getBrief(),
//												sellerSignupPojo.getGst(), 
//												sellerSignupPojo.getAddress(),
//												sellerSignupPojo.getEmail(), 
//												sellerSignupPojo.getWebsite(), 
//												sellerSignupPojo.getContact());
//
//			CategoryEntity categoryEntity = new CategoryEntity(categoryPojo.getId(), 
//											categoryPojo.getName(),
//											categoryPojo.getBrief());
//
//			SubCategoryEntity subCategoryEntity = new SubCategoryEntity(subCategoryPojo.getId(),
//												subCategoryPojo.getName(),
//												categoryEntity, 
//												subCategoryPojo.getBrief(),
//												subCategoryPojo.getGstPercent());
//
//			ItemEntity itemEntity = new ItemEntity(itemPojo.getId(), 
//									itemPojo.getName(), 
//									sellerEntity,
//									subCategoryEntity,
//									itemPojo.getPrice(), 
//									itemPojo.getDescription(), 
//									itemPojo.getStock(),
//									itemPojo.getRemarks(), itemPojo.getImage());
//
//			BillDetailsEntity billDetailsEntity = new BillDetailsEntity(billDetailsPojo.getId(), 
//														setBillEntity,
//														itemEntity);
//
//			billDetailsDao.save(billDetailsEntity);
//
//		}
////		BasicConfigurator.configure();
////		LOG.info("exited saveBill()");

		return response.getBody();

	}

}