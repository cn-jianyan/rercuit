import com.github.pagehelper.Page;
import com.jianyan.dao.StuDao;
import com.jianyan.dao.TeachDao;
import com.jianyan.entity.Log;
import com.jianyan.entity.Stu;
import com.jianyan.entity.Teach;
import com.jianyan.service.LogService;
import com.jianyan.service.StuService;
import com.jianyan.service.TeachService;
import com.jianyan.util.Xlsx;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MyTest {
    static ApplicationContext ioc= new ClassPathXmlApplicationContext("spring-config.xml");



    @Test
    public void h1(){
         StuService stt=ioc.getBean(StuService.class);
        System.out.println(stt.queryAllByLimit(new Page(1,2),new Stu()));
    }
    @Test
    public void h2(){
         StuDao stuDao=ioc.getBean(StuDao.class);
        System.out.println(stuDao.queryAll(new Stu()));
    }
    @Test
    public void h3(){
         LogService logService=ioc.getBean(LogService.class);
        System.out.println(logService.queryAllByLimit(new Page(1,1),new Log()));
    }

    @Test
    public void h4(){
        String str="/recruit_war_exploded/stu/selectLimit/1";
        int a=str.indexOf("/select");
        String path="/recruit_war_exploded/";
        System.out.println(str.substring(path.length(),a));
    }
    @Test
    public void h5(){
           StuService stuDao=ioc.getBean(StuService.class);
        System.out.println(stuDao.queryView());
    }
    /*add stu*/
    @Test
    public void h6(){
        Stu stu=new Stu();
        stu.setName("李四");stu.setSex("男"); stu.setAge(21);
        stu.setOrigin("江西");stu.setNational("汉");stu.setTicket("1321223");
        stu.setHeadteacher("郭嘉");stu.setIdnumber("45646784132");stu.setMajor("软件开发");
        stu.setPhonenum("12345646");stu.setQqnum("54663213");stu.setAddress("江西宜春");
        stu.setEmergencycontact("李刚");stu.setEmergencycontacnumber("123134564852");
        stu.setSchool("宜春一中");stu.setArea("江西宜春");
        Teach teach=new Teach(); teach.setTid(1);
        stu.setTeach(teach);stu.setCreatedate(new Date());
        stu.setModifydate(new Date());stu.setStatus(1);

           StuService stuDao=ioc.getBean(StuService.class);
        stuDao.insert(stu);
    }
    @Test
    public void h7(){
           StuService stuDao=ioc.getBean(StuService.class);
        System.out.println(stuDao.stuview("school"));
    }

    @Test void h8() throws Exception {
        StuService stuDao=ioc.getBean(StuService.class);
        List list=stuDao.queryAllByLimit(new Page(),new Stu()).getList();
        System.out.println("----"+list);
     Xlsx.write(list,new FileOutputStream("E:\\wps文件\\xxx.xlsx"));
    }

    @Test
    public void  h9(){
         TeachDao dao= ioc.getBean(TeachDao.class);
        List li=new ArrayList();
        Teach t=new Teach(); t.setArea("贵州");t.setLoginname("12211221"); t.setLoginpwd("123456");
        t.setName("付琪"); t.setSex("男"); t.setPhonenum("17655423845"); t.setQqnum("45646432");
        li.add(t);
        Integer a=dao.insertList(li);
        System.out.println(a);
    }
}
