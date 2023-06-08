public class ExportToExcelParameters
{
    public string type { get; set; } = null;
    public string psaLocationValue { get; set; } = null;
    public string mduValue { get; set; } = null;
    public string sortByValue { get; set; } = null;
    public string streetValue { get; set; } = null;
    public string houseValue { get; set; } = null;
    public string marketValue { get; set; } = null;
    public string zipValue { get; set; } = null;
    public string prefixValue { get; set; } = null;
    public string marketTypeValue { get; set; } = null;
}

public class GetJsonDataParameters
{
    public string type { get; set; } = null;
    public string marketVariable { get; set; } = null;
    public string overallCatVariable { get; set; } = null;
    public string orderVariable { get; set; } = null;
    public string marketTypeVariable { get; set; } = null;
    public string groupVariable { get; set; } = null;
    public string zipVariable { get; set; } = null;
    public string CMAVariable { get; set; } = null;
    public string CountyVariable { get; set; } = null;
    public string LatVariable { get; set; } = null;
    public string LongVariable { get; set; } = null;
    public string PSAVariable { get; set; } = null;
    public string houseVariable { get; set; } = null;
    public string streetVariable { get; set; } = null;
    public string HouseNumber { get; set; } = null;
    public string StreetName { get; set; } = null;
    public string City { get; set; } = null;
    public string StateVariable { get; set; } = null;
    public string Zip { get; set; } = null;
    public string zipValue { get; set; } = null;
    public string prefixValue { get; set; } = null;
    public string houseValue { get; set; } = null;
    public string streetValue { get; set; } = null;
}

public class LogEventParameters
{
    public string logTableName { get; set; } = null;
    public string userID { get; set; } = null;
    public string eventType { get; set; } = null;
    public string logData { get; set; } = null;
    public string logJsonPayload { get; set; } = null;
}