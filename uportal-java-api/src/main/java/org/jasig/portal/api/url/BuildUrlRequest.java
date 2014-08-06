/**
 * Licensed to Jasig under one or more contributor license
 * agreements. See the NOTICE file distributed with this work
 * for additional information regarding copyright ownership.
 * Jasig licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a
 * copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.jasig.portal.api.url;

import java.util.Map;

import org.jasig.portal.api.sso.SsoTicket;

public class BuildUrlRequest {

	private Map<String, String> parameters;
	private String urlTemplateName;
	private SsoTicket ssoTicket;

	public BuildUrlRequest(Map<String, String> parameters,
			String urlTemplateName, SsoTicket ssoTicket) {
		this.urlTemplateName = urlTemplateName;
		this.parameters = parameters;
		this.ssoTicket = ssoTicket;
	}

	public Map<String, String> getParameters() {
		return parameters;
	}

	public String getUrlTemplateName() {
		return urlTemplateName;
	}

	public SsoTicket getSsoTicket() {
		return ssoTicket;
	}

	public void setParameters(Map<String, String> parameters) {
		this.parameters = parameters;
	}

	public void setUrlTemplateName(String urlTemplateName) {
		this.urlTemplateName = urlTemplateName;
	}

	public void setSsoTicket(SsoTicket ssoTicket) {
		this.ssoTicket = ssoTicket;
	}

}