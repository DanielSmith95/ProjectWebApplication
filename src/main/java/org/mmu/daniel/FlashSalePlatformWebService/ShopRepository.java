package org.mmu.daniel.FlashSalePlatformWebService;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ShopRepository extends JpaRepository<Shop, Long> {
	List<Shop> findAllByOwnerId(int ownerId);
	
	Shop findShopByShopId(int shopId);
}
