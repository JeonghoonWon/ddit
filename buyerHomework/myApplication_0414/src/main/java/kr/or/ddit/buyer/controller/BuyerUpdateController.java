package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.dao.IOthersDAO;
import kr.or.ddit.buyer.dao.OthersDAOImpl;
import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mvc.annotation.Controller;
import kr.or.ddit.mvc.annotation.RequestMapping;
import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.annotation.resolvers.ModelAttribute;
import kr.or.ddit.mvc.annotation.resolvers.RequestParam;
import kr.or.ddit.validator.CommonValidator;
import kr.or.ddit.validator.UpdateGroup;
import kr.or.ddit.vo.BuyerVO;

@Controller
public class BuyerUpdateController{
	private IBuyerService service = new BuyerServiceImpl();
	private IOthersDAO othersDAO = OthersDAOImpl.getInstance();
	
	private void addAttribute(HttpServletRequest req) {
		List<Map<String, Object>> lprodList = othersDAO.selectLprodList();
		req.setAttribute("lprodList", lprodList);
	}
	
	@RequestMapping("/buyer/buyerUpdate.do")
	public String updateForm(
			@RequestParam(value="buyer", required=true, defaultValue="1") String buyer_id,
			HttpServletRequest req) throws ServletException, IOException {
		addAttribute(req);
		BuyerVO buyer = service.retrieveBuyer(buyer_id);
		req.setAttribute("buyer", buyer);
		return "buyer/buyerForm";
		
	}
	
	@RequestMapping(value="/buyer/buyerUpdate.do", method=RequestMethod.POST)
	public String Update(
			@ModelAttribute("buyer") BuyerVO buyer,
			HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		addAttribute(req);
		Map<String, List<String>> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
		boolean valid =new CommonValidator<BuyerVO>().validate(buyer, errors, UpdateGroup.class);
		String view = null;
		String message = null;
		if(valid) {
			ServiceResult result = service.modifyBuyer(buyer);
			switch(result) {
				case OK:
					view = "redirect:/buyer/buyerView.do?buyer="+buyer.getBuyer_id();
					break;
				default:
					message = "서버 오류, 잠시 뒤 다시 시도하세요.";
					view = "buyer/buyerForm";
					break;
			}//switch end
		}else{
			view = "buyer/buyerForm";
		}
		req.setAttribute("message", message);
		return view;
	}
}