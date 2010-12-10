<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<%@ include file="/WEB-INF/jsp/include.jsp" %>

<!-- START: VALUES BEING PASSED FROM BACKEND -->
<portlet:actionURL var="basicInfoUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="basicInfo"/>
</portlet:actionURL>
<portlet:actionURL var="chooseTypeUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="chooseType"/>
</portlet:actionURL>
<portlet:actionURL var="configModeUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="configMode"/>
</portlet:actionURL>
<portlet:actionURL var="setParametersUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="setParameters"/>
</portlet:actionURL>
<portlet:actionURL var="chooseGroupUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="chooseGroup"/>
</portlet:actionURL>
<portlet:actionURL var="chooseCategoryUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="chooseCategory"/>
</portlet:actionURL>
<portlet:actionURL var="lifecycleUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="lifecycle"/>
</portlet:actionURL>
<portlet:actionURL var="cancelUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="cancel"/>
</portlet:actionURL>
<portlet:actionURL var="saveUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="save"/>
</portlet:actionURL>
<portlet:actionURL var="saveAndConfigUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="saveAndConfig"/>
</portlet:actionURL>
<!-- END: VALUES BEING PASSED FROM BACKEND -->

<!--
PORTLET DEVELOPMENT STANDARDS AND GUIDELINES
| For the standards and guidelines that govern
| the user interface of this portlet
| including HTML, CSS, JavaScript, accessibilty,
| naming conventions, 3rd Party libraries
| (like jQuery and the Fluid Skinning System)
| and more, refer to:
| http://www.ja-sig.org/wiki/x/cQ
-->

<!-- Portlet -->
<div class="fl-widget portlet ptl-mgr view-review" role="section">

	<!-- Portlet Titlebar -->
  <div class="fl-widget-titlebar titlebar portlet-titlebar" role="sectionhead">
  	<h2 class="title" role="heading"><c:out value="${ fn:escapeXml(channel.title )}"/></h2>
  </div> <!-- end: portlet-titlebar -->
  
	<!-- Portlet Content -->
  <div class="fl-widget-content content portlet-content" role="main">
  
  	<!-- General Configuration Section -->
    <div class="portlet-section" role="region">
    	<div class="titlebar">
        <h3 class="title" role="heading"><spring:message code="configuration"/></h3>
        <div class="options">
          <a href="${ basicInfoUrl }"><span><spring:message code="edit.configuration"/></span></a>
        </div>
      </div>
      <div class="content">
      
        <table class="portlet-table" summary="<spring:message code="this.table.lists.portlet.configurations"/>">
          <thead>
            <tr>
              <th><spring:message code="configuration"/></th>
              <th><spring:message code="value"/></th>
            <tr>
          </thead>
          <tfoot></tfoot>
          <tbody>
            <tr>
              <td class="fl-text-align-right"><spring:message code="portlet.title"/>:</td>
              <td><a href="${ basicInfoUrl }" title="<c:out value="${ fn:escapeXml(channel.title )}"/>" class="pa-edit"><c:out value="${ fn:escapeXml(channel.title )}"/></a></td>
            </tr>
            <tr>
              <td class="fl-text-align-right"><spring:message code="portlet.name"/>:</td>
              <td><a href="${ basicInfoUrl }" title="<c:out value="${ fn:escapeXml(channel.name )}"/>" class="pa-edit"><c:out value="${ fn:escapeXml(channel.name )}"/></a></td>
            </tr>
            <tr>
              <td class="fl-text-align-right"><spring:message code="portlet.functional.name"/>:</td>
              <td><a href="${ basicInfoUrl }" title="<c:out value="${ fn:escapeXml(channel.fname )}"/>" class="pa-edit"><c:out value="${ fn:escapeXml(channel.fname )}"/></a></td>
            </tr>
            <tr>
              <td class="fl-text-align-right"><spring:message code="portlet.description"/>:</td>
              <td><a href="${ basicInfoUrl }" title="<c:out value="${ fn:escapeXml(channel.description )}"/>" class="pa-edit"><c:out value="${ fn:escapeXml(channel.description )}"/></a></td>
            </tr> 
            <tr>
              <td class="fl-text-align-right"><spring:message code="portlet.timeout"/>:</td>
              <td><a href="${ basicInfoUrl }" title="<c:out value="${ fn:escapeXml(channel.timeout )}"/>" class="pa-edit"><c:out value="${ fn:escapeXml(channel.timeout )}"/></a></td>
            </tr>
            <tr>
              <td class="fl-text-align-right"><spring:message code="portlet.secure"/>:</td>
              <td><a href="${ basicInfoUrl }" title="<c:out value="${ fn:escapeXml(channel.secure )}"/>" class="pa-edit"><c:out value="${ fn:escapeXml(channel.secure )}"/></a></td>
            </tr> 
            <tr>
              <td class="fl-text-align-right"><spring:message code="portlet.type"/>:</td>
              <td>
                <c:forEach items="${ channelTypes }" var="type">
                  <c:if test="${ type.key.id == channel.typeId }">
                    <a href="${ chooseTypeUrl }" title="${ fn:escapeXml(channel.typeId )}" class="pa-edit"><c:out value="${ fn:escapeXml(type.key.name )}"/></a>
                    <c:if test="${ type.key.id == -1 }">
                      <a href="${ chooseTypeUrl }" title="${ fn:escapeXml(channel.typeId )}" class="pa-edit">(<c:out value="${ fn:escapeXml(channel.javaClass )}"/>)</a>
                    </c:if>
                  </c:if>
                </c:forEach>
              </td>
            </tr>
            <tr>
              <td class="fl-text-align-right"><spring:message code="edit"/>:</td>
              <td><a href="${ basicInfoUrl }" title="${ fn:escapeXml(channel.editable )}" class="pa-edit">${ fn:escapeXml(channel.editable )}</a></td>
            </tr> 
            <tr>
              <td class="fl-text-align-right"><spring:message code="help"/>:</td>
              <td><a href="${ basicInfoUrl }" title="${ fn:escapeXml(channel.hasHelp )}" class="pa-edit">${ fn:escapeXml(channel.hasHelp )}</a></td>
            </tr>  
            <tr>
              <td class="fl-text-align-right"><spring:message code="about"/>:</td>
              <td><a href="${ basicInfoUrl }" title="${ fn:escapeXml(channel.hasAbout )}" class="pa-edit">${ fn:escapeXml(channel.hasAbout )}</a></td>
            </tr>
          </tbody>
        </table>
        
      </div>
    </div>
    <!-- END: General Configuration Section -->
    
    
    <!-- Channel Parameters Section -->
    <div class="portlet-section" role="region">
      <div class="titlebar">
        <h3 class="title" role="heading"><spring:message code="parameters"/></h3>
        <div class="options">
          <a href="${ setParametersUrl }"><span><spring:message code="edit.parameters"/></span></a>
        </div>
      </div>
      <div class="content">
      
        <table class="portlet-table" summary="<spring:message code="this.table.lists.portlet.configurations"/>">
          <thead>
            <tr>
              <th><spring:message code="configuration"/></th>
              <th><spring:message code="value"/></th>
              <th><spring:message code="user.editable"/></th>
            </tr>
          </thead>
          <tfoot></tfoot>
          <tbody>
            <c:forEach items="${ cpd.params.steps }" var="step">
              <c:forEach items="${ step.parameters }" var="parameter">
                <c:if test="${ (parameter.modify != 'subscribeOnly' && parameter.type.display != 'hidden') && ((channel.parameters[parameter.name].value != null && channel.parameters[parameter.name].value != '') || (fn:startsWith(parameter.name, 'PORTLET.') && channel.portletPreferences[fn:replace(parameter.name, 'PORTLET.', '')].value != null && channel.portletPreferences[fn:replace(parameter.name, 'PORTLET.', '')].value != '')) }">
                  <tr>
                    <td class="fl-text-align-right"><c:out value="${ fn:escapeXml(parameter.label )}"/>:</td>
                    <td>
                        <a href="${ setParametersUrl }" class="pa-edit">
                            <c:choose>
	                            <c:when test="${ fn:startsWith(parameter.name, 'PORTLET.') }">
	                               <c:set var="values" value="${channel.portletPreferences[fn:replace(parameter.name, 'PORTLET.', '')].value}"/>
	                               <c:out value="${ fn:escapeXml(fn:length(values) > 0 ? values[0] : '' )}"/>
	                            </c:when>
	                            <c:otherwise>
    	                            <c:out value="${ fn:escapeXml(channel.parameters[parameter.name].value )}"/>
	                            </c:otherwise>
                            </c:choose>
                        </a>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${ fn:startsWith(parameter.name, 'PORTLET.') }">
                                ${ fn:escapeXml(channel.portletPreferencesOverrides[fn:replace(parameter.name, 'PORTLET.', '')].value ? 'X' : '' )}
                            </c:when>
                            <c:otherwise>
                                ${ fn:escapeXml(channel.parameterOverrides[parameter.name].value ? 'X' : '' )}
                            </c:otherwise>
                        </c:choose>
                    </td>
                  </tr>
                </c:if>
              </c:forEach>
              <c:forEach items="${ step.arbitraryParameters }" var="arbitraryParam">
                <c:forEach items="${ arbitraryParam.paramNamePrefixes }" var="prefix">
                  <c:forEach items="${ channel.parameters }" var="channelParam">
                    <c:if test="${ fn:startsWith(channelParam.key, prefix) }">
                      <tr>
                        <td class="fl-text-align-right"><c:out value="${ fn:escapeXml(channelParam.key )}"/>:</td>
                        <td><a href="${ setParametersUrl }" class="pa-edit"><c:out value="${ fn:escapeXml(channelParam.value )}"/></a></td>
                        <td>${ fn:escapeXml(channel.parameterOverrides[parameter.name].value ? 'X' : '' )}</td>
                      </tr>
                    </c:if>
                  </c:forEach>
                </c:forEach>
              </c:forEach>
            </c:forEach>
          </tbody>
        </table>
        
      </div>
    </div>
    <!-- END: Channel Parameters Section -->
    
    <c:if test="${ channel.portlet }">
      <!-- Portlet.xml Preferences Section -->
      <div class="portlet-section" role="region">
        <div class="titlebar">
          <h3 class="title" role="heading"><spring:message code="portlet.xml.preferences"/></h3>
        </div>
        <div class="content">
          <table class="portlet-table">
            <thead>
              <tr>
                <th><spring:message code="preferences"/></th>
                <th><spring:message code="values"/></th>
                <th><spring:message code="user.editable"/></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${ portlet.portletPreferences.portletPreferences }" var="pref">
                <tr class="${ up:containsKey(channel.portletPreferences, pref.name) ? 'override-preference' : '' }">
                  <td class="preference-name">${ fn:escapeXml(pref.name )}</td>
                  <td>
                    <c:forEach var="value" items="${ pref.values }">
                        <div>${ fn:escapeXml(value )}</div>
                    </c:forEach>
                  </td>
                  <td>${ fn:escapeXml(!pref.readOnly )}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
      <!-- END: Portlet.xml Preferences Section -->
    
      <!-- Portlet Preferences Section -->
      <div class="portlet-section" role="region">
        <div class="titlebar">
          <h3 class="title" role="heading"><spring:message code="preferences"/></h3>
          <div class="options">
            <c:choose>
              <c:when test="${supportsConfig and channel.id >= 0}">
                <a href="${ configModeUrl }"><span><spring:message code="edit.rich.configuration"/></span></a>
              </c:when>
              <c:otherwise>
                <a href="${ setParametersUrl }"><span><spring:message code="edit.preferences"/></span></a>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        <div class="content">
        
          <table class="portlet-table" summary="<spring:message code="this.table.lists.portlet.configurations"/>">
            <thead>
              <tr>
                <th><spring:message code="preferences"/></th>
                <th><spring:message code="values"/></th>
                <th><spring:message code="user.editable"/></th>
              </tr>
            </thead>
            <tfoot></tfoot>
            <tbody>
              <c:forEach items="${ arbitraryPreferenceNames }" var="name">
                <c:set var="paramPath" value="portletPreferences['${ name }'].value"/>
                <c:set var="overrideParamPath" value="portletPreferencesOverrides['${ name }'].value"/>
                  <tr>
                    <td class="preference-name">${ fn:escapeXml(name )}</td>
                    <td>
                        <c:forEach items="${ channel.portletPreferences[name].value }" var="val">
                         <div>${ fn:escapeXml(val )}</div>
                        </c:forEach>
                    </td>
                    <td>${ fn:escapeXml(channel.portletPreferencesOverrides[name].value )}</td>
                  </tr>
              </c:forEach>
            </tbody>
          </table>
          
        </div>
      </div>
      <!-- END: Portlet Preferences Section -->
    </c:if>
  	
    <!-- Portlet Section -->
    <div class="portlet-section" role="region">
      <div class="titlebar">
        <h3 class="title" role="heading"><spring:message code="categories"/></h3>
        <div class="options">
          <a href="${ chooseCategoryUrl }"><span><spring:message code="edit.categories"/></span></a>
        </div>
      </div>
      <div class="content">

        <ul class="category-member">
          <c:forEach items="${ channel.categories }" var="category">
            <li><a href="${ chooseCategoryUrl }"><c:out value="${ fn:escapeXml(category.name )}"/></a></li>
          </c:forEach>
        </ul>
        
      </div>
    </div> <!-- end: portlet-section -->
    
    <!-- Portlet Section -->
    <div class="portlet-section" role="region">
      <div class="titlebar">
        <h3 class="title" role="heading"><spring:message code="groups"/></h3>
        <div class="options">
          <a href="${ chooseGroupUrl }"><span><spring:message code="edit.groups"/></span></a>
        </div>
      </div>
      <div class="content">
      
        <ul class="group-member">
        <c:forEach items="${ channel.groups }" var="group">
          <li><a href="${ chooseGroupUrl }"><c:out value="${ fn:escapeXml(group.name )}"/></a></li>
        </c:forEach>
        </ul>
        
      </div>
    </div> <!-- end: portlet-section -->
    
    <!-- Portlet Section -->
    <div class="portlet-section" role="region">
      <div class="titlebar">
        <h3 class="title" role="heading"><spring:message code="lifecycle.management"/></h3>
        <div class="options">
          <a href="${ lifecycleUrl }"><span><spring:message code="edit.lifecycle"/></span></a>
        </div>
      </div>
      <div class="content">
      
        <table class="portlet-table" summary="<spring:message code="portlet.lifecycle.information"/>">
          <thead>
            <tr>
              <th><spring:message code="option"/></th>
              <th><spring:message code="value"/></th>
            <tr>
          </thead>
          <tfoot></tfoot>
          <tbody>
            <tr>
              <td class="fl-text-align-right"><spring:message code="state"/></td>
              
              <%-- The following is temporary and will be replaced when backend
                   work for portlet lifecycle management is done. --%>
              <td><a href="${ lifecycleUrl }" title="<spring:message code="lifecycle.name.${ channel.lifecycleState }"/>" class="pa-edit"><spring:message code="lifecycle.name.${ channel.lifecycleState }"/></a></td>
            </tr>
            <c:if test="${ (channel.lifecycleState != 'PUBLISHED' && channel.lifecycleState != 'EXPIRED') && channel.publishDate != null }">
	            <tr>
	              <td class="fl-text-align-right"><spring:message code="auto.publish.date.time"/></td>
	              <fmt:formatDate type="both" value="${channel.publishDate}" var="publishDate"/>
	              <td><a href="${ lifecycleUrl }" title="${ fn:escapeXml(publishDate )}" class="pa-edit">${ fn:escapeXml(publishDate )}</a></td>
	            </tr>
            </c:if>
            <c:if test="${ channel.lifecycleState != 'EXPIRED' && channel.expirationDate != null }">
	            <tr>
	              <td class="fl-text-align-right"><spring:message code="auto.expire.date.time"/></td>
	              <fmt:formatDate type="both" value="${channel.expirationDate}" var="expirationDate"/>
	              <td><a href="${ lifecycleUrl }" title="${ fn:escapeXml(expirationDate )}" class="pa-edit">${ fn:escapeXml(expirationDate )}</a></td>
	            </tr>
            </c:if>
          </tbody>
        </table>
        
      </div>
    </div> <!-- end: portlet-section -->
    
		<!-- Buttons -->
    <div class="buttons">
    	<a class="button primary" href="${ saveUrl }"><spring:message code="save"/></a>
    	<c:if test="${supportsConfig and channel.id < 0}">
    	   <a class="button primary" href="${ saveAndConfigUrl }"><spring:message code="save.and.configure"/></a>
    	</c:if>
    	<a class="button" href="${ cancelUrl }"><spring:message code="cancel"/></a>
    </div>
    
  </div> <!-- end: portlet-content -->
  
</div> <!-- end: portlet -->