package
{
   public class QueryManager extends QueryManagerBase
   {
      
      public static var instance:QueryManagerBase;
      
      public function QueryManager()
      {
         super();
         server = StatsManager.server;
         if(StatsManager.usePlayerIO)
         {
            instance = new QueryManagerPIO();
         }
         else
         {
            instance = this;
         }
      }
   }
}

