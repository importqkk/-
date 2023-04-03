package com.kh.semi.configuration;
import java.io.File;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component
// 컴포넌트 선언
@ConfigurationProperties(prefix = "custom.fileupload") 
// application.properties에서 custom.fileupload 설정을 가져오는 어노테이션
public class FileUploadProperties {

	private String path;
	
	public File getDirectory() {
		return new File(path);
	}
	
}
