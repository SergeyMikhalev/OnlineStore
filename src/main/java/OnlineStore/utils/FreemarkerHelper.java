package OnlineStore.utils;


import freemarker.cache.ClassTemplateLoader;
import freemarker.cache.FileTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;


public class FreemarkerHelper {


    public static String getStringFromTemplate(String templateName, Object Data)
    {
        Configuration configuration = new Configuration(Configuration.getVersion());
        StringWriter stringWriter = new StringWriter();




        try {
            configuration.setDefaultEncoding("UTF-8");
            configuration.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            configuration.setLogTemplateExceptions(false);
            configuration.setTemplateLoader(new FileTemplateLoader(new  File("F:/Java learning/OnlineStore/src/main/webapp/templates/parts/")));  //TODO Прикрепить нормальный путь

            Template template = configuration.getTemplate(templateName);
            template.process(Data,stringWriter);

        }  catch (IOException | TemplateException e) { throw new RuntimeException(e);}


        return stringWriter.toString();
    }

}
