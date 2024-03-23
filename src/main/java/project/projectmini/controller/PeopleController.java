package project.projectmini.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.projectmini.dao.PeopleDao;
import project.projectmini.vo.PeopleVo;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PeopleController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    PeopleDao peopleDao;

    public PeopleController(PeopleDao peopleDao) {
		this.peopleDao = peopleDao;
	}



    @RequestMapping("/people/insert_form.do")
	public String insert_form() {

		return "people/people_insert_form";
	}

    @RequestMapping("/people/insert.do")
    public String insert(PeopleVo vo){

		vo.processPersonal();
		vo.processPassword();

        int res = peopleDao.insertPeople(vo);
        if(res == 0){
        }
        return "redirect:login_form.do";
    }

    @RequestMapping("/people/login_form.do")
	public String login_form() {

		return "people/people_insert_form";
	}

    @RequestMapping("/people/login.do")
	public String login(String p_email, String p_pwd, RedirectAttributes ra) {

		PeopleVo people = peopleDao.selectOneFromId(p_email);
		if (people == null) {

			ra.addAttribute("reason", "fail_id");
			return "redirect:login_form.do";
		}
		if (people.getP_pwd().equals(p_pwd) == false) {

			ra.addAttribute("reason", "fail_pwd");
			ra.addAttribute("p_email", "p_email");
			return "redirect:login_form.do";
		}

		if (session.getAttribute("people") != null) {
			session.invalidate();
		}

		session.setAttribute("people", people);
		return "redirect:../main/main.do";
	}


    	@RequestMapping(value = "/people/check_p_email.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_p_email(String p_email) {

		PeopleVo vo = peopleDao.selectOneFromId(p_email);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);
		return map;
	}
    @RequestMapping(value = "/people/check_pwd.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_pwd(String p_pwd) {

		PeopleVo vo = peopleDao.selectOneFromId(p_pwd);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}
	

    @RequestMapping("/people/list.do")
    public String list(Model model){

        List<PeopleVo> list = peopleDao.selectList();

        model.addAttribute("list",list);

        return "people/people_list";
    }


}
