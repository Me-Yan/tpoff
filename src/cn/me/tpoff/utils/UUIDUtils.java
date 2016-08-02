package cn.me.tpoff.utils;

import java.util.UUID;

/**
 * 生成随机字符串的工具类
 * @author 严杨鸿
 *
 */


public class UUIDUtils {
	
	/**
	 * 获取随机数
	 * @return 
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
}
