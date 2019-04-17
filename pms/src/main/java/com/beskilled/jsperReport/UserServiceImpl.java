package com.beskilled.jsperReport;

import com.beskilled.entity.User;
import com.beskilled.repo.UserRepository;
import com.ibm.icu.impl.ValidIdentifiers;
import com.sun.jmx.snmp.tasks.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepo;
    @Override
    public List<Map<String, Object>> report() {
        List<Map<String, Object>> result= new ArrayList<Map<String, Object>>();
        for (User user : userRepo.findAll()){
            Map<String, Object> item=new HashMap<String, Object>();
            item.put("id", user.getId());
            item.put("firstName", user.getFirstName());
            item.put("mobile", user.getMobile());

            result.add(item);
        }
        return result;
    }
}
