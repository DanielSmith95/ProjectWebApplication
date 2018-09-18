package org.mmu.daniel.FlashSalePlatformWebService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.cloud.storage.Acl;
import com.google.cloud.storage.Acl.Role;
import com.google.cloud.storage.Acl.User;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class WebServiceController {
	
	@Autowired
	private HibernateDAO dao;
	
	private static Storage storage = null;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/shopOwner/homepage")
	public String shopOwnerHomepage() {
		return "shopOwnerHomepage";
	}
	
	@RequestMapping("/admin/homepage")
	public String adminHomepage() {
		return "adminHomepage";
	}
	
	@RequestMapping("/shopOwner/viewShopsSales")
	public String viewShopsSales(Model model) {
		model.addAttribute("shops", dao.findAllShopsByOwnerId());
		return "shopOwnerViewShops";
	}
	
	@RequestMapping("/shopOwner/registerShop")
	public String registerShop() {
		return "registerShop";
	}
	
	@RequestMapping("/shopOwner/registerSale")
	public String registerSale(Model model) {
		model.addAttribute("shops", dao.findAllShopsByOwnerId());
		model.addAttribute("categories", dao.getAllCategories());
		return "registerSale";
	}
	
	@RequestMapping("/registerShopOwner")
	public String registerShopOwner() {
		return "registerShopOwner";
	}
	
	@RequestMapping("/admin/searchShopsSales")
	public String searchShopsSales(Model model) {
		model.addAttribute("shops", dao.getAllShops());
		return "adminViewShops";
	}
	
	@RequestMapping("/admin/viewUsers")
	public String adminViewUsers(Model model) {
		model.addAttribute("users", dao.getAllUsers());
		return "adminViewUsers";
	}
	
	@RequestMapping("/admin/viewUserReports")
	public String viewUserReports() {
		return "viewUserReports";
	}
	
	@RequestMapping("/admin/viewErrorReports")
	public String viewErrorReports() {
		return "viewErrorReports";
	}
	
	@PostMapping("/shopOwner/submitShop")
	public String getAllShops(@ModelAttribute Shop shop) {
		dao.insertShop(shop);
		System.out.println(dao.getAllShops());
		return "redirect:/shopOwner/registerShop";
	}
	
	@PostMapping("/shopOwner/updateShop")
	public String shopOwnerUpdateShop(@RequestParam int shopId, Model model) {
		Shop shop = dao.findShopByShopId(shopId);
		model.addAttribute("shop", shop);
		return "shopOwnerUpdateShop";
	}
	
	@PostMapping("/shopOwner/submitShopUpdate")
	public String shopOwnerSubmitShopUpdate(@ModelAttribute Shop shop) {
		dao.updateShop(shop);
		return "redirect:/shopOwner/viewShopsSales";
	}
	
	@PostMapping("/shopOwner/updateSale")
	public String shopOwnerUpdateSale(@RequestParam int saleId, Model model) {
		Sale sale = dao.findSaleBySaleId(saleId);
		model.addAttribute("sale", sale);
		return "shopOwnerUpdateSale";
	}
	
	@PostMapping("/shopOwner/submitSaleUpdate")
	public String shopOwnerSubmitSaleUpdate(@ModelAttribute Sale sale) {
		dao.insertSale(sale);
		return "redirect:/shopOwner/viewShopsSales";
	}
	
	@PostMapping("/shopOwner/deleteShop") 
	public String shopOwnerDeleteShop(@RequestParam int shopId) {
		Shop shop = new Shop();
		shop.setShopId(shopId);
		dao.deleteShop(shop);
		dao.deleteSalesByShopId(shopId);
		return "redirect:/shopOwner/viewShopsSales";
	}
	
	@PostMapping("/shopOwner/deleteSale") 
	public String shopOwnerDeleteSale(@RequestParam int saleId) {
		Sale sale = new Sale();
		sale.setSaleId(saleId);
		dao.deleteSale(sale);
		return "redirect:/shopOwner/viewShopsSales";
	}
	
	@SuppressWarnings("deprecation")
	@PostMapping("/shopOwner/submitSale")
	public String submitSale(@RequestParam int shopId, @RequestParam int categoryId, @RequestParam Part saleImage, @ModelAttribute Sale sale) throws IOException {
		Sale newSale = sale;
		newSale.setShopId(shopId);
		newSale.setSaleCategory(categoryId);
		
		if (!saleImage.getSubmittedFileName().isEmpty()) {
			DateTimeFormatter dtf = DateTimeFormat.forPattern("-YYYY-MM-dd-HHmmssSSS");
			DateTime dt = DateTime.now(DateTimeZone.UTC);
			String dtString = dt.toString(dtf);
			final String fileName = saleImage.getSubmittedFileName() + dtString;
			
			storage = StorageOptions.getDefaultInstance().getService();
			BlobInfo blobInfo = storage.create(
					BlobInfo
					.newBuilder("flashsaleplatform.appspot.com", fileName)
					.setAcl(new ArrayList<>(Arrays.asList(Acl.of(User.ofAllUsers(), Role.READER))))
					.build(),
					saleImage.getInputStream());
			
			newSale.setImageReference(blobInfo.getMediaLink());
		}
		else {
			newSale.setImageReference(null);
		}
		dao.insertSale(newSale);
		
		return "redirect:/shopOwner/registerSale";
	}
	
	@PostMapping("/admin/viewSales")
	public String adminViewSales(@RequestParam int shopId, Model model) {
		model.addAttribute("sales", dao.searchSalesById(shopId));
		return "adminViewSales";
	}
	
	@PostMapping("/admin/deleteShop") 
	public String adminDeleteShop(@RequestParam int shopId) {
		Shop shop = new Shop();
		shop.setShopId(shopId);
		dao.deleteShop(shop);
		dao.deleteSalesByShopId(shopId);
		return "redirect:/admin/searchShopsSales";
	}
	
	@PostMapping("/admin/deleteSale") 
	public String adminDeleteSale(@RequestParam int saleId) {
		Sale sale = new Sale();
		sale.setSaleId(saleId);
		dao.deleteSale(sale);
		return "redirect:/admin/searchShopsSales";
	}
	
	@PostMapping("/admin/updateShop")
	public String adminUpdateShop(@RequestParam int shopId, Model model) {
		Shop shop = dao.findShopByShopId(shopId);
		model.addAttribute("shop", shop);
		return "adminUpdateShop";
	}
	
	@PostMapping("/admin/submitShopUpdate")
	public String adminSubmitShopUpdate(@ModelAttribute Shop shop) {
		dao.updateShop(shop);
		return "redirect:/admin/searchShopsSales";
	}
	
	@PostMapping("/admin/updateSale")
	public String adminUpdateSale(@RequestParam int saleId, Model model) {
		Sale sale = dao.findSaleBySaleId(saleId);
		model.addAttribute("sale", sale);
		return "adminUpdateSale";
	}
	
	@PostMapping("/admin/submitSaleUpdate")
	public String adminSubmitSaleUpdate(@ModelAttribute Sale sale) {
		dao.insertSale(sale);
		return "redirect:/admin/searchShopsSales";
	}
	
	@PostMapping ("/admin/suspendUser")
	public String adminSuspendUser(@RequestParam String username) {
		WebServiceUser selectedUser = dao.findUserById(username);
		selectedUser.setEnabled(0);
		dao.updateUser(selectedUser);
		return "redirect:/admin/viewUsers";
	}
	
	@PostMapping ("/admin/activateUser")
	public String adminActivateUser(@RequestParam String username) {
		WebServiceUser selectedUser = dao.findUserById(username);
		selectedUser.setEnabled(1);
		dao.updateUser(selectedUser);
		return "redirect:/admin/viewUsers";
	}
	
	@PostMapping("/shopOwner/viewSales")
	public String shopOwnerViewSales(@RequestParam int shopId, Model model) {
		model.addAttribute("sales", dao.searchSalesById(shopId));
		return "shopOwnerViewSales";
	}
	
	@PostMapping("/createAccount")
	public String createAccount(@ModelAttribute ShopOwner shopOwner) {
		dao.createShopOwner(shopOwner);
		return "redirect:/login";
	}
	
	@RequestMapping("/utils/getAllSales")
	@ResponseBody
	public String getAllSales() {
		return dao.getAllSales().toString();
	}
	
	@RequestMapping("/utils/getShopLocation")
	@ResponseBody
	public String getShopLocation(@RequestParam int shopId) {
		Shop shop = dao.findShopByShopId(shopId);
		return shop.getAddressLine1() + " " + shop.getAddressLine2() + " " + shop.getAddressLine3() + " " + shop.getPostcode();
	}
	
	@RequestMapping("/utils/getAllCategories")
	@ResponseBody
	public String getAllCategories() {
		return dao.getAllCategories().toString();
	}
	
	@RequestMapping("/utils/getSalesByCategory")
	@ResponseBody
	public String getSalesByCategory(@RequestParam int saleCategory) {
		return dao.findSalesBySaleCategory(saleCategory).toString();
	}
}
