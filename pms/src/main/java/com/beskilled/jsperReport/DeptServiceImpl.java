package com.beskilled.jsperReport;

import com.beskilled.entity.Department;
import com.beskilled.entity.User;
import com.beskilled.repo.DepartmentRepository;
import com.beskilled.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("deptService")
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DepartmentRepository deptRepo;
    @Override
    public List<Map<String, Object>> report() {
        List<Map<String, Object>> result= new ArrayList<Map<String, Object>>();
        for (Department department : deptRepo.findAll()){
            Map<String, Object> item=new HashMap<String, Object>();
            item.put("id", department.getId());
            item.put("departmentName", department.getDepartmentName());
            item.put("rank", department.getRank());

            result.add(item);
        }
        return result;
    }
}
