package com.beskilled.controller;

import com.beskilled.entity.Department;
import com.beskilled.jsperReport.DeptService;
import com.beskilled.jsperReport.MediaTypeUtils;
import com.beskilled.repo.DepartmentRepository;
import com.beskilled.repo.OrganizationRepository;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/dept/")
public class DepartmentController {
    @Autowired
    private DepartmentRepository repo;

    @Autowired
    private OrganizationRepository orgRepo;

    @Autowired
    private DeptService deptService;

    @Autowired
    ServletContext context;

    @GetMapping(value = "add")
    public String deptAdd(Model model) {
        model.addAttribute("dept", new Department());
        model.addAttribute("orgList", this.orgRepo.findAll());
        return "departments/add";
    }

    @PostMapping(value = "add")
    public String deptAdd(@Valid Department department, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "departments/add";

        } else {
            department.setShortName(department.getShortName().toUpperCase());
            this.repo.save(department);
            model.addAttribute("dept", new Department());
            model.addAttribute("successMsg", "Successfully Saved!");
        }
        model.addAttribute("orgList", this.orgRepo.findAll());
        return "departments/add";
    }

    @GetMapping(value = "edit/{id}")
    public String viewEdit(Model model, @PathVariable("id") Long id) {
        model.addAttribute("dept", repo.getOne(id));
        model.addAttribute("orgList", this.orgRepo.findAll());
        return "departments/edit";
    }

    @PostMapping(value = "edit/{id}")
    public String edit(@Valid Department department, BindingResult result, Model model, @PathVariable("id") Long id) {
        if (result.hasErrors()) {
            model.addAttribute("orgList", this.orgRepo.findAll());
            return "departments/edit";
        } else {
            department.setId(id);
            this.repo.save(department);
        }
        model.addAttribute("orgList", this.orgRepo.findAll());
        return "redirect:/dept/list";
    }

    @GetMapping(value = "del/{id}")
    public String Delet(@PathVariable("id") Long id) {
        if (id != null) {
            this.repo.deleteById(id);
        }
        return "redirect:/dept/list";
    }

    @GetMapping(value = "list")
    public String viewList(Model model) {
        model.addAttribute("list", this.repo.findAll());
        return "departments/list";
    }

    @RequestMapping(value = "deptreport", method = RequestMethod.GET)
    public void report(HttpServletResponse response) throws Exception {
        response.setContentType("text/html");
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(deptService.report());
        InputStream inputStream = this.getClass().getResourceAsStream("/deptReport/report.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource);
        HtmlExporter exporter = new HtmlExporter(DefaultJasperReportsContext.getInstance());
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        exporter.setExporterOutput(new SimpleHtmlExporterOutput(response.getWriter()));
        exporter.exportReport();
    }

    public void deptreportPdf() throws Exception {
        String source = "src\\main\\resources\\deptReport\\report.jrxml";
        try {
            JasperCompileManager.compileReportToFile(source);
        } catch (JRException e) {
            e.printStackTrace();
        }
        String sourceFileName = "src\\main\\resources\\deptReport\\report1.jasper";
        String printFileName = null;
        String destFileName = "src\\main\\resources\\deptReport\\report.pdf";
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(deptService.report());
        Map parameters = new HashMap();
        try {
            printFileName = JasperFillManager.fillReportToFile(sourceFileName,
                    parameters, dataSource);
            if (printFileName != null) {
                JasperExportManager.exportReportToPdfFile(printFileName,
                        destFileName);
            }
        } catch (JRException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("deptpdf")
    public ResponseEntity<InputStreamResource> downloadFile1() throws IOException {
        try {
            deptreportPdf();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String fileName="src\\main\\resources\\deptReport\\report.pdf";
        MediaType mediaType = MediaTypeUtils.getMediaTypeForFileName(this.context, fileName);
        File file=new File(fileName);
        InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

        return ResponseEntity.ok()
                // Content-Disposition
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + file.getName())
                // Content-Type
                .contentType(mediaType)
                // Contet-Length
                .contentLength(file.length()) //
                .body(resource);
    }
}
