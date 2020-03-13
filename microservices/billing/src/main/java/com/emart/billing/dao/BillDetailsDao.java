package com.emart.billing.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.emart.billing.entity.BillDetailsEntity;



@Repository
public interface BillDetailsDao extends JpaRepository<BillDetailsEntity, Integer> {

	
}
