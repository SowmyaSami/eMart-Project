package com.emart.billing.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.emart.billing.entity.BillEntity;



@Repository
public interface BillDao extends JpaRepository<BillEntity, Integer> {
	

}
