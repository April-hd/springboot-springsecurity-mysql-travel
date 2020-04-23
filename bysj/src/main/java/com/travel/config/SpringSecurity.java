package com.travel.config;

import com.travel.service.UserInfoService;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import javax.annotation.Resource;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 18:23 新建
 */
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SpringSecurity extends WebSecurityConfigurerAdapter {

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;

    @Resource
    private MyAuthenticationFailureHandler myAuthenticationFailureHandler;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/travel/**").permitAll()
                .antMatchers("/login").permitAll()
                .antMatchers("/login.do").permitAll()
                .antMatchers("/register/**").permitAll()
                .antMatchers("/register.do").permitAll()
                .antMatchers("/logout").permitAll()
                .antMatchers("/loginManage").permitAll()
                .antMatchers("/manage/**").hasRole("ADMIN")
                .antMatchers("/error/**").permitAll()
                .antMatchers("/css/**").permitAll()
                .antMatchers("/images/**").permitAll()
                .antMatchers("/js/**").permitAll()
                .antMatchers("/video/**").permitAll()
                .anyRequest().authenticated();

        http.formLogin().loginPage("/travel")
                .loginProcessingUrl("/loginManage.do")
                .usernameParameter("username")
                .passwordParameter("password")
                .successHandler(myAuthenticationSuccessHandler)
                .failureHandler(myAuthenticationFailureHandler);

        http.logout().logoutUrl("/logoutManage")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .logoutSuccessUrl("/loginManage");

        http.sessionManagement().maximumSessions(10).expiredUrl("/travel");
        http.sessionManagement().invalidSessionUrl("/travel");

        http.csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userInfoService);
    }

}
