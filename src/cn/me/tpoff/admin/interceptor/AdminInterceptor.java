package cn.me.tpoff.admin.interceptor;

import cn.me.tpoff.admin.user.vo.AdminUser;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class AdminInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		AdminUser adminUser = (AdminUser) ActionContext.getContext().getSession().get("adminUser");
		if(adminUser==null) {
			return "future";
		}
		return actionInvocation.invoke();
	}

}
