package cn.me.tpoff.interceptor;

import cn.me.tpoff.user.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation actioninvocation)
			throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("user");
		System.out.println("user="+user);
		if(user==null) {
			System.out.println("---------------------------------执行到当前位置！");
			return "loginPage";
		} else {
			return actioninvocation.invoke();
		}
	}

	
}
