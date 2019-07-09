package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.entity.Bills;
import com.kgc.entity.BillsExample;
import com.kgc.entity.Billtype;
import com.kgc.mapper.BillsMapper;
import com.kgc.mapper.BilltypeMapper;
import com.kgc.service.BillsService;
import com.kgc.utils.BillsParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillsServiceImpl implements BillsService {

    @Autowired
    private BilltypeMapper billtypeMapper;
    @Autowired
    private BillsMapper billsMapper;

    @Override
    public boolean addBills(Bills bills) {
        return billsMapper.insertSelective(bills)>0?true:false;
    }

    @Override
    public boolean deleteById(Integer id) {
        return billsMapper.deleteByPrimaryKey(id)>0?true:false;
    }

    @Override
    public boolean updateBills(Bills bills) {
        return false;
    }

    @Override
    public Bills getBillsById(Integer id) {
        return null;
    }

    @Override
    public PageInfo<Bills> getBillsListByPage(Integer pageIndex, Integer pageSize, BillsParam billsParam) {
        BillsExample example=new BillsExample();
        example.setOrderByClause("id");
        BillsExample.Criteria criteria = example.createCriteria();
        if (billsParam!=null){
             if (billsParam.getTid()!=null && billsParam.getTid()!=-1){
                 criteria.andTypeidEqualTo(billsParam.getTid());
             }
            if(billsParam.getMin_day()!=null){
                criteria.andBilltimeGreaterThanOrEqualTo(billsParam.getMin_day());
            }
            if(billsParam.getMax_day()!=null){
                criteria.andBilltimeLessThanOrEqualTo(billsParam.getMax_day());
            }
        }
        PageHelper.startPage(pageIndex,pageSize);
        List<Bills> bills = billsMapper.selectByExample(example);
        if (bills!=null&&bills.size()>0){
            for (Bills b:bills){
                Integer typeid = b.getTypeid();
                Billtype billtype = billtypeMapper.selectByPrimaryKey(typeid);
                b.setBilltype(billtype);
            }
        }
        PageInfo<Bills> info=new PageInfo<>(bills,3);



        return info;
    }
}
