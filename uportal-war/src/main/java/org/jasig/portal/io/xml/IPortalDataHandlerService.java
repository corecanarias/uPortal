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

package org.jasig.portal.io.xml;

import java.io.File;
import java.util.Set;

import javax.xml.transform.Result;
import javax.xml.transform.Source;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

/**
 * Service that can import, export and delete portal data.
 * 
 * @author Eric Dalquist
 * @version $Revision$
 */
public interface IPortalDataHandlerService {
    /**
     * Options that control behavior of batch import operations
     */
    public interface BatchImportOptions {
        /**
         * @return defaults to true
         */
        public boolean isRecursive();
        /**
         * @return defaults to true
         */
        public boolean isFailOnError();
        /**
         * @return defaults to true
         */
        public boolean isIngoreNonDataFiles();
    }
    
    /**
     * Import a batch of files from a directory.
     * 
     * @param directory Base directory to import from
     * @param pattern Optional ant path matcher pattern used for matching files to import. If not specified the default pattern set is used
     * @param options Optional set of options to better control the import
     */
    public void importData(File directory, String pattern, BatchImportOptions options);
    
    /**
     * Import data from the specified resource, uses a {@link ResourceLoader} find the data file
     */
    public void importData(String resource);
    
    /**
     * Import data from the specified resource
     */
    public void importData(Resource resource);
    
    /**
     * Import data from the specified source
     */
    public void importData(Source source);
    
    /**
     * @return All portal data types that can be exported
     */
    public Iterable<IPortalDataType> getExportPortalDataTypes();
    
    /**
     * @return All portal data types that can be deleted
     */
    public Iterable<IPortalDataType> getDeletePortalDataTypes();
    
    /**
     * @return All portal data for a specific portal data type, some types may return an empty set even if they contain data due size constraints.
     */
    public Iterable<? extends IPortalData> getPortalData(String typeId);
    
    /**
     * Export the portal data for the specified type and id writing it to the provided XML Transformer Result
     * 
     * @param typeId Type of the portal data to export
     * @param dataId Id of the data to export
     * @param result XML Result to write the exported data to
     * @return The recommended file name to use for the result 
     */
    public String exportData(String typeId, String dataId, Result result);
    
    /**
     * Export the portal data for the specified type and save it to the specified directory
     * 
     * @param typeId Type of the portal data to export
     * @param dataId Id of the data to export
     * @param directory Directory to save exported data to
     * @return True if the specified data was found, false if no data exists for the type and data ids
     */
    public boolean exportData(String typeId, String dataId, File directory);
    
    /**
     * Export all the portal data for each type and save it to the specified directory
     * 
     * @param typeIds TypeIds from {@link #getExportPortalDataTypes()} to export all data for
     * @param directory Directory to save exported data to
     */
    public void exportAllDataOfType(Set<String> typeIds, File directory);
    
    /**
     * Export all portal data for all data type and save it to the specified directory
     * 
     * @param directory Directory to save exported data to
     */
    public void exportAllData(File directory);

    /**
     * Delete the portal data for the specified type and id.
     * 
     * @param typeId id of the portal type to delete data from
     * @param dataId the id of the data to delete
     */
    public void deleteData(String typeId, String dataId);
}