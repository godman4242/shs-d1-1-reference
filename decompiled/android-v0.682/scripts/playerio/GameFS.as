package playerio
{
   public class GameFS
   {
      
      private static var maps:Object = {};
      
      private var gameId:String;
      
      public function GameFS(gameId:String, gameFSRedirectMap:String)
      {
         super();
         this.gameId = gameId;
         if(gameFSRedirectMap != null)
         {
            maps[gameId] = new UrlMap(gameFSRedirectMap);
         }
      }
      
      private static function getUrl(gameId:String, path:String, secure:Boolean = false) : String
      {
         var map:UrlMap = null;
         if(path.indexOf("/") != 0)
         {
            throw new Error("GameFS paths must be absolute and start with a slash (/). IE client.gameFS.getURL(\"/folder/file.extention\")",0);
         }
         if(maps != null && maps[gameId] != undefined)
         {
            map = UrlMap(maps[gameId]);
            return map.getUrl(path,secure);
         }
         return (secure ? "https" : "http") + "://r.playerio.com/r/" + gameId + path;
      }
      
      public function getUrl(path:String, secure:Boolean = false) : String
      {
         return GameFS.getUrl(gameId,path,secure);
      }
   }
}

class UrlMap
{
   
   private var baseUrl:String;
   
   private var secureBaseUrl:String;
   
   private var map:Object = null;
   
   public function UrlMap(gameFSRedirectMap:String)
   {
      var parts:Array = null;
      var i:int = 0;
      var part:String = null;
      super();
      if(gameFSRedirectMap != null && gameFSRedirectMap != "")
      {
         parts = gameFSRedirectMap.split("|");
         map = {};
         for(i = 0; i != parts.length; )
         {
            part = parts[i];
            if(part == "alltoredirect" || part == "cdnmap")
            {
               baseUrl = parts[i + 1];
            }
            else if(part == "alltoredirectsecure" || part == "cdnmapsecure")
            {
               secureBaseUrl = parts[i + 1];
            }
            else
            {
               map[part] = parts[i + 1];
            }
            i += 2;
         }
      }
   }
   
   public function getUrl(path:String, secure:Boolean) : String
   {
      if(map == null)
      {
         return (secure ? secureBaseUrl : baseUrl) + path;
      }
      if(map[path] != undefined)
      {
         return (secure ? secureBaseUrl : baseUrl) + map[path];
      }
      return (secure ? secureBaseUrl : baseUrl) + path;
   }
}
