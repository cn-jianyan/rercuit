package com.jianyan.util;

import com.jianyan.entity.Teach;
import com.jianyan.service.TeachService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.*;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;



public class TeachExcel {




    static public List<Teach> upload(InputStream inp) throws IOException {
        DataFormatter dataFormatter=new DataFormatter();
     //读取工作普
        Workbook wb= WorkbookFactory.create(inp);
        List<Teach> li=new ArrayList<Teach>();
        //遍历所有工作表
        for(Sheet sheet:wb) {
            //遍历所有行
            for (int i=1;i<=sheet.getLastRowNum();i++) {
                //遍历所有单元格
                Row row=sheet.getRow(i);

                System.out.println(dataFormatter.formatCellValue(row.getCell(0)));
                Teach t=new Teach();
                t.setLoginname(dataFormatter.formatCellValue(row.getCell(0)));
                t.setLoginpwd(dataFormatter.formatCellValue(row.getCell(1)));
                t.setName(dataFormatter.formatCellValue(row.getCell(2)));
                t.setArea(dataFormatter.formatCellValue(row.getCell(3)));
                t.setSex(dataFormatter.formatCellValue(row.getCell(4)));
                t.setPhonenum(dataFormatter.formatCellValue(row.getCell(5)));
                t.setQqnum(dataFormatter.formatCellValue(row.getCell(6)));

                System.out.println("teach:"+t);

                li.add(t);
            }
        }






        return li;


    }






}
