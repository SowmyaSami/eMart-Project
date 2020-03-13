package com.emart.billing.dao;




import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.emart.billing.entity.ItemEntity;



@Repository
public interface ItemDao extends JpaRepository<ItemEntity, Integer>
{

}
