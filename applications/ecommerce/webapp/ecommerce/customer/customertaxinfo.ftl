<#--

Copyright 2001-2006 The Apache Software Foundation

Licensed under the Apache License, Version 2.0 (the "License"); you may not
use this file except in compliance with the License. You may obtain a copy of
the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
License for the specific language governing permissions and limitations
under the License.
-->
<#if partyTaxAuthInfoAndDetailList?exists>
    <#list partyTaxAuthInfoAndDetailList as partyTaxAuthInfoAndDetail>
        <div class="tabletext">
            <a href="<@ofbizUrl>deleteCustomerTaxAuthInfo?partyId=${partyId}&amp;taxAuthPartyId=${partyTaxAuthInfoAndDetail.taxAuthPartyId}&amp;taxAuthGeoId=${partyTaxAuthInfoAndDetail.taxAuthGeoId}&amp;fromDate=${partyTaxAuthInfoAndDetail.fromDate}</@ofbizUrl>" class="buttontext">X</a>
            [${partyTaxAuthInfoAndDetail.geoCode}] ${partyTaxAuthInfoAndDetail.geoName} (${partyTaxAuthInfoAndDetail.groupName}): ${uiLabelMap.PartyTaxId} [${partyTaxAuthInfoAndDetail.partyTaxId?default("N/A")}], ${uiLabelMap.PartyTaxIsExempt} [${partyTaxAuthInfoAndDetail.isExempt?default("N")}]
        </div>
    </#list>
    <div>
        <span class="tableheadtext">${uiLabelMap.PartyTaxAddInfo}:</span>
        <select name="taxAuthPartyGeoIds" class="selectBox">
          <option></option>
          <#list taxAuthorityAndDetailList as taxAuthorityAndDetail>
            <option value="${taxAuthorityAndDetail.taxAuthPartyId}::${taxAuthorityAndDetail.taxAuthGeoId}">[${taxAuthorityAndDetail.geoCode}] ${taxAuthorityAndDetail.geoName} (${taxAuthorityAndDetail.groupName?if_exists})</option>
          </#list>
        </select>
        <span class="tabletext">${uiLabelMap.CommonId}: </span><input type="text" name="partyTaxId" class="inputBox" size="12" maxlength="40"/>

        <#if productStore.showTaxIsExempt?default("Y") == "Y">
        <span class="tabletext">${uiLabelMap.PartyTaxIsExempt} </span><input type="checkbox" name="isExempt" class="inputBox" value="Y"/>
        <#else/>
        <input type="hidden" name="isExempt" value="N"/>
        </#if>
    </div>
</#if>
