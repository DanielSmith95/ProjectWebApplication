package org.mmu.daniel.FlashSalePlatformWebService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class HibernateDAO {

	@Autowired
	private ShopRepository shopRepository;
	
	@Autowired
	private SaleRepository saleRepository;
	
	@Autowired
	private ShopOwnerRepository shopOwnerRepository;
	
	@Autowired
	private WebServiceUserRepository userRepository;
	
	@Autowired
	private AuthorityRepository authorityRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	public List<Shop> getAllShops() {
		return shopRepository.findAll();
	}
	
	public List<Shop> findAllShopsByOwnerId() {
		return shopRepository.findAllByOwnerId(getUserOwnerId());
	}
	
	public Shop findShopByShopId(int shopId) {
		return shopRepository.findShopByShopId(shopId);
	}
	
	public Shop insertShop(Shop shop) {
		Shop newShop = shop;
		newShop.setOwnerId(getUserOwnerId());
		return shopRepository.save(newShop);
	}
	
	public Shop updateShop(Shop shop) {
		return shopRepository.save(shop);
	}
	
	public void deleteShop(Shop shop) {
		shopRepository.delete(shop);
	}
	
	public List<Sale> getAllSales() {
		return saleRepository.findAll();
	}
	
	public List<Sale> searchSalesById(int shopId) {
		return saleRepository.findAllByShopId(shopId);
	}
	
	public Sale findSaleBySaleId(int saleId) {
		return saleRepository.findSaleBySaleId(saleId);
	}
	
	public List<Sale> findSalesBySaleCategory(int saleCategory) {
		return saleRepository.findSalesBySaleCategory(saleCategory);
	}
	
	public Sale insertSale(Sale sale) {
		return saleRepository.save(sale);
	}
	
	public void deleteSale(Sale sale) {
		saleRepository.delete(sale);
	}
	
	public void deleteSalesByShopId(int shopId) {
		saleRepository.deleteSalesByShopId(shopId);
	}
	
	public List<WebServiceUser> getAllUsers() {
		return userRepository.findAll();
	}
	
	public WebServiceUser findUserById(String username) {
		return userRepository.findUserByUsername(username);
	}
	
	public WebServiceUser updateUser(WebServiceUser user) {
		return userRepository.save(user);
	}
	
	public List<Category> getAllCategories() {
		return categoryRepository.findAll();
	}
	
	public ShopOwner createShopOwner(ShopOwner shopOwner) {
		String unencodedPwd = shopOwner.getPassword();
		shopOwner.setPassword(encoder.encode(unencodedPwd));
		WebServiceUser newUser = new WebServiceUser();
		newUser.setUsername(shopOwner.getEmail());
		newUser.setPassword(shopOwner.getPassword());
		newUser.setEnabled(1);
		userRepository.save(newUser);
		Authority newAuthority = new Authority();
		newAuthority.setUsername(shopOwner.getEmail());
		newAuthority.setAuthority("ROLE_SHOP_OWNER");
		authorityRepository.save(newAuthority);
		return shopOwnerRepository.save(shopOwner);
	}
	
	private int getUserOwnerId() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String email = user.getUsername();
		ShopOwner shopOwner = shopOwnerRepository.findByEmail(email);
		return shopOwner.getOwnerId();
	}
}
