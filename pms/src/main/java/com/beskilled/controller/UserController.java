package com.beskilled.controller;



import com.beskilled.entity.User;
import com.beskilled.repo.*;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.validation.Valid;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;


@Controller
@RequestMapping(value = "/user/")
public class UserController {
    private static String UPLOADED_FOLDER = "src/main/resources/static/images/";

    @Autowired
    private UserRepository repo;

    @Autowired
    private RoleRepository roleRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private OrganizationRepository orgRepo;

    @Autowired
    private DepartmentRepository deptRepo;

    @Autowired
    private DesignationRepository degtRepo;

    @Autowired
    private ImageOptimizer imageOptimizer;


    @GetMapping(value = "add")
    public String viewAdd(User user, Model model){
        model.addAttribute("rolelist", this.roleRepo.findAll());
        model.addAttribute("orgList", this.orgRepo.findAll());
        model.addAttribute("deptList", this.deptRepo.findAll());
        model.addAttribute("degtList", this.degtRepo.findAll());
/*
        model.addAttribute("userLog", this.repo.findByUserName());
*/
        return "users/add";
    }
    @PostMapping(value = "add")
    public String add(@Valid User user, BindingResult result, Model model){
        if(result.hasErrors()){
            model.addAttribute("rolelist", this.roleRepo.findAll());
            model.addAttribute("orgList", this.orgRepo.findAll());
            model.addAttribute("deptList", this.deptRepo.findAll());
            model.addAttribute("degtList", this.degtRepo.findAll());
            return "users/add";
        }
        if(repo.existsByEmail(user.getEmail())){
            model.addAttribute("rejectMsg","Already Have This Entry");
        }else{
            user.setRegiDate(new Date());
            String username = user.getEmail().split("\\@")[0];
            user.setUserName(username);
            user.setEnabled(true);
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setConfirmationToken(UUID.randomUUID().toString());
            this.repo.save(user);
            model.addAttribute("successMsg","Successfully Saved!");
            model.addAttribute("user", new User());
            model.addAttribute("rolelist", this.roleRepo.findAll());
            model.addAttribute("orgList", this.orgRepo.findAll());
            model.addAttribute("deptList", this.deptRepo.findAll());
            model.addAttribute("degtList", this.degtRepo.findAll());

        }

        return "users/add";
    }


    @GetMapping(value = "edit/{id}")
    public String viewEdit(Model model, @PathVariable("id") Long id){
        model.addAttribute("user",repo.getOne(id));
        model.addAttribute("rolelist", this.roleRepo.findAll());
        model.addAttribute("orgList", this.orgRepo.findAll());
        model.addAttribute("deptList", this.deptRepo.findAll());
        model.addAttribute("degtList", this.degtRepo.findAll());
        return "users/edit";
    }
    @PostMapping(value = "edit/{id}")
    public String edit(@Valid User user,@PathVariable("id") Long id, BindingResult result, Model model,@RequestParam("file") MultipartFile file){
        if(result.hasErrors()){
            model.addAttribute("orgList", this.orgRepo.findAll());
            model.addAttribute("deptList", this.deptRepo.findAll());
            model.addAttribute("degtList", this.degtRepo.findAll());
            return "users/edit";
        }
      /*  Optional<User> u = this.repo.findByEmail(user.getEmail());
            if(u.get().getId() != id){
                model.addAttribute("rejectMsg","Already Have This Entry");
                return "users/edit";
            }else{*/
            /*user.setId(id);*/

            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                Files.write(path, bytes);
                user.setFileName("new-" + file.getOriginalFilename());
                user.setFileSize(file.getSize());
                user.setFilePath("images/" + "new-" + file.getOriginalFilename());
                user.setFileExtension(file.getContentType());


                this.repo.save(user);

                imageOptimizer.optimizeImage(UPLOADED_FOLDER, file, 0.3f, 100, 100);
            }catch (Exception e){
                e.printStackTrace();
            }
            /*user.setId(id);
            this.repo.save(user);*/
        /*}*/
        model.addAttribute("orgList", this.orgRepo.findAll());
        model.addAttribute("deptList", this.deptRepo.findAll());
        model.addAttribute("degtList", this.degtRepo.findAll());
        return "redirect:/user/list";
    }

    @GetMapping(value = "del/{id}")
    public String del(@PathVariable("id") Long id){
        if(id != null) {
            this.repo.deleteById(id);
        }
        return "redirect:/user/list";
    }

    @GetMapping(value = "list")
    public String list(Model model){
      /*  Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("list", this.repo.findAllByUserName(auth.getName()));*/
        model.addAttribute("list", this.repo.findAll());

        return "users/list";
    }
   /* @GetMapping(value = "/user-save")
    public String saveUser() {

        Set<Role> roles=new HashSet<>();
        roles.add(new Role("SUPERADMIN"));
        roles.add(new Role("ADMIN"));
        roles.add(new Role("CADMIN"));
        roles.add(new Role("PM"));
        roles.add(new Role("TEAMLEAD"));
        roles.add(new Role("DEVELOPER"));
        roles.add(new Role("USER"));
        roles.forEach((role -> {
            roleRepo.save(role);
        }));

        roles.add(new Role(1L));
        roles.add(new Role(2L));

        User user = new User("Mostafizur","Rahman","mostafiz","admin@gmail.com",new Date(),true,UUID.randomUUID().toString(),roles);
        user.setPassword(passwordEncoder.encode("mostafiz"));
        repo.save(user);
        return "success";
    }

    @GetMapping(value = "/register")
    public ModelAndView displayRegister(User user){
        ModelAndView mv=new ModelAndView();
        mv.addObject("user",user);
        mv.setViewName("signup");
        return mv;
    }*/
}