package com.email.luanvan.Service;

import com.email.luanvan.Model.MailOrder;
import com.email.luanvan.Model.MailStatus;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

@Service
public class ThymeleafService {
  private static final String MAIL_TEMPLATE_BASE_NAME = "mail/MailMessages";
  private static final String MAIL_TEMPLATE_PREFIX = "/templates/";
  private static final String MAIL_TEMPLATE_SUFFIX = ".html";
  private static final String UTF_8 = "UTF-8";

  private static final String TEMPLATE_NAME = "mail-template";
  private static final String TEMPLATE_UPDATE_STATUS = "update-status-mail.html";
  private static TemplateEngine templateEngine;

  static {
    templateEngine = emailTemplateEngine();
  }

  private static TemplateEngine emailTemplateEngine() {
    final SpringTemplateEngine templateEngine = new SpringTemplateEngine();
    templateEngine.setTemplateResolver(htmlTemplateResolver());
    templateEngine.setTemplateEngineMessageSource(emailMessageSource());
    return templateEngine;
  }

  private static ResourceBundleMessageSource emailMessageSource() {
    final ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
    messageSource.setBasename(MAIL_TEMPLATE_BASE_NAME);
    return messageSource;
  }

  private static ITemplateResolver htmlTemplateResolver() {
    final ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
    templateResolver.setPrefix(MAIL_TEMPLATE_PREFIX);
    templateResolver.setSuffix(MAIL_TEMPLATE_SUFFIX);
    templateResolver.setTemplateMode(TemplateMode.HTML);
    templateResolver.setCharacterEncoding(UTF_8);
    templateResolver.setCacheable(false);
    return templateResolver;
  }

  public String getContent(MailOrder order) {
    final Context context = new Context();

    context.setVariable("name", order.getName());
    context.setVariable("phone", order.getPhoneNumber());
    context.setVariable("no", order.getNo());
    context.setVariable("price", order.getPrice());
    context.setVariable("address", order.getAddress());
    context.setVariable("items", order.getItems());
    return templateEngine.process(TEMPLATE_NAME, context);
  }
  public String contentUpdateStatus(MailStatus order) {
    final Context context = new Context();

    context.setVariable("no", order.getNo());
    context.setVariable("status", order.getOrderStatus());
    context.setVariable("user", order.getUser());
    return templateEngine.process(TEMPLATE_UPDATE_STATUS, context);
  }
}
