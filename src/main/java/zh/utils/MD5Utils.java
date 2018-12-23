package zh.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @comment: MD5加密工具类
 * @author 傅里叶级数
 * @date 2018年5月27日上午10:21:44
 */
public class MD5Utils {
	
	/**
	 * @comment: 加密
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:22:01
	 * @param source
	 * @return
	 */
	private final static String encoder(String source) {
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		digest.update(source.getBytes());
		byte[] byteArray = digest.digest();
		return byteArrayToHex(byteArray);
	}

	private final static String byteArrayToHex(byte[] byteArray) {
		char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		char[] resultCharArray = new char[byteArray.length * 2];
		int index = 0;
		for (byte b : byteArray) {
			resultCharArray[index++] = hexDigits[b >>> 4 & 0xf];
			resultCharArray[index++] = hexDigits[b & 0xf];
		}
		return new String(resultCharArray).toLowerCase();
	}
	
	
	/**
	 * @comment: MD5加密三次
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:22:24
	 * @param value
	 * @return
	 */
	public final static String toMd5(final String value){
		return encoder(encoder(encoder(value)));
	}
	
	
	
	public static void main(String[] args) {
		String pwd = "123456";
		System.out.println(toMd5(pwd));
	}
}
