package com.kh.semi.configuration;

import java.io.File;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix="custom.fileupload")
public class FileUploadProperties {
	private String path;
	
	public File getDirectory() {
		return new File(path);
	}
}
