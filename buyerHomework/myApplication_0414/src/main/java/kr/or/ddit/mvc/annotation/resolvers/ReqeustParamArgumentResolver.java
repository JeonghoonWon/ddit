package kr.or.ddit.mvc.annotation.resolvers;

import java.io.IOException;
import java.lang.reflect.Parameter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.ClassUtils;
import org.apache.commons.lang3.StringUtils;

/**
 * @RequestParam 어노테이션으로 설정된 핸들러 메소드 아큐먼트를 처리할 처리자
 *
 */
public class ReqeustParamArgumentResolver implements IHandlerMethodArgumentResolver {

	@Override
	public boolean isSupported(Parameter parameter) {
		Class<?> parameterType = parameter.getType();
		RequestParam annotation = parameter.getAnnotation(RequestParam.class);
		boolean supported = annotation != null
				&& (
						String.class.equals(parameterType)
						|| ClassUtils.isPrimitiveOrWrapper(parameterType)
					);
		return supported;
	}

	@Override
	public Object argumentResolve(Parameter parameter, HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		Class<?> parameterType = parameter.getType();
		RequestParam annotation = parameter.getAnnotation(RequestParam.class);
		String reqParamName = annotation.value();
		String reqParamValue = req.getParameter(reqParamName);
		Boolean required = annotation.required();
		if(required && StringUtils.isBlank(reqParamValue)) {
			throw new BadRequestException("필수 파라미터 누락");
		}else if(!required && StringUtils.isBlank(reqParamValue)){//필수적이지 않고 파라미터가 없을때
			reqParamValue = annotation.defaultValue();
		}
			
		Object parameterValue = null;
		try {
			if(byte.class.equals(parameterType) || Byte.class.equals(parameterValue)) {
				parameterValue = Byte.parseByte(reqParamValue);
			}else if(short.class.equals(parameterType) || Short.class.equals(parameterValue)){
				parameterValue = Short.parseShort(reqParamValue);
			}else if(int.class.equals(parameterType) || Integer.class.equals(parameterValue)){
				parameterValue = Integer.parseInt(reqParamValue);
			}else if(long.class.equals(parameterType) || Long.class.equals(parameterValue)){
				parameterValue = Long.parseLong(reqParamValue);
			}else if(float.class.equals(parameterType) || Float.class.equals(parameterValue)){
				parameterValue = Float.parseFloat(reqParamValue);
			}else if(double.class.equals(parameterType) || Double.class.equals(parameterValue)){
				parameterValue = Double.parseDouble(reqParamValue);
			}else if(boolean.class.equals(parameterType) || Boolean.class.equals(parameterValue)){
				parameterValue = Boolean.parseBoolean(reqParamValue);
			}else if(char.class.equals(parameterType) || Character.class.equals(parameterValue)){
				parameterValue = reqParamValue.charAt(0);
			}else {
				parameterValue = reqParamValue;
			}
			
			return parameterValue;
		}catch (Exception e) {
			throw new BadRequestException(e);
		}
	}
}