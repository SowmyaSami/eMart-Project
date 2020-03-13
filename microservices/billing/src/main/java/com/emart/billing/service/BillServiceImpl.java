package com.emart.billing.service;

import java.util.HashSet;
import java.util.Set;

import javax.transaction.Transactional;

import org.apache.log4j.BasicConfigurator;
//import org.apache.log4j.BasicConfigurator;
//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emart.billing.dao.BillDao;
import com.emart.billing.dao.BillDetailsDao;
import com.emart.billing.entity.BillDetailsEntity;
import com.emart.billing.entity.BillEntity;
import com.emart.billing.entity.BuyerSignupEntity;
import com.emart.billing.entity.CategoryEntity;
import com.emart.billing.entity.ItemEntity;
import com.emart.billing.entity.SellerSignupEntity;
import com.emart.billing.entity.SubCategoryEntity;
import com.emart.billing.pojo.BillDetailsPojo;
import com.emart.billing.pojo.BillPojo;
import com.emart.billing.pojo.BuyerSignupPojo;
import com.emart.billing.pojo.CategoryPojo;
import com.emart.billing.pojo.ItemPojo;
import com.emart.billing.pojo.SellerSignupPojo;
import com.emart.billing.pojo.SubCategoryPojo;


@Service
public class BillServiceImpl implements BillService {
	//static Logger LOG = Logger.getLogger(BillServiceImpl.class.getClass());

	@Autowired
	BillDao billDao;

	@Autowired
	BillDetailsDao billDetailsDao;

	@Override
	@Transactional
	
	public BillPojo saveBill(BillPojo billPojo) {
		BasicConfigurator.configure();
		//LOG.info("entered saveBill()");
		

		BuyerSignupPojo buyerSignupPojo = billPojo.getBuyer();
		BuyerSignupEntity buyerSignupEntity = new BuyerSignupEntity(buyerSignupPojo.getId(),
											buyerSignupPojo.getUsername(), 
											buyerSignupPojo.getPassword(), 
											buyerSignupPojo.getEmail(),
											buyerSignupPojo.getMobile(), 
											buyerSignupPojo.getDate(),
											null);

		BillEntity billEntity = new BillEntity();
		billEntity.setId(0);
		billEntity.setAmount(billPojo.getAmount());
		billEntity.setRemarks(billPojo.getRemarks());
		billEntity.setType(billPojo.getType());
		billEntity.setDate(billPojo.getDate());
		billEntity.setBuyer(buyerSignupEntity);

		billEntity = billDao.saveAndFlush(billEntity);
		billPojo.setId(billEntity.getId());

		BillEntity setBillEntity = billDao.findById(billEntity.getId()).get();

		Set<BillDetailsEntity> allBillDetails = new HashSet<BillDetailsEntity>();
		Set<BillDetailsPojo> allBillDetailsPojo = billPojo.getAllBillDetails();

		for (BillDetailsPojo billDetailsPojo : allBillDetailsPojo) {

			ItemPojo itemPojo = billDetailsPojo.getItem();
			SubCategoryPojo subCategoryPojo = itemPojo.getSubCategory();
			CategoryPojo categoryPojo = subCategoryPojo.getCategory();
			SellerSignupPojo sellerSignupPojo = itemPojo.getSellerId();

			SellerSignupEntity sellerEntity = new SellerSignupEntity(sellerSignupPojo.getId(),
												sellerSignupPojo.getUsername(), 
												sellerSignupPojo.getPassword(), 
												sellerSignupPojo.getCompany(),
												sellerSignupPojo.getBrief(),
												sellerSignupPojo.getGst(), 
												sellerSignupPojo.getAddress(),
												sellerSignupPojo.getEmail(), 
												sellerSignupPojo.getWebsite(), 
												sellerSignupPojo.getContact());

			CategoryEntity categoryEntity = new CategoryEntity(categoryPojo.getId(), 
											categoryPojo.getName(),
											categoryPojo.getBrief());

			SubCategoryEntity subCategoryEntity = new SubCategoryEntity(subCategoryPojo.getId(),
												subCategoryPojo.getName(),
												categoryEntity, 
												subCategoryPojo.getBrief(),
												subCategoryPojo.getGstPercent());

			ItemEntity itemEntity = new ItemEntity(itemPojo.getId(), 
									itemPojo.getName(), 
									sellerEntity,
									subCategoryEntity,
									itemPojo.getPrice(), 
									itemPojo.getDescription(), 
									itemPojo.getStock(),
									itemPojo.getRemarks(), itemPojo.getImage());

			BillDetailsEntity billDetailsEntity = new BillDetailsEntity(billDetailsPojo.getId(), 
														setBillEntity,
														itemEntity);

			billDetailsDao.save(billDetailsEntity);

		}
//		BasicConfigurator.configure();
//		LOG.info("exited saveBill()");

		return billPojo;

	}

}
