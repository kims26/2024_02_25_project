package project.projectmini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import project.projectmini.dao.PeopleDao;
import project.projectmini.vo.PeopleVo;

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


    @RequestMapping("/people/insert.do")
	public String insert_form() {

		return "people/people_insert_form";
	}

    @RequestMapping("people/people_insert.do")
    public String insert(PeopleVo vo){

        int res = peopleDao.insertPeople(vo);
        if(res == 0){
        }
        return "redirect:people/login_form.do";
    }
}
