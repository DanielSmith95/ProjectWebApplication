package org.mmu.daniel.FlashSalePlatformWebService;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ShopOwnerRepository extends JpaRepository<ShopOwner, Long> {
	ShopOwner findByEmail(String email);
}
