package com.jianyan.util;

import java.io.OutputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.List;

import com.jianyan.entity.Stu;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class Xlsx {
    public static <T> void write(List<Stu> li, OutputStream o) throws Exception{
        //创建工作薄
        Workbook wb=new XSSFWorkbook();
        //创建表格
        Sheet sheet=wb.createSheet();
        //标题
       String[] tt=new  String[]{
               "序号","姓名","性别","年龄","籍贯","名族","高考准考证号","老师","身份证","专业","电话","qq","家庭住址","紧急联系人","紧急联系人电话","学校","地区","招生老师id","录入时间","最后更改时间","状态","描述"
       };
        Row tr=sheet.createRow(0);

        for(int i=0;i<tt.length;i++){

            Cell col=tr.createCell(i);
            col.setCellValue(tt[i].toString());
        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");

        //获取列个数
        System.out.println("++++++"+li.size());
        for(int i=0;i<li.size();i++) {
            System.out.println(i);
            Row r=sheet.createRow(i+1);
            r.createCell(0).setCellValue(li.get(i).getSid());
            r.createCell(1).setCellValue(li.get(i).getName());
            r.createCell(2).setCellValue(li.get(i).getSex());
            r.createCell(3).setCellValue(li.get(i).getAge());
            r.createCell(4).setCellValue(li.get(i).getOrigin());
            r.createCell(5).setCellValue(li.get(i).getNational());
            r.createCell(6).setCellValue(li.get(i).getTicket());
            r.createCell(7).setCellValue(li.get(i).getHeadteacher());
            r.createCell(8).setCellValue(li.get(i).getIdnumber());
            r.createCell(9).setCellValue(li.get(i).getMajor());tr.createCell(10).setCellValue(li.get(i).getPhonenum());
            r.createCell(11).setCellValue(li.get(i).getQqnum());
            r.createCell(12).setCellValue(li.get(i).getAddress());
            r.createCell(13).setCellValue(li.get(i).getEmergencycontact());
            r.createCell(14).setCellValue(li.get(i).getEmergencycontacnumber());
            r.createCell(15).setCellValue(li.get(i).getSchool());
            r.createCell(16).setCellValue(li.get(i).getArea());
            r.createCell(17).setCellValue(li.get(i).getTeach().getTid());
            r.createCell(18).setCellValue(sdf.format(li.get(i).getCreatedate()));
            r.createCell(19).setCellValue(sdf.format(li.get(i).getModifydate()));
            r.createCell(20).setCellValue(li.get(i).getStatus());
            r.createCell(21).setCellValue(li.get(i).getRemark());


        }
        wb.write(o);
        o.close();

    }
}

