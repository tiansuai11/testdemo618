package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Bills;
import com.kgc.utils.BillsParam;

public interface BillsService {
    public boolean addBills(Bills bills);
    public boolean deleteById(Integer id);
    public boolean updateBills(Bills bills);
    public Bills getBillsById(Integer id);
    public PageInfo<Bills> getBillsListByPage(Integer pageIndex, Integer pageSize, BillsParam billsParam);
}
