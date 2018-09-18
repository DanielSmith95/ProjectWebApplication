package org.mmu.daniel.FlashSalePlatformWebService;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SaleRepository extends JpaRepository<Sale, Long> {
	List<Sale> findAllByShopId(int shopId);
	
	Sale findSaleBySaleId(int saleId);
	
	List<Sale> findSalesBySaleCategory(int saleCategory);
	
	@Transactional
	List<Sale> deleteSalesByShopId(int shopId);
}
