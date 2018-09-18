package org.mmu.daniel.FlashSalePlatformWebService;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WebServiceUserRepository extends JpaRepository<WebServiceUser, Long> {
	WebServiceUser findUserByUsername(String username);
}
