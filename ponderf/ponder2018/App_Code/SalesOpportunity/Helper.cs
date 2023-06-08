using System;
using ponder2018.SalesOpportunity;

namespace ponder2018.SalesOpportunity
{
    /// <summary>
    /// Summary desc for Helper 
    /// </summary>
    public class Helper
    {
        public static string GetExportToExcelQuery(ExportToExcelParameters myParams)
        {
            switch (myParams.type)
            {
                case "ExportToExcel_PSALocations":
                case "ExportToExcel_PSALocations_CMA":
                case "ExportToExcel_PSALocations_County":
                    {
                        return String.Format(Constants.EXPORT_TO_EXCEL_QUERY_DICTIONARY[myParams.type], myParams.psaLocationValue);
                    }
                case "ExportToExcel_PSALocationsAllCMA":
                case "ExportToExcel_PSALocationsAllCounty":
                case "ExportToExcel_PSALocationsAllZip":
                case "ExportToExcel_TopMDUsCMA":
                case "ExportToExcel_TopMDUsCounty":
                case "ExportToExcel_TopMDUsZIP":
                case "ExportToExcel_MDUAddressesCMA":
                case "ExportToExcel_MDUAddressesCounty":
                case "ExportToExcel_MDUAddressesZIP":
                    {
                        return String.Format(Constants.EXPORT_TO_EXCEL_QUERY_DICTIONARY[myParams.type], myParams.mduValue);
                    }
                case "ExportToExcel_SelectedMDUAddressesCMA":
                case "ExportToExcel_SelectedMDUAddressesCounty":
                case "ExportToExcel_SelectedMDUAddressesZIP":
                    {
                        return String.Format(Constants.EXPORT_TO_EXCEL_QUERY_DICTIONARY[myParams.type], myParams.mduValue, myParams.houseValue, myParams.prefixValue, myParams.streetValue, myParams.zipValue);
                    }
                case "ExportToExcel_AllCMAs":
                    {
                        return String.Format(Constants.EXPORT_TO_EXCEL_QUERY_DICTIONARY[myParams.type], myParams.marketValue, myParams.marketTypeValue, myParams.sortByValue);
                    }
                case "ExportToExcel_AllCounties":
                    {
                        return String.Format(Constants.EXPORT_TO_EXCEL_QUERY_DICTIONARY[myParams.type], myParams.marketValue, myParams.marketTypeValue, myParams.sortByValue);
                    }
                case "ExportToExcel_AllZips":
                    {
                        return String.Format(Constants.EXPORT_TO_EXCEL_QUERY_DICTIONARY[myParams.type], myParams.marketValue, myParams.sortByValue);
                    }
                default:
                    throw new InvalidOperationException("unknown type");
            }
        }

        public static string GetDataQuery(GetJsonDataParameters myParams)
        {
            switch (myParams.type)
            {
                case "Get_Store_Detail_Market":
                case "Get_Zip_Summary_Info":
                case "Get_Store_Detail_Region":
                case "Get_zip_theme_data":
                case "Get_Zip_Store_Detail_Market":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.marketVariable);
                    }
                case "Get_ZipTable_Data":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.marketVariable, myParams.overallCatVariable, myParams.orderVariable);
                    }
                case "Get_County_Summary_Info":
                    {
                        string WhereColumnName = "SALES_REGION";
                        if (myParams.marketTypeVariable == "MARKET") { WhereColumnName = "SALES_MARKET"; }
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], WhereColumnName, myParams.marketVariable);
                    }
                case "Get_CountyTable_Data":
                    {
                        string WhereColumnName = "SALES_REGION";
                        if (myParams.marketTypeVariable == "MARKET") { WhereColumnName = "SALES_MARKET"; }
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], WhereColumnName, myParams.marketVariable, myParams.overallCatVariable, myParams.orderVariable);
                    }
                case "Get_Store_Detail_National":
                    {
                        return Constants.DATA_QUERY_DICTIONARY[myParams.type];
                    }
                case "Get_CMA_Summary_Info":
                    {
                        string WhereColumnName = "SALES_REGION";
                        if (myParams.marketTypeVariable == "MARKET") { WhereColumnName = "SALES_MARKET"; }
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], WhereColumnName, myParams.marketVariable, WhereColumnName, myParams.marketVariable);
                    }
                case "Get_CMATable_Data":
                    {
                        string WhereColumnName = "SALES_REGION";
                        if (myParams.marketTypeVariable == "MARKET") { WhereColumnName = "SALES_MARKET"; }
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.overallCatVariable, WhereColumnName, myParams.marketVariable, WhereColumnName, myParams.marketVariable, myParams.orderVariable);
                    }
                case "Get_ZipModalTable_Data":
                    {
                        string orderWayVariable = "DESC";
                        if (myParams.orderVariable == "FIBER_PEN_SORT") { orderWayVariable = "ASC"; }
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.zipVariable, myParams.orderVariable, orderWayVariable);
                    }
                case "Get_CMAModalTable_Data":
                case "Get_CMA_PSA_Detail_Market":
                case "Get_CMA_MDU":
                case "showData_PSAAddressesCMA":
                case "showData_MDUAddressesCMA":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.CMAVariable);
                    }
                case "Get_CountyModalTable_Data":
                case "Get_County_PSA_Detail_Market":
                case "Get_County_MDU":
                case "showData_PSAAddressesCounty":
                case "showData_MDUAddressesCounty":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.CountyVariable);
                    }
                case "Get_cma_theme_data":
                    {
                        if (myParams.marketTypeVariable == "NATIONAL")
                        {
                            return Constants.DATA_QUERY_DICTIONARY["Get_cma_theme_data_national"];
                        }
                        else if (myParams.marketTypeVariable == "REGION")
                        {
                            return String.Format(Constants.DATA_QUERY_DICTIONARY["Get_cma_theme_data_region"], myParams.marketVariable, myParams.marketVariable);
                        }
                        else
                        {
                            return String.Format(Constants.DATA_QUERY_DICTIONARY["Get_cma_theme_data_default"], myParams.marketVariable, myParams.marketVariable, myParams.marketVariable);
                        }
                    }
                case "Get_county_theme_data":
                    {
                        if (myParams.marketTypeVariable == "REGION")
                        {
                            return String.Format(Constants.DATA_QUERY_DICTIONARY["Get_county_theme_data_region"], myParams.marketVariable);
                        }
                        else
                        {
                            return String.Format(Constants.DATA_QUERY_DICTIONARY["Get_county_theme_data_default"], myParams.marketVariable);
                        }
                    }
                case "Get_CMA_Store_Detail":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.CMAVariable, myParams.LatVariable, myParams.LatVariable, myParams.LongVariable, myParams.LongVariable);
                    }
                case "Get_County_Store_Detail":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.CountyVariable, myParams.LatVariable, myParams.LatVariable, myParams.LongVariable, myParams.LongVariable);
                    }
                case "Get_Zip_PSA_Detail_Market":
                case "Get_ZIP_MDU":
                case "showData_PSAAddresses":
                case "showData_MDUAddressesZip":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.zipVariable);
                    }
                case "showData_PSAAddressesCMAFromMap":
                case "showData_PSAAddressesCountyFromMap":
                case "showData_PSAAddressesZipFromMap":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.PSAVariable, myParams.PSAVariable);
                    }

                case "showData_MDUAddressesCMAFromMap":
                case "showData_MDUAddressesCMAFromTable":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.CMAVariable, myParams.houseValue, myParams.prefixValue, myParams.streetValue, myParams.zipValue);
                    }
                case "showData_MDUAddressesCountyFromMap":
                case "showData_MDUAddressesCountyFromTable":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.CountyVariable, myParams.houseValue, myParams.prefixValue, myParams.streetValue, myParams.zipValue);
                    }
                case "showData_MDUAddressesZipFromMap":
                case "showData_MDUAddressesZipFromTable":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.zipVariable, myParams.houseValue, myParams.prefixValue, myParams.streetValue, myParams.zipValue);
                    }
                case "showData_PSAAddressesCMAFromTable":
                case "showData_PSAAddressesCountyFromTable":
                case "showData_PSAAddressesFromTable":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.PSAVariable, myParams.PSAVariable);
                    }
                case "GetSearchAll":
                    {
                        string whereHouseNumber = "HOUSE_NUMBER LIKE UPPER('%" + myParams.HouseNumber + @"%')";
                        if (myParams.HouseNumber == "") { whereHouseNumber = "HOUSE_NUMBER LIKE ('%')"; }
                        string whereStreetName = "STREET_NAME LIKE UPPER('%" + myParams.StreetName + @"%')";
                        if (myParams.StreetName == "") { whereStreetName = "STREET_NAME LIKE ('%')"; }
                        string whereCity = "CITY = UPPER('" + myParams.City + @"')";
                        if (myParams.City == "") { whereCity = "CITY LIKE ('%')"; }
                        string whereState = "STATE LIKE UPPER('%" + myParams.StateVariable + @"%')";
                        if (myParams.StateVariable == "") { whereState = "STATE LIKE ('%')"; }
                        string whereZip = "ZIP LIKE UPPER('%" + myParams.Zip + @"%')";
                        if (myParams.Zip == "") { whereZip = "ZIP LIKE ('%')"; }
                        {
                            return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], whereHouseNumber, whereStreetName, whereCity, whereState, whereZip);
                        }
                    }
                case "GetSearchModalData":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.PSAVariable);
                    }
                case "GetPSAEventData":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.PSAVariable);
                    }
                case "Get_Future_PSAs":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.marketVariable);
                    }
                case "Get_Future_PSAs_Data":
                    {
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.zipVariable);
                    }
                case "Get_Top25_PSAs":
                case "Get_Top25_MDUs":
                    {   
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], myParams.marketVariable);
                    }
                case "Get_CopperUpgrade_Data":
                    {
                        if (!string.IsNullOrEmpty(myParams.CMAVariable))
                        {
                            return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], "CMA='" + myParams.CMAVariable + "'");
                        }
                        else if (!string.IsNullOrEmpty(myParams.CountyVariable))
                        {
                            return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], "COUNTY_FIPS='" + myParams.CountyVariable + "'");
                        }
                        return String.Format(Constants.DATA_QUERY_DICTIONARY[myParams.type], "ZIP='" + myParams.zipVariable + "'");
                    }
                default:
                    throw new InvalidOperationException("unknown type");
            }
        }
    }
}
