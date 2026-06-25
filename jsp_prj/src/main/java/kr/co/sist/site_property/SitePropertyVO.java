package kr.co.sist.site_property;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@ToString
public class SitePropertyVO {
	private String protocol;	
	private String serverName;	
	private String serverPort;	
	private String contextRoot;	
	private String uploadDir;	
	private String apiKey;	
	private String siteInfo;	
}
