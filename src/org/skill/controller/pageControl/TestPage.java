package org.skill.controller.pageControl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestPage implements Controller {
    private  static Log logger= LogFactory.getLog(TestPage.class);
    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        logger.info("handleRequest被调用");
        ModelAndView mv=new ModelAndView();
        mv.addObject("message","hello World");
        mv.addObject("age",15);
        mv.setViewName("/WEB-INF/admin/test.jsp");  //主页视图
        return mv;
    }
}
