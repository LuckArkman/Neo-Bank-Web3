namespace Bank.MobileUI.Services
{
    public static class LoggerService
    {
        public static void LogError(Exception ex, string context)
        {
            var properties = new Dictionary<string, string> { { "Context", context } };
            //Crashes.TrackError(ex, properties);
        }
    }
}
