<?xml version='1.0'?>
<!--

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

-->

<!--xsl:stylesheet xmlns:xsl='http://www.w3.org/XSL/Transform/1.0'-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="baseActionURL">index.jsp</xsl:param>
<xsl:param name="profileName">default profile</xsl:param>
<xsl:param name="locale">it_IT</xsl:param>

<xsl:template match="gpref">
<html>
<body>

<!-- header table -->
<form action="{$baseActionURL}" method="post">
<xsl:attribute name="action"><xsl:value-of select="$baseActionURL"/></xsl:attribute>
<input type="hidden" name="action" value="submitEditChoice"/>
<table width="100%" border="0"><tr><td align="left">nome del profilo: <xsl:value-of select="$profileName"/></td><td align="right">
<input type="submit" name="submit" value="manage"/>
<select name="userPreferencesAction">
<option selected="" value="layout">canali e cartelle</option>
<option value="gpref">preferenze globali</option>
<option value="manageProfiles">profili</option>
</select>
</td>
</tr></table>
</form>
<!-- end of the header table -->

<p align="center">Modifica i parametri dello stylesheet:</p>
<form method="post">
<xsl:attribute name="action"><xsl:value-of select="$baseActionURL"/></xsl:attribute>
<input type="hidden" name="action" value="submitEditValues"/>


<table border="1" cellpadding="5" cellspacing="0" align="center">
<tr><td><b>parameter</b></td><td><b>value</b></td><td><b>descrizione</b></td></tr>

<!-- eventually this should check if there are any parameters at all of this class before drawing a table row-->
<!-- process parametri della struttura dello stylesheet-->
<tr><td colspan="3" align="right">parametri della struttura dello stylesheet</td></tr>
<xsl:for-each select="structureparameters/parameter">
<xsl:call-template name="processParameter"/>
</xsl:for-each>

<!-- process parametri del tema dello stylesheet-->
<tr><td colspan="3" align="right">parametri del tema dello stylesheet</td></tr>
<xsl:for-each select="themeparameters/parameter">
<xsl:call-template name="processParameter"/>
</xsl:for-each>
</table>

<p align="center">
<input type="submit" name="submit" value="Salva"/>
<input type="submit" name="submit" value="Cancella"/>
</p>
</form>
</body>
</html>
</xsl:template>

<xsl:template name="processParameter">
<tr><td><xsl:value-of select="name"/></td>
<td><input type="text" name="{name}" value="{value}"/></td>
<td><xsl:value-of select="description"/></td>
</tr>
</xsl:template>

</xsl:stylesheet>