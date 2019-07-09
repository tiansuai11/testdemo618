package com.kgc.controller;


import com.github.pagehelper.PageInfo;
import com.kgc.entity.Bills;
import com.kgc.entity.Billtype;
import com.kgc.service.BillsService;
import com.kgc.service.BilltypeService;
import com.kgc.utils.BillsParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
public class EmpController {
    @Autowired
    private BillsService billsService;
    @Autowired
    private BilltypeService billtypeService;

    @RequestMapping("/index")
    public String index(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                        @RequestParam(value = "pageSize" , defaultValue = "3") Integer pageSize,
                        BillsParam billsParam,
                        Model model){
        PageInfo<Bills> info = billsService.getBillsListByPage(pageIndex,pageSize,billsParam);
        List<Billtype> billtypeList = billtypeService.getBilltypeList();
        model.addAttribute("billsParam",billsParam);
        model.addAttribute("info",info);
        model.addAttribute("billtypeList",billtypeList);
        return "index";
    }
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String delete(@PathVariable("id") Integer id){
        if (billsService.deleteById(id)){
            return "<script>alert('删除成功');location.href='/index'</script>";
        }else{
            return "<script>alert('删除失败');history.go(-1);</script>";
        }
    }
    @RequestMapping(value = "/insert",method = RequestMethod.GET)
    public String insert(Model model){
        List<Billtype> billtypeList = billtypeService.getBilltypeList();
        model.addAttribute("billtypeList",billtypeList);
        return "add";
    }
    @RequestMapping(value = "/insert",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String insert(Bills bills,Model model){
        if (billsService.addBills(bills)){
            return "<script>alert('添加成功');location.href='/index'</script>";
        }else{
            return "<script>alert('添加失败');history.go(-1);</script>";
        }
    }

}
