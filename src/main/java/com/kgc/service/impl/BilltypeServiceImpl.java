package com.kgc.service.impl;

import com.kgc.entity.Billtype;
import com.kgc.mapper.BilltypeMapper;
import com.kgc.service.BilltypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BilltypeServiceImpl implements BilltypeService {
    @Autowired
    private BilltypeMapper billtypeMapper;
    @Override
    public List<Billtype> getBilltypeList() {
        return billtypeMapper.selectByExample(null);
    }
}
